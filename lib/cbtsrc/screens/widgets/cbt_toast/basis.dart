import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

///Toast's close function, calling will close the corresponding Toast in advance
typedef CancelFunc = void Function();
typedef ToastBuilder = Widget Function(CancelFunc cancelFunc);
typedef FutureFunc = Future<void> Function();
typedef PopTestFunc = bool Function();

typedef WrapWidget = Widget Function(CancelFunc cancelFunc, Widget widget);
typedef WrapAnimation = Widget Function(
    AnimationController controller, CancelFunc cancelFunc, Widget widget);

class TickerProviderImpl extends TickerProvider {
  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker(onTick);
  }
}

///This enumeration determines how Toast handles the physical return key
enum BackButtonBehavior {
  ///Do nothing
  none,

  ///Intercept this click event
  ignore,

  ///Intercept this click event and turn off Toast
  close
}

//Please do not adjust the order!!
//The front is the main direction, and the back is the alignment.
//top Left, is to hope to be on top, and left aligned to the target
enum PreferDirection {
  topLeft,
  topCenter,
  topRight,
  bottomLeft,
  bottomCenter,
  bottomRight,
  leftTop,
  leftCenter,
  leftBottom,
  rightTop,
  rightCenter,
  rightBottom,
}
