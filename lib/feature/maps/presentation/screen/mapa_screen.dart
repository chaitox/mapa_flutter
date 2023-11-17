import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mapas/feature/maps/presentation/bloc/location/location_bloc.dart';
import 'package:mapas/feature/maps/presentation/views/btn_follow_user.dart';
import 'package:mapas/feature/maps/presentation/views/btn_location.dart';
import 'package:mapas/feature/maps/presentation/views/map_view.dart';

class MapasScreen extends StatefulWidget {
  const MapasScreen({super.key});

  @override
  State<MapasScreen> createState() => _MapasScreenState();
}

class _MapasScreenState extends State<MapasScreen> {
  late LocationBloc locationBloc;
  @override
  void initState() {
    locationBloc = context.read<LocationBloc>();
    locationBloc
      ..getCurrentPosition()
      ..startFollowingUser();
    locationBloc.stream.listen((locationEvent) {
      if (locationEvent.lastKnownLocation == null) return;
      print(
        'ubicacion: lat: ${locationEvent.lastKnownLocation?.latitude} lng: ${locationEvent.lastKnownLocation?.latitude}',
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    locationBloc.stopFollowingUser();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: const Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BtnFollowUser(),
          BtnCurrentLocation(),
        ],
      ),
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          if (state.lastKnownLocation == null) {
            return const Center(
              child: Text(
                'Espere por favor...',
              ),
            );
          }
          return SingleChildScrollView(
            child: Stack(
              children: [
                MapView(
                  initialPosition: state.lastKnownLocation!,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
