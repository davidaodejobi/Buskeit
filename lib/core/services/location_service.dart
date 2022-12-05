import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService with ChangeNotifier {
  late double _longitude;
  late double _latitude;
  late String _currentLocality;
  late String _currentCountry;

  String get currentLocality => _currentLocality;
  String get currentCountry => _currentCountry;

  Future<String> getCurrentPosition() async {
    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.bestForNavigation)
        .then((Position position) async {
      _latitude = position.latitude;
      _longitude = position.longitude;

      Placemark place = await placemarkFromCoordinates(
        _latitude,
        _longitude,
      ).then((value) => value.first);

      _currentLocality = place.locality!;
      log('_currentLocality: $_currentLocality');

      // await _getAddressFromLatLng();

      notifyListeners();
      return _currentLocality;
    });
  }

  Future getPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        log('Location permissions are denied');
      } else if (permission == LocationPermission.deniedForever) {
        log("'Location permissions are permanently denied");
      } else {
        log("GPS Location service is granted");
      }
    } else {
      log("GPS Location permission granted.");
      return permission;
    }
  }
}
