import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mapas/feature/maps/presentation/bloc/gps/gps_bloc.dart';
import 'package:mapas/feature/maps/presentation/screen/mapa_screen.dart';

class GpsAccessScreen extends StatelessWidget {
  const GpsAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<GpsBloc, GpsState>(
          builder: (context, state) {
            print('control de estado $state');
            if (state.isGpsEnabled && state.isGpsPermissionGranted) {
              return const MapasScreen();
            }
            return state.isGpsEnabled
                ? const _AccessButton()
                : const _EnableGpsmessage();
          },
        ),
      ),
    );
  }
}

class _AccessButton extends StatelessWidget {
  const _AccessButton();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'No hay acceso al gps',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w300,
          ),
        ),
        MaterialButton(
          color: Colors.black,
          shape: const StadiumBorder(),
          splashColor: Colors.transparent,
          onPressed: () {
            context.read<GpsBloc>().askGpsAccess();
          },
          child: const Text(
            'Solicitar acceso',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class _EnableGpsmessage extends StatelessWidget {
  const _EnableGpsmessage();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Debe habilitar el gps',
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
