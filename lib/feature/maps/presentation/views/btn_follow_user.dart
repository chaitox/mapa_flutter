import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapas/feature/maps/presentation/bloc/blocs.dart';
import 'package:mapas/feature/maps/presentation/bloc/map/map_bloc.dart';

class BtnFollowUser extends StatelessWidget {
  const BtnFollowUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        maxRadius: 25,
        child: IconButton(
          icon: Icon(
            context.watch<MapBloc>().state.isFollowingUser
                ? Icons.directions_run_rounded
                : Icons.hail_rounded,
            color: Colors.black87,
          ),
          onPressed: () {
            if (context.read<MapBloc>().state.isFollowingUser) {
              context.read<MapBloc>().add(OnStopFollowingUserEvent());
            } else {
              context.read<MapBloc>().add(OnStartFollowingUserEvent());
            }
          },
        ),
      ),
    );
  }
}
