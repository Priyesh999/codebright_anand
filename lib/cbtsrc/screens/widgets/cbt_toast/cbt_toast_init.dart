import 'package:flutter/material.dart';

import 'basis.dart';
import 'cbt_toast_manager.dart';

final GlobalKey<CboToastManagerState> _key = GlobalKey<CboToastManagerState>();

CboToastManagerState? get botToastManager {
  assert(_key.currentState != null);
  return _key.currentState;
}

class CboToastWidgetsBindingObserver with WidgetsBindingObserver {
  CboToastWidgetsBindingObserver._() {
    _listener = <PopTestFunc>[];
    WidgetsBinding.instance!.addObserver(this);
  }

  List<PopTestFunc>? _listener;

  static final CboToastWidgetsBindingObserver _singleton =
      CboToastWidgetsBindingObserver._();

  static CboToastWidgetsBindingObserver get singleton => _singleton;

  VoidCallback registerPopListener(PopTestFunc popTestFunc) {
    assert(_listener != null);
    _listener!.add(popTestFunc);
    return () {
      _listener!.remove(popTestFunc);
    };
  }

  @override
  Future<bool> didPopRoute() async {
    if (_listener!.isNotEmpty) {
      final clone = _listener!.reversed.toList(growable: false);
      for (PopTestFunc popTest in clone) {
        if (popTest()) return true;
      }
    }
    return super.didPopRoute();
  }
}

// ignore: non_constant_identifier_names
TransitionBuilder CboToastInit() {
  //Make sure to initialize in advance to ensure the order of WidgetsBinding.instance.addObserver(this);

  //ignore: unnecessary_statements
  CboToastWidgetsBindingObserver._singleton;
  return (_, Widget? child) {
    return CboToastManager(key: _key, child: child);
  };
}
