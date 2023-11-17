part of 'map_bloc.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

class OnMapInitialzedEvent extends MapEvent {
  const OnMapInitialzedEvent(this.controller);
  final GoogleMapController controller;
}

class OnStopFollowingUserEvent extends MapEvent {}

class OnStartFollowingUserEvent extends MapEvent {}

class UpdateUserPolylineEvent extends MapEvent {
  const UpdateUserPolylineEvent(this.userLocations);
  final List<LatLng> userLocations;
}

class OnToggleUserRoute extends MapEvent {}
