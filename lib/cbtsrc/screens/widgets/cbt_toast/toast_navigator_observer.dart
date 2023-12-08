import 'package:flutter/material.dart';

class CboToastNavigatorObserverProxy {
  void Function(Route<dynamic> route, Route<dynamic>? previousRoute)? didPush;
  void Function(Route<dynamic> newRoute, Route<dynamic>? oldRoute)? didReplace;
  void Function(Route<dynamic> route, Route<dynamic>? previousRoute)? didRemove;
  void Function(Route<dynamic> route, Route<dynamic>? previousRoute)? didPop;

  CboToastNavigatorObserverProxy(
      {this.didPush, this.didReplace, this.didRemove, this.didPop});

  CboToastNavigatorObserverProxy.all(VoidCallback leavePageCallback) {
    didPush = (_, __) => leavePageCallback();
    didReplace = (_, __) => leavePageCallback();
    didRemove = (_, __) => leavePageCallback();
    didPop = (_, __) => leavePageCallback();
  }
}

///If your project has multiple [Navigator], please add the BotToastNavigatorObserver to [Navigator.observers]
class CboToastNavigatorObserver extends NavigatorObserver {
  static final List<CboToastNavigatorObserverProxy> _leavePageCallbacks = [];

  static bool debugInitialization = false;

  CboToastNavigatorObserver() {
    assert(() {
      debugInitialization = true;
      return true;
    }());
  }

  static void register(
      CboToastNavigatorObserverProxy botToastNavigatorObserverProxy) {
    assert(debugInitialization, """
    Please initialize!
    cbtpri:
    BotToastInit(
      child:MaterialApp(
      title: 'Xxxx Demo',
      navigatorObservers: [BotToastNavigatorObserver()],
      home: XxxxPage(),
    ));
    """);
    _leavePageCallbacks.add(botToastNavigatorObserverProxy);
  }

  static void unregister(
      CboToastNavigatorObserverProxy botToastNavigatorObserverProxy) {
    _leavePageCallbacks.remove(botToastNavigatorObserverProxy);
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    final copy = _leavePageCallbacks.toList(growable: false);
    for (CboToastNavigatorObserverProxy observerProxy in copy) {
      observerProxy.didPush?.call(route, previousRoute);
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    final copy = _leavePageCallbacks.toList(growable: false);
    for (CboToastNavigatorObserverProxy observerProxy in copy) {
      observerProxy.didReplace?.call(newRoute!, oldRoute);
    }
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    final copy = _leavePageCallbacks.toList(growable: false);
    for (CboToastNavigatorObserverProxy observerProxy in copy) {
      observerProxy.didRemove?.call(route, previousRoute);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    final copy = _leavePageCallbacks.toList(growable: false);
    for (CboToastNavigatorObserverProxy observerProxy in copy) {
      observerProxy.didPop?.call(route, previousRoute);
    }
  }
}
