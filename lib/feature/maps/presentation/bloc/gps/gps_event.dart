part of 'gps_bloc.dart';

abstract class GpsEvent extends Equatable {
  const GpsEvent();

  @override
  List<Object> get props => [];
}

class GpsAndPermissionEvent extends GpsEvent {
  const GpsAndPermissionEvent({
    required this.isGpsEnabled,
    required this.isPermissionGranted,
  });
  final bool isGpsEnabled;
  final bool isPermissionGranted;
}
