import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mapas/feature/maps/presentation/bloc/blocs.dart';
import 'package:mapas/feature/maps/presentation/bloc/map/map_bloc.dart';

class BtnToggleUserRoute extends StatelessWidget {
  const BtnToggleUserRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        maxRadius: 25,
        child: IconButton(
          icon: const Icon(
            Icons.more_horiz_rounded,
            color: Colors.black87,
          ),
          onPressed: () {
            context.read<MapBloc>().add(OnToggleUserRoute());
          },
        ),
      ),
    );
  }
}
