import 'package:flutter/material.dart';

enum DeviceType { mobile, tablet, desktop }

class DeviceUtils {
  static DeviceType getDeviceType(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width >= 1024) return DeviceType.desktop;
    if (width >= 600) return DeviceType.tablet;

    return DeviceType.mobile;
  }
}
