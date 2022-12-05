import 'dart:async';
import 'dart:developer';

import 'package:buskeit/core/core.dart';
import 'package:buskeit/locator.dart';
import 'package:flutter/material.dart';

LocationService locationServices = getIt<LocationService>();

class BusMgmtProvider with ChangeNotifier {
  bool _location = false;
  bool get location => _location;
  // late StreamProvider

  toggleLocation() {
    _location = !_location;
    notifyListeners();
  }
}

class Location {
  late StreamController<String> _streamController;
  get stream => _streamController.stream;

  initState() {
    _streamController = StreamController<String>();
    update();
  }

  dispose() {
    _streamController.close();
  }

  update() {
    locationServices.getCurrentPosition().then((value) {
      log('value: $value');
      _streamController.add(value);
    });
  }

  // void update() {
  //   _location.
  // }
  // Location({
  //   required this.emitTime,
  //   required this.currentLocation,
  // });

  // final String currentLocation;
  // final int emitTime;

  // Stream<String> get location async* {
  //   var i = emitTime;
  //   while (i < 40) {
  //     await Future.delayed(const Duration(seconds: 1), () {
  //       i++;
  //     });
  //     yield 'The driver is currently in $i';
  //   }
  // }
}
