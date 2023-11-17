import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapas/core/notification/custom_snackbar.dart';
import 'package:mapas/feature/maps/presentation/bloc/blocs.dart';
import 'package:mapas/feature/maps/presentation/bloc/map/map_bloc.dart';

class BtnCurrentLocation extends StatelessWidget {
  const BtnCurrentLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        maxRadius: 25,
        child: IconButton(
          icon: const Icon(
            Icons.my_location_outlined,
            color: Colors.black87,
          ),
          onPressed: () {
            final location =
                context.read<LocationBloc>().state.lastKnownLocation;
            if (location == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                CustomSnackbar(
                  message: 'Buscando ubicación...',
                ),
              );
            } else {
              context.read<MapBloc>().moveCamera(
                    context.read<LocationBloc>().state.lastKnownLocation!,
                  );
            }
          },
        ),
      ),
    );
  }
}
