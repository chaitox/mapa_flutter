import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapas/feature/maps/presentation/bloc/blocs.dart';
import 'package:mapas/feature/maps/presentation/screen/gps_access_screen.dart';
import 'package:mapas/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const GpsAccessScreen(),
    );
  }
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GpsBloc(),
        ),
        BlocProvider(
          create: (context) => LocationBloc(),
        ),
        //aqui podemos usar get_it para injectar dependencias
        BlocProvider(
          create: (context) => MapBloc(
            locationBloc: context.read<LocationBloc>(),
          ),
        ),
      ],
      child: const App(),
    );
  }
}
