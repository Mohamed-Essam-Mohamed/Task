import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class CheckInternet {
  static ValueNotifier<bool> isConnected = ValueNotifier<bool>(true);
  void init() {
    log("init check internet");
    (Connectivity().onConnectivityChanged.listen(getStatusInternet));
  }

  void getStatusInternet(List<ConnectivityResult> result) {
    if (result.contains(ConnectivityResult.wifi) ||
        result.contains(ConnectivityResult.mobile)) {
      isConnected = ValueNotifier<bool>(true);
      log("value ${isConnected.value}");
    } else {
      isConnected = ValueNotifier<bool>(false);
      log("value ${isConnected.value}");
    }
  }
}
