import 'dart:async';

import 'package:flutter/material.dart';

import 'basis.dart';
import 'cbt_toast_init.dart';
import 'keyboard_safe_area.dart';
import 'keyboard_visibility.dart';
import 'toast_navigator_observer.dart';
import 'toast_widget/toast_widget.dart';

/*Area chart
  _________________________________
|          MainContent            |
|                                 |
|                                 |
|      ___________________        |
|     |                   |       |
|     |    ToastContent   |       |
|     |___________________|       |
|_________________________________|
 */

///When the [ToastBuilder] method generates a widget, please make sure that the generated widget background does not absorb the click event
///For cbtpri [Scaffold],[Material] will occupy the entire parent space by default,
///And it will absorb events (even if it is transparent), see [material.dart->_RenderInkFeatures class->hitTestSelf method] for specific cbtpris
///If you really want to generate, you can consider using [IgnorePointer].
///If you don’t follow the rules, some functions will fail, such as [allowClick] function will fail
class CboToast {
  static const String textKey = '_textKey';
  static const String notificationKey = '_notificationKey';
  static const String loadKey = '_loadKey';
  static const String attachedKey = '_attachedKey';
  static const String defaultKey = '_defaultKey';

  static final Map<String, List<CancelFunc>> cacheCancelFunc = {
    textKey: [],
    notificationKey: [],
    loadKey: [],
    attachedKey: [],
    defaultKey: [],
  };

  ///Display simple notification Toast
  ///
  ///[title] title
  ///[subTitle] subtitle
  ///[closeIcon] close button icon
  ///[enableSlideOff] Can slide to delete
  ///[hideCloseButton] Whether to hide the close button
  ///[align] Alignment of ToastContent area in MainContent area
  ///[dismissDirections] Can slide to close the direction
  ///[onTap] Click to notify the callback of Toast
  ///[onLongPress] Long press notification Toast callback
  ///[wrapAnimation] Please see [showAnimationWidget.wrapAnimation], the default value is null
  ///[wrapToastAnimation] Please see [showAnimationWidget.wrapToastAnimation], the default value is [notificationAnimation]
  ///[animationDuration] Please see [showAnimationWidget.animationDuration]
  ///[animationReverseDuration] Please see [showAnimationWidget.animationReverseDuration]
  ///[duration] Please see [showEnhancedWidget.duration]
  ///[crossPage] Please see [showEnhancedWidget.crossPage]
  ///[onlyOne] Please see [showEnhancedWidget.onlyOne]
  ///[onClose] Please see [showEnhancedWidget.onClose]
  ///[backButtonBehavior] Please see [showEnhancedWidget.backButtonBehavior]
  ///[backgroundColor] defaults to Theme.of(context).cardColor
  ///[borderRadius] defaults to ThemeData.cardTheme.shape
  ///[enableKeyboardSafeArea] Please see [showEnhancedWidget.enableKeyboardSafeArea]
  static CancelFunc showSimpleNotification(
      {required String title,
      String? subTitle,
      TextStyle? titleStyle,
      TextStyle? subTitleStyle,
      WrapAnimation? wrapAnimation,
      WrapAnimation? wrapToastAnimation = notificationAnimation,
      GestureTapCallback? onTap,
      GestureLongPressCallback? onLongPress,
      Color? backgroundColor,
      double? borderRadius,
      Alignment align = const Alignment(0, -0.99),
      List<DismissDirection> dismissDirections = const [
        DismissDirection.horizontal,
        DismissDirection.up
      ],
      Icon? closeIcon,
      Duration duration = const Duration(seconds: 2),
      Duration? animationDuration,
      Duration? animationReverseDuration,
      BackButtonBehavior? backButtonBehavior,
      VoidCallback? onClose,
      bool enableKeyboardSafeArea = true,
      bool enableSlideOff = true,
      bool hideCloseButton = false,
      bool crossPage = true,
      bool onlyOne = true}) {
    return showNotification(
        wrapAnimation: wrapAnimation!,
        wrapToastAnimation: wrapToastAnimation!,
        align: align,
        dismissDirections: dismissDirections,
        duration: duration,
        enableKeyboardSafeArea: enableKeyboardSafeArea,
        backgroundColor: backgroundColor!,
        borderRadius: borderRadius!,
        animationDuration: animationDuration!,
        backButtonBehavior: backButtonBehavior!,
        animationReverseDuration: animationReverseDuration!,
        enableSlideOff: enableSlideOff,
        onTap: onTap!,
        onLongPress: onLongPress!,
        onClose: onClose!,
        onlyOne: onlyOne,
        crossPage: crossPage,
        title: (_) => Text(title, style: titleStyle),
        subtitle: subTitle == null
            ? null
            : (_) => Text(subTitle, style: subTitleStyle),
        trailing: hideCloseButton
            ? null
            : (cancel) => IconButton(
                icon: closeIcon ?? Icon(Icons.cancel), onPressed: cancel));
  }

  ///Display a standard notification Toast
  ///
  ///[leading]_[title]_[subtitle]_[trailing]_[contentPadding] Please see [ListTile]
  ///[enableSlideOff] Can slide to delete
  ///[align] Alignment of ToastContent area in MainContent area
  ///[dismissDirections] Can slide to close the direction
  ///[onTap] Click to notify the callback of Toast
  ///[onLongPress] Long press notification Toast callback
  ///[wrapAnimation] Please see [showAnimationWidget.wrapAnimation], the default value is null
  ///[wrapToastAnimation] Please see [showAnimationWidget.wrapToastAnimation], the default value is [notificationAnimation]
  ///[animationDuration] Please see [showAnimationWidget.animationDuration]
  ///[animationReverseDuration] Please see [showAnimationWidget.animationReverseDuration]
  ///[duration] Please see [showEnhancedWidget.duration]
  ///[onlyOne] Please see [showEnhancedWidget.onlyOne]
  ///[crossPage] Please see [showEnhancedWidget.crossPage]
  ///[onClose] Please see [showEnhancedWidget.onClose]
  ///[backButtonBehavior] Please see [showEnhancedWidget.backButtonBehavior]
  ///[backgroundColor] defaults to Theme.of(context).cardColor
  ///[borderRadius] defaults to ThemeData.cardTheme.shape
  ///[enableKeyboardSafeArea] Please see [showEnhancedWidget.enableKeyboardSafeArea]
  static CancelFunc showNotification(
      {ToastBuilder? leading,
      ToastBuilder? title,
      ToastBuilder? subtitle,
      ToastBuilder? trailing,
      WrapAnimation? wrapAnimation,
      WrapAnimation wrapToastAnimation = notificationAnimation,
      GestureTapCallback? onTap,
      Color? backgroundColor,
      double? borderRadius,
      GestureLongPressCallback? onLongPress,
      Alignment align = const Alignment(0, -0.99),
      List<DismissDirection> dismissDirections = const [
        DismissDirection.horizontal,
        DismissDirection.up
      ],
      BackButtonBehavior? backButtonBehavior,
      Duration duration = const Duration(seconds: 2),
      Duration? animationDuration,
      Duration? animationReverseDuration,
      EdgeInsetsGeometry? contentPadding,
      VoidCallback? onClose,
      bool enableKeyboardSafeArea = true,
      bool enableSlideOff = true,
      bool crossPage = true,
      bool onlyOne = true}) {
    return showCustomNotification(
        wrapAnimation: wrapAnimation!,
        wrapToastAnimation: wrapToastAnimation,
        align: align,
        dismissDirections: dismissDirections,
        enableSlideOff: enableSlideOff,
        enableKeyboardSafeArea: enableKeyboardSafeArea,
        onlyOne: onlyOne,
        backButtonBehavior: backButtonBehavior!,
        crossPage: crossPage,
        onClose: onClose!,
        duration: duration,
        animationDuration: animationDuration!,
        animationReverseDuration: animationReverseDuration!,
        toastBuilder: (cancel) {
          return Card(
            color: backgroundColor,
            shape: borderRadius == null
                ? null
                : RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
            child: ListTile(
                onTap: onTap,
                onLongPress: onLongPress,
                contentPadding: contentPadding,
                leading: leading?.call(cancel),
                title: title?.call(cancel),
                subtitle: subtitle?.call(cancel),
                trailing: trailing?.call(cancel)),
          );
        });
  }

  ///Display a custom notification Toast
  ///
  ///[toastBuilder] The builder function that generates the Widget that needs to be displayed
  ///[enableSlideOff] Can slide to delete
  ///[align] Alignment of ToastContent area in MainContent area
  ///[dismissDirections] Can slide to close the direction
  ///[wrapAnimation] Please see [showAnimationWidget.wrapAnimation], the default value is null
  ///[wrapToastAnimation] Please see [showAnimationWidget.wrapToastAnimation], the default value is [notificationAnimation]
  ///[animationDuration] Please see [showAnimationWidget.animationDuration]
  ///[animationReverseDuration] Please see [showAnimationWidget.animationReverseDuration]
  ///[duration] Please see [showEnhancedWidget.duration]
  ///[onlyOne] Please see [showEnhancedWidget.onlyOne]
  ///[crossPage] Please see [showEnhancedWidget.crossPage]
  ///[onClose] Please see [showEnhancedWidget.onClose]
  ///[backButtonBehavior] Please see [showEnhancedWidget.backButtonBehavior]
  ///[enableKeyboardSafeArea] Please see [showEnhancedWidget.enableKeyboardSafeArea]
  static CancelFunc showCustomNotification(
      {required ToastBuilder toastBuilder,
      WrapAnimation? wrapAnimation,
      WrapAnimation? wrapToastAnimation = notificationAnimation,
      Alignment align = const Alignment(0, -0.99),
      List<DismissDirection> dismissDirections = const [
        DismissDirection.horizontal,
        DismissDirection.up
      ],
      Duration duration = const Duration(seconds: 2),
      Duration? animationDuration,
      Duration? animationReverseDuration,
      VoidCallback? onClose,
      BackButtonBehavior? backButtonBehavior,
      bool enableKeyboardSafeArea = true,
      bool enableSlideOff = true,
      bool crossPage = true,
      bool onlyOne = true}) {
    return showAnimationWidget(
        crossPage: crossPage,
        allowClick: true,
        clickClose: false,
        ignoreContentClick: false,
        enableKeyboardSafeArea: enableKeyboardSafeArea,
        onlyOne: onlyOne,
        onClose: onClose!,
        duration: duration,
        backButtonBehavior: backButtonBehavior!,
        animationDuration:
            animationDuration ?? const Duration(milliseconds: 256),
        animationReverseDuration: animationReverseDuration!,
        wrapAnimation: wrapAnimation!,
        wrapToastAnimation: (controller, cancel, child) {
          if (wrapToastAnimation != null) {
            child = wrapToastAnimation(controller, cancel, child);
          }
          child = Align(alignment: align, child: child);

          return SafeArea(child: child);
        },
        toastBuilder: (cancelFunc) => NotificationToast(
            child: toastBuilder(cancelFunc),
            dismissDirections: dismissDirections,
            slideOffFunc: enableSlideOff ? cancelFunc : null),
        groupKey: notificationKey);
  }

  ///Display a standard text Toast
  ///
  ///[text] The text to be displayed
  ///[contentColor] ToastContent area background color
  ///[borderRadius] ToastContent area rounded corners
  ///[textStyle] font style
  ///[contentPadding] Inner padding of ToastContent area
  ///[align] Alignment of ToastContent area in MainContent area
  ///[wrapAnimation] Please see [showAnimationWidget.wrapAnimation], the default value is null
  ///[wrapToastAnimation] Please see [showAnimationWidget.wrapToastAnimation], the default value is [textAnimation]
  ///[animationDuration] Please see [showAnimationWidget.animationDuration]
  ///[animationReverseDuration] Please see [showAnimationWidget.animationReverseDuration]
  ///[backgroundColor] Please see [showEnhancedWidget.backgroundColor]
  ///[duration] Please see [showEnhancedWidget.duration]
  ///[onlyOne] Please see [showEnhancedWidget.onlyOne]
  ///[clickClose] Please see [showEnhancedWidget.clickClose]
  ///[crossPage] Please see [showEnhancedWidget.crossPage]
  ///[onClose] Please see [showEnhancedWidget.onClose]
  ///[backButtonBehavior] Please see [showEnhancedWidget.backButtonBehavior]
  ///[enableKeyboardSafeArea] Please see [showEnhancedWidget.enableKeyboardSafeArea]
  static CancelFunc showText({
    required String text,
    WrapAnimation? wrapAnimation,
    WrapAnimation wrapToastAnimation = textAnimation,
    Color backgroundColor = Colors.transparent,
    Color contentColor = Colors.black54,
    BorderRadiusGeometry borderRadius =
        const BorderRadius.all(Radius.circular(8)),
    TextStyle textStyle = const TextStyle(fontSize: 17, color: Colors.white),
    Alignment align = const Alignment(0, 0.8),
    EdgeInsetsGeometry contentPadding =
        const EdgeInsets.only(left: 14, right: 14, top: 5, bottom: 7),
    Duration duration = const Duration(seconds: 2),
    Duration? animationDuration,
    Duration? animationReverseDuration,
    BackButtonBehavior? backButtonBehavior,
    VoidCallback? onClose,
    bool enableKeyboardSafeArea = true,
    bool clickClose = false,
    bool crossPage = true,
    bool onlyOne = true,
  }) {
    return showCustomText(
        wrapAnimation: wrapAnimation,
        wrapToastAnimation: wrapToastAnimation,
        duration: duration,
        animationDuration: animationDuration,
        animationReverseDuration: animationReverseDuration,
        crossPage: crossPage,
        backgroundColor: backgroundColor,
        clickClose: clickClose,
        backButtonBehavior: backButtonBehavior,
        onClose: onClose,
        enableKeyboardSafeArea: enableKeyboardSafeArea,
        ignoreContentClick: true,
        onlyOne: onlyOne,
        align: align,
        toastBuilder: (_) => TextToast(
              contentPadding: contentPadding,
              contentColor: contentColor,
              borderRadius: borderRadius,
              textStyle: textStyle,
              text: text,
            ));
  }

  ///Display a custom text Toast
  ///
  ///[toastBuilder] The builder function that generates the Widget that needs to be displayed
  ///[align] Alignment of ToastContent area in MainContent area
  ///[wrapAnimation] Please see [showAnimationWidget.wrapAnimation], the default value is null
  ///[wrapToastAnimation] Please see [showAnimationWidget.wrapToastAnimation], the default value is [textAnimation]
  ///[animationDuration] Please see [showAnimationWidget.animationDuration]
  ///[animationReverseDuration] Please see [showAnimationWidget.animationReverseDuration]
  ///[ignoreContentClick] Please see [showEnhancedWidget.ignoreContentClick]
  ///[duration] Please see [showEnhancedWidget.duration]
  ///[onlyOne] Please see [showEnhancedWidget.onlyOne]
  ///[clickClose] Please see [showEnhancedWidget.clickClose]
  ///[crossPage] Please see [showEnhancedWidget.crossPage]
  ///[backgroundColor] Please see [showEnhancedWidget.backgroundColor]
  ///[onClose] Please see [showEnhancedWidget.onClose]
  ///[backButtonBehavior] Please see [showEnhancedWidget.backButtonBehavior]
  ///[enableKeyboardSafeArea] Please see [showEnhancedWidget.enableKeyboardSafeArea]
  static CancelFunc showCustomText(
      {required ToastBuilder toastBuilder,
      WrapAnimation? wrapAnimation,
      WrapAnimation wrapToastAnimation = textAnimation,
      Alignment align = const Alignment(0, 0.8),
      Color backgroundColor = Colors.transparent,
      Duration duration = const Duration(seconds: 2),
      Duration? animationDuration,
      Duration? animationReverseDuration,
      VoidCallback? onClose,
      BackButtonBehavior? backButtonBehavior,
      bool enableKeyboardSafeArea = true,
      bool crossPage = true,
      bool clickClose = false,
      bool ignoreContentClick = false,
      bool onlyOne = false}) {
    return showAnimationWidget(
        groupKey: textKey,
        clickClose: clickClose,
        allowClick: true,
        enableKeyboardSafeArea: enableKeyboardSafeArea,
        onlyOne: onlyOne,
        crossPage: crossPage,
        ignoreContentClick: ignoreContentClick,
        backgroundColor: backgroundColor,
        backButtonBehavior: backButtonBehavior,
        onClose: onClose,
        duration: duration,
        animationDuration:
            animationDuration ?? const Duration(milliseconds: 256),
        animationReverseDuration: animationReverseDuration,
        wrapAnimation: wrapAnimation,
        wrapToastAnimation: (controller, cancel, child) {
          child = wrapToastAnimation(controller, cancel, child);

          child = Align(alignment: align, child: child);

          return SafeArea(child: child);
        },
        toastBuilder: toastBuilder);
  }

  ///Display a standard loading Toast
  ///
  ///[align] Alignment of ToastContent area in MainContent area
  ///[wrapAnimation] Please see [showAnimationWidget.wrapAnimation], the default value is [loadingAnimation]
  ///[wrapToastAnimation] Please see [showAnimationWidget.wrapToastAnimation], the default value is null
  ///[animationDuration] Please see [showAnimationWidget.animationDuration]
  ///[animationReverseDuration] Please see [showAnimationWidget.animationReverseDuration]
  ///[duration] Please see [showEnhancedWidget.duration]
  ///[allowClick] Please see [showEnhancedWidget.allowClick]
  ///[clickClose] Please see [showEnhancedWidget.clickClose]
  ///[crossPage] Please see [showEnhancedWidget.crossPage]
  ///[backgroundColor] Please see [showEnhancedWidget.backgroundColor]
  ///[onClose] Please see [showEnhancedWidget.onClose]
  ///[backButtonBehavior] Please see [showEnhancedWidget.backButtonBehavior]
  ///[enableKeyboardSafeArea] Please see [showEnhancedWidget.enableKeyboardSafeArea]
  static CancelFunc showLoading({
    WrapAnimation wrapAnimation = loadingAnimation,
    WrapAnimation? wrapToastAnimation,
    Alignment align = Alignment.center,
    BackButtonBehavior? backButtonBehavior,
    bool crossPage = true,
    bool clickClose = false,
    bool allowClick = false,
    bool enableKeyboardSafeArea = true,
    VoidCallback? onClose,
    Duration? duration,
    Duration? animationDuration,
    Duration? animationReverseDuration,
    Color backgroundColor = Colors.black26,
  }) {
    return showCustomLoading(
        wrapAnimation: wrapAnimation,
        wrapToastAnimation: wrapToastAnimation!,
        align: align,
        enableKeyboardSafeArea: enableKeyboardSafeArea,
        backButtonBehavior: backButtonBehavior!,
        toastBuilder: (_) => const LoadingWidget(),
        clickClose: clickClose,
        allowClick: allowClick,
        crossPage: crossPage,
        ignoreContentClick: true,
        onClose: onClose!,
        duration: duration!,
        animationDuration: animationDuration!,
        animationReverseDuration: animationReverseDuration!,
        backgroundColor: backgroundColor);
  }

  ///Display a custom loading Toast
  ///
  ///[toastBuilder] The builder function that generates the Widget that needs to be displayed
  ///[align] Alignment of ToastContent area in MainContent area
  ///[wrapAnimation] Please see [showAnimationWidget.wrapAnimation], the default value is [loadingAnimation]
  ///[wrapToastAnimation] Please see [showAnimationWidget.wrapToastAnimation], the default value is null
  ///[animationDuration] Please see [showAnimationWidget.animationDuration]
  ///[animationReverseDuration] Please see [showAnimationWidget.animationReverseDuration]
  ///[ignoreContentClick] Please see [showEnhancedWidget.ignoreContentClick]
  ///[duration] Please see [showEnhancedWidget.duration]
  ///[allowClick] Please see [showEnhancedWidget.allowClick]
  ///[clickClose] Please see [showEnhancedWidget.clickClose]
  ///[crossPage] Please see [showEnhancedWidget.crossPage]
  ///[backgroundColor] Please see [showEnhancedWidget.backgroundColor]
  ///[onClose] Please see [showEnhancedWidget.onClose]
  ///[backButtonBehavior] Please see [showEnhancedWidget.backButtonBehavior]
  ///[enableKeyboardSafeArea] Please see [showEnhancedWidget.enableKeyboardSafeArea]
  static CancelFunc showCustomLoading({
    required ToastBuilder toastBuilder,
    WrapAnimation wrapAnimation = loadingAnimation,
    WrapAnimation? wrapToastAnimation,
    Alignment align = Alignment.center,
    BackButtonBehavior? backButtonBehavior,
    bool clickClose = false,
    bool allowClick = false,
    bool ignoreContentClick = false,
    bool crossPage = false,
    bool enableKeyboardSafeArea = true,
    VoidCallback? onClose,
    Duration? duration,
    Duration? animationDuration,
    Duration? animationReverseDuration,
    Color backgroundColor = Colors.black26,
  }) {
    return showAnimationWidget(
        groupKey: loadKey,
        enableKeyboardSafeArea: enableKeyboardSafeArea,
        toastBuilder: toastBuilder,
        backButtonBehavior: backButtonBehavior!,
        animationDuration:
            animationDuration ?? const Duration(milliseconds: 300),
        animationReverseDuration: animationReverseDuration!,
        wrapAnimation: wrapAnimation,
        wrapToastAnimation: (controller, cancel, child) {
          if (wrapToastAnimation != null) {
            child = wrapToastAnimation(controller, cancel, child);
          }
          child = Align(alignment: align, child: child);
          return SafeArea(child: child);
        },
        onClose: onClose!,
        clickClose: clickClose,
        allowClick: allowClick,
        crossPage: crossPage,
        ignoreContentClick: ignoreContentClick,
        onlyOne: false,
        duration: duration!,
        backgroundColor: backgroundColor);
  }

  ///This method is generally used in dispose to prevent exceptions when the developer did not take the initiative to close or request the api
  ///Causing the CancelFunc method not to be executed and so on, causing the user to be unable to click on the app
  static void closeAllLoading() {
    //Removing in this way will not trigger the closing animation
    removeAll(loadKey);
  }

  ///Display a positioning Toast
  ///This method can be displayed around a Widget (usually a Button) or a given offset
  ///
  ///[attachedBuilder] The builder function that generates the Widget that needs to be displayed
  ///[targetContext] target Widget (usually a button), usually use [Builder] package to get BuildContext
  ///[target] target [Offset], the offset is calculated using the upper left corner of the screen as the origin
  ///[target] and [targetContext] can only choose one
  ///[verticalOffset] The vertical offset is related to [preferDirection], it will act in different directions according to different directions
  ///[horizontalOffset] The horizontal offset is related to [preferDirection], it will act in different directions according to different directions
  ///[preferDirection] Preference direction, if space permits, it will be displayed there
  ///[enableSafeArea] If true, toast will ensure that it will not be displayed on the app status bar (meaning it is safe), false otherwise
  ///[wrapAnimation] Please see [showAnimationWidget.wrapAnimation], the default value is null
  ///[wrapToastAnimation] Please see [showAnimationWidget.wrapToastAnimation], the default value is [attachedAnimation]
  ///[animationDuration] Please see [showAnimationWidget.animationDuration]
  ///[animationReverseDuration] Please see [showAnimationWidget.animationReverseDuration]
  ///[duration] Please see [showEnhancedWidget.duration]
  ///[ignoreContentClick] Please see [showEnhancedWidget.ignoreContentClick]
  ///[onlyOne] Please see [showEnhancedWidget.onlyOne]
  ///[allowClick] Please see [showEnhancedWidget.allowClick]
  ///[onClose] Please see [showEnhancedWidget.onClose]
  ///[enableKeyboardSafeArea] Please see [showEnhancedWidget.enableKeyboardSafeArea]
  static CancelFunc showAttachedWidget(
      {required ToastBuilder attachedBuilder,
      WrapAnimation? wrapAnimation,
      WrapAnimation? wrapToastAnimation = attachedAnimation,
      BuildContext? targetContext,
      Offset? target,
      Color backgroundColor = Colors.transparent,
      double verticalOffset = 0.0,
      double horizontalOffset = 0.0,
      Duration? duration,
      Duration? animationDuration,
      Duration? animationReverseDuration,
      PreferDirection? preferDirection,
      VoidCallback? onClose,
      bool ignoreContentClick = false,
      bool onlyOne = false,
      bool allowClick = true,
      bool enableKeyboardSafeArea = true,
      bool? enableSafeArea}) {
    assert(verticalOffset >= 0.0, 'must be a positive number');
    assert(horizontalOffset >= 0.0, 'must be a positive number');
    assert(!(targetContext != null && target != null),
        'targetContext and target cannot coexist');
    assert(targetContext != null || target != null,
        'targetContext and target must exist one');

    Rect targetRect;
    if (target == null) {
      RenderObject? renderObject = targetContext!.findRenderObject();
      if (renderObject is RenderBox) {
        final position = renderObject.localToGlobal(Offset.zero);
        targetRect = Rect.fromLTWH(position.dx, position.dy,
            renderObject.size.width, renderObject.size.height);
      } else {
        throw Exception(
            'context.findRenderObject() return result must be RenderBox class');
      }
    } else {
      targetRect = Rect.fromLTWH(target.dx, target.dy, 0, 0); //Dot rectangle
    }
    return showAnimationWidget(
        allowClick: allowClick,
        clickClose: true,
        groupKey: attachedKey,
        crossPage: false,
        onlyOne: onlyOne,
        onClose: onClose!,
        enableKeyboardSafeArea: enableKeyboardSafeArea,
        backgroundColor: backgroundColor,
        ignoreContentClick: ignoreContentClick,
        animationDuration:
            animationDuration ?? const Duration(milliseconds: 150),
        animationReverseDuration: animationReverseDuration!,
        duration: duration!,
        wrapAnimation: wrapAnimation!,
        wrapToastAnimation: (controller, cancel, child) => KeyboardVisibility(
              onKeyboardVisibilityChanged: (open) {
                if (open) {
                  cancel();
                }
              },
              child: CustomSingleChildLayout(
                  delegate: PositionDelegate(
                      target: targetRect,
                      verticalOffset: verticalOffset,
                      horizontalOffset: horizontalOffset,
                      enableSafeArea: enableSafeArea ?? true,
                      preferDirection: preferDirection!),
                  child: wrapToastAnimation != null
                      ? wrapToastAnimation(controller, cancel, child)
                      : child),
            ),
        toastBuilder: attachedBuilder);
  }

  ///Show Toast using Animation
  ///Please see for use:
  ///[CboToast.showCustomNotification]
  ///[CboToast.showCustomText]
  ///[CboToast.showCustomLoading]
  ///[CboToast.showAttachedWidget]
  ///
  ///[toastBuilder] The builder function that generates the Widget that needs to be displayed
  ///[animationDuration] The duration of the forward animation, its meaning is equivalent to [AnimationController.duration], it is worth noting that it is recommended not to exceed [duration]
  ///[animationReverseDuration] The duration of the reverse animation, its meaning is equivalent to [AnimationController.reverseDuration]
  ///
  ///[wrapAnimation] wraps the animation of the MainContent area, can be used for custom animation, if it is null, it means no animation is needed,
  ///Using this function does not mean that you must use animation, you can do some additional packaging widget processing
  ///
  ///[wrapToastAnimation] wraps the animation of the ToastContent area, which can be used for custom animation, if it is null, it means no animation is required.
  ///Using this function does not mean that you must use animation, you can do some additional packaging widget processing
  ///
  ///[key] Please see [showEnhancedWidget.key]
  ///[groupKey] Please see [showEnhancedWidget.groupKey]
  ///[crossPage] Please see [showEnhancedWidget.crossPage]
  ///[allowClick] Please see [showEnhancedWidget.allowClick]
  ///[clickClose] Please see [showEnhancedWidget.clickClose]
  ///[ignoreContentClick] Please see [showEnhancedWidget.ignoreContentClick]
  ///[onlyOne] Please see [showEnhancedWidget.onlyOne]
  ///[backgroundColor] Please see [showEnhancedWidget.backgroundColor]
  ///[duration] Please see [showEnhancedWidget.duration]
  ///[onClose] Please see [showEnhancedWidget.onClose]
  ///[backButtonBehavior] Please see [showEnhancedWidget.backButtonBehavior]
  ///[enableKeyboardSafeArea] Please see [showEnhancedWidget.enableKeyboardSafeArea]
  static CancelFunc showAnimationWidget({
    required ToastBuilder toastBuilder,
    required Duration animationDuration,
    Duration? animationReverseDuration,
    WrapAnimation? wrapAnimation,
    WrapAnimation? wrapToastAnimation,
    BackButtonBehavior? backButtonBehavior,
    UniqueKey? key,
    String? groupKey,
    bool crossPage = true,
    bool allowClick = true,
    bool clickClose = false,
    bool ignoreContentClick = false,
    bool onlyOne = false,
    bool enableKeyboardSafeArea = true,
    Color backgroundColor = Colors.transparent,
    Duration? duration,
    VoidCallback? onClose,
  }) {
    AnimationController controller = _createAnimationController(
        animationDuration,
        reverseDuration: animationReverseDuration);

    return showEnhancedWidget(
        allowClick: allowClick,
        clickClose: clickClose,
        groupKey: groupKey,
        key: key,
        crossPage: crossPage,
        onClose: onClose,
        onlyOne: onlyOne,
        enableKeyboardSafeArea: enableKeyboardSafeArea,
        backButtonBehavior: backButtonBehavior,
        backgroundColor: backgroundColor,
        ignoreContentClick: ignoreContentClick,
        closeFunc: () => controller.reverse(),
        duration: duration,
        warpWidget: (cancel, child) => ProxyInitState(
              initStateCallback: () {
                assert(!controller.isAnimating);
                controller.forward();
              },
              child: ProxyDispose(
                  disposeCallback: () {
                    controller.dispose();
                    // controller_view_all.dart = null;
                  },
                  child: wrapAnimation != null
                      ? wrapAnimation(controller, cancel, child)
                      : child),
            ),
        toastBuilder: (cancelFunc) => wrapToastAnimation != null
            ? wrapToastAnimation(
                controller, cancelFunc, toastBuilder(cancelFunc))
            : toastBuilder(cancelFunc));
  }

  /*Area chart
    _________________________________
   |          MainContent            |
   |                      <----------------------allowClick
   |                      <----------------------clickClose
   |      ___________________        |
   |     |                   |       |
   |     |    ToastContent   |       |
   |     |                <----------------------ignoreContentClick
   |     |___________________|       |
   |_________________________________|
   */

  ///Display an enhanced Toast, this method allows Toast to have many features, such as scheduled shutdown, click the screen to automatically shut down, leave the current Route to shut down, etc.
  ///Core method, please see for details:
  ///[CboToast.showAnimationWidget]
  ///
  ///[toastBuilder] The builder function that generates the Widget that needs to be displayed
  ///
  ///[key] represents a credential of this Toast, with this key you can delete the Widget defined by the current key, [remove]
  ///
  ///[groupKey] represents the group key, mainly used for [removeAll] and [remove]
  ///
  ///[crossPage] Cross-page display, if true, the Toast will be displayed across multiple Routes,
  ///If it is false, the Toast will be automatically closed when the current Route changes, for cbtpri [Navigator.push]-[Navigator.pop]
  ///
  ///[allowClick] Whether to trigger the event when the Toast is displayed
  ///
  ///[clickClose] Whether to automatically close the Toast when the event is triggered by clicking the screen
  ///
  ///[ignoreContentClick] Whether to ignore the ToastContext area
  ///If this parameter is true, when the user clicks on the ToastContext area, the click event that the user can normally reach the Page
  ///In other words, it is transparent (even if the Toast background color is not transparent), if it is false, the situation is reversed
  ///
  ///[onlyOne] indicates whether there is only one Toast in the group at the same time, and which group is distinguished by [groupKey]
  ///
  ///[closeFunc] The main purpose of the function parameter is to make Toast close and do some processing such as
  ///Call [AnimationController] to start and wait for the animation before closing
  ///
  ///[backgroundColor] Background color of MainContent area
  ///
  ///[warpWidget] A wrap function that can be used to warp the MainContent area, for cbtpri, [showCustomLoading] wraps an animation
  ///Let the MainContent area also have animation
  ///
  ///[duration] Duration, if it is null, it will not be closed regularly, if it is not null, it will be closed automatically when the specified time is reached
  ///
  ///[onClose] Called when Toast is closed
  ///
  ///[enableKeyboardSafeArea] Whether to enable the keyboard safe area to prevent the keyboard from blocking Toast
  ///
  ///[backButtonBehavior] The behavior of clicking the physical return key (equivalent to the physical return key on android), note that it is not the return button on the navigation bar
  ///If it is [ignore], intercept the return event,
  ///If it is [close], close the toast and intercept the event to stop bubbling
  ///If it is null or [none], the event will not be intercepted
  ///
  static CancelFunc showEnhancedWidget(
      {required ToastBuilder toastBuilder,
      UniqueKey? key,
      String? groupKey,
      bool crossPage = true,
      bool allowClick = true,
      bool clickClose = false,
      bool ignoreContentClick = false,
      bool onlyOne = false,
      bool enableKeyboardSafeArea = true,
      BackButtonBehavior? backButtonBehavior,
      FutureFunc? closeFunc,
      VoidCallback? onClose,
      Color backgroundColor = Colors.transparent,
      WrapWidget? warpWidget,
      Duration? duration}) {
    //Since cancelFunc is empty at the beginning, it needs to be used in the closure before assignment
    CancelFunc? cancelFunc;
    CancelFunc dismissFunc = () async {
      await closeFunc?.call();
      if (cancelFunc != null) {
        cancelFunc();
      }
    };

    //onlyOne Features
    final List<CancelFunc> cache =
        (cacheCancelFunc[groupKey ?? defaultKey] ??= []);
    if (onlyOne) {
      final clone = cache.toList();
      cache.clear();
      for (var cancel in clone) {
        cancel();
      }
    }
    cache.add(dismissFunc);

    //Timing function
    Timer? timer;
    if (duration != null) {
      timer = Timer(duration, () {
        dismissFunc();
        // timer = null;
      });
    }

    //Automatically close spreads
    CboToastNavigatorObserverProxy? observerProxy;
    if (!crossPage) {
      observerProxy = CboToastNavigatorObserverProxy.all(dismissFunc);
      CboToastNavigatorObserver.register(observerProxy);
    }

    //Intercept the click return event
    VoidCallback? unRegisterFunc;
    if (backButtonBehavior == BackButtonBehavior.ignore) {
      unRegisterFunc =
          CboToastWidgetsBindingObserver.singleton.registerPopListener(() {
        return true;
      });
    } else if (backButtonBehavior == BackButtonBehavior.close) {
      unRegisterFunc =
          CboToastWidgetsBindingObserver.singleton.registerPopListener(() {
        dismissFunc();
        unRegisterFunc!.call();
        unRegisterFunc = null;
        return true;
      });
    }

    cancelFunc = showWidget(
        groupKey: groupKey,
        key: key,
        toastBuilder: (_) {
          return KeyboardSafeArea(
            enable: enableKeyboardSafeArea,
            child: ProxyDispose(disposeCallback: () {
              cache.remove(dismissFunc);
              if (observerProxy != null) {
                CboToastNavigatorObserver.unregister(observerProxy);
              }
              timer!.cancel();
              onClose?.call();
              unRegisterFunc?.call();
            }, child: Builder(builder: (BuildContext context) {
              // ignore: deprecated_member_use
              TextStyle textStyle = Theme.of(context).textTheme.bodyText1!;
              Widget child = DefaultTextStyle(
                  style: textStyle,
                  child: Stack(children: <Widget>[
                    Listener(
                      onPointerDown: clickClose ? (_) => dismissFunc() : null,
                      behavior: allowClick
                          ? HitTestBehavior.translucent
                          : HitTestBehavior.opaque,
                      child: const SizedBox.expand(),
                    ),
                    IgnorePointer(
                      child: Container(color: backgroundColor),
                    ),
                    IgnorePointer(
                      ignoring: ignoreContentClick,
                      child: toastBuilder(dismissFunc),
                    )
                  ]));
              return warpWidget != null
                  ? warpWidget(dismissFunc, child)
                  : child;
            })),
          );
        });

    return dismissFunc;
  }

  ///Display a Widget on the screen, the Widget can exist across multiple pages
  ///
  ///[toastBuilder] The builder function that generates the Widget that needs to be displayed
  ///[key] represents a credential of this Toast, with this key you can delete the Widget defined by the current key, [remove]
  ///[groupKey] represents the group key, mainly used for [removeAll] and [remove]
  ///[CancelFunc] Close function, active call will close this Toast
  ///This is a core method
  static CancelFunc showWidget(
      {required ToastBuilder toastBuilder, UniqueKey? key, String? groupKey}) {
    final gk = groupKey ?? defaultKey;
    final uniqueKey = key ?? UniqueKey();
    final CancelFunc cancelFunc = () {
      remove(uniqueKey, gk);
    };

    botToastManager!.insert(gk, uniqueKey, toastBuilder(cancelFunc));
    return cancelFunc;
  }

  static void remove(UniqueKey key, [String? groupKey]) {
    botToastManager!.remove(groupKey ?? defaultKey, key);
  }

  static void removeAll([String? groupKey]) {
    botToastManager!.removeAll(groupKey ?? defaultKey);
  }

  static void cleanAll() {
    botToastManager!.cleanAll();
  }

  static AnimationController _createAnimationController(Duration duration,
      {Duration? reverseDuration}) {
    return AnimationController(
        vsync: TickerProviderImpl(),
        duration: duration,
        reverseDuration: reverseDuration);
  }
}
