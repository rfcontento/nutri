
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

enum LocationStatus {
  success,
  disabled,
  denied,
  failed,
  timeout,
  aproximate,
}


class LocationModel {
  LocationStatus status;
  Position? position;

  LatLng? get latLng =>
      position != null ? LatLng(position!.latitude, position!.longitude) : null;

  LocationModel(this.status, this.position);
}
