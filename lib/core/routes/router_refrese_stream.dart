import 'dart:async';

import 'package:flutter/material.dart';

class RouterRefreseStream extends ChangeNotifier {
  late final StreamSubscription _subscription;

  RouterRefreseStream(Stream stream) {
    _subscription = stream.listen((_) {
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
