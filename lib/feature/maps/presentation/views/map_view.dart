import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mapas/feature/maps/presentation/bloc/map/map_bloc.dart';

class MapView extends StatelessWidget {
  const MapView({required this.initialPosition, super.key});
  final LatLng initialPosition;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,

      /// Listener para detectar el movimiento del usuario
      /// sobre el mapa y detener el seguimiento del usuario
      child: Listener(
        onPointerMove: (event) {
          context.read<MapBloc>().add(OnStopFollowingUserEvent());
        },
        child: GoogleMap(
          onMapCreated: (controller) => context.read<MapBloc>().add(
                OnMapInitialzedEvent(controller),
              ),
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          initialCameraPosition: CameraPosition(
            target: initialPosition,
            zoom: 15,
          ),
        ),
      ),
    );
  }
}
