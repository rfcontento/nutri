import 'dart:async';
import 'dart:ui' as lib_ui;

import 'package:driver/domain/entities/location_model.dart';
import 'package:driver/ui/controller/location_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeController with ChangeNotifier {
  final LocationProvider locationProvider = LocationProvider();
  LatLng? mapPosition;
  GoogleMapController? _mapController;
  GoogleMapController get mapController => _mapController!;
  Map<MarkerId, Marker>? markers = {};
  bool? _isOpenCard = false;
  StreamSubscription<Position>? locationSubscription;


  bool get isOpenCard => _isOpenCard!;

  set isOpenCard(bool value) {
    _isOpenCard = value;
    notifyListeners();
  }

  set mapController(GoogleMapController value) {
    _mapController = value;
    notifyListeners();
  }

  initHome() async {
    final location = await locationProvider.initLocationService(timeoutTime: 5);
    if (location.status == LocationStatus.success) {
      mapPosition = location.latLng;
      _startListeningLocation();
    }
  }


  Future<BitmapDescriptor> createMarker(String urlAssets) async {
    final Uint8List markerIcon = await getBytesFromAsset(urlAssets, 130);
    return BitmapDescriptor.bytes(markerIcon, width: 50, height: 50);
  }

  Future<BitmapDescriptor> createMarkerUser(String urlAssets) async {
    final Uint8List markerIcon = await getBytesFromAsset(urlAssets, 130);
    return BitmapDescriptor.bytes(markerIcon, width: 80, height: 80);
  }

  static Future<Uint8List> getBytesFromAsset(String path, int? width) async {
    ByteData? data = await rootBundle.load(path);
    lib_ui.Codec codec = await lib_ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      targetWidth: width,
    );
    lib_ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(
      format: lib_ui.ImageByteFormat.png,
    ))!.buffer.asUint8List();
  }

  void initMapController(GoogleMapController controller) {
    _mapController = controller;
  }

  void _startListeningLocation() {
    locationSubscription = locationProvider.notifications.listen((Position position) {
      addMarker(LatLng(position.latitude, position.longitude));
      moveCamera(LatLng(position.latitude, position.longitude));
    });
  }

  void moveCamera(LatLng position) {
    _mapController?.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: position, zoom: 15.0),
    ));
  }



  void addMarker(LatLng position) {
    markers ={};
    Marker? marker = markers![const MarkerId("id_marker")];
    createMarker("assets/icons/pin.png").then((pinMarker) {

      if (marker == null) {
        markers![const MarkerId("id_marker")] = Marker(
            markerId: const MarkerId("id_marker"),
            position: LatLng(position.latitude, position.longitude),
            icon: pinMarker
        );
        notifyListeners();
      }
    });
  }


}
