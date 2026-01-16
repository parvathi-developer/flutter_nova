import 'package:flutter/material.dart';

enum DeviceType { Mobile, Tablet, Desktop }

class DeviceUtils {
  static DeviceType getDeviceType(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width >= 1024) return DeviceType.Desktop;
    if (width >= 600) return DeviceType.Tablet;

    return DeviceType.Mobile;
  }
}
