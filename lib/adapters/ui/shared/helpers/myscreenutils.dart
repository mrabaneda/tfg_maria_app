import 'dart:math' show min, max;

import 'package:flutter/widgets.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/extensions.dart';

class MyScreenUtil {
  static const Size defaultSize = Size(360, 690);
  static final MyScreenUtil _instance = MyScreenUtil._();

  late Size _uiSize;
  late bool _minTextAdapt;
  late MediaQueryData _data;

  MyScreenUtil._();

  factory MyScreenUtil() => _instance;

  static void configure({
    MediaQueryData? data,
    Size? designSize,
    bool? minTextAdapt,
  }) {
    try {
      if (data != null) {
        _instance._data = data;
      } else {
        data = _instance._data;
      }

      if (designSize != null) {
        _instance._uiSize = designSize;
      } else {
        designSize = _instance._uiSize;
      }
    } catch (_) {
      throw Exception("You must either use ScreenUtil.init or ScreenUtilInit first");
    }

    _instance._minTextAdapt = minTextAdapt ?? _instance._minTextAdapt;
  }

  static void init(
    BuildContext context, {
    Size designSize = defaultSize,
    bool minTextAdapt = true,
  }) {
    return configure(
      data: context.maybeMedia,
      designSize: designSize,
      minTextAdapt: minTextAdapt,
    );
  }

  /// The number of font pixels for each logical pixel.
  // double get textScaleFactor => _data.textScaleFactor;

  /// The size of the media in logical pixels (e.g, the size of the screen).
  double? get pixelRatio => _data.devicePixelRatio;

  /// The horizontal extent of this size.
  double get screenWidth => _data.size.width;

  ///The vertical extent of this size. dp
  double get screenHeight => _data.size.height;

  /// The offset from the top, in dp
  double get statusBarHeight => _data.padding.top;

  /// The offset from the bottom, in dp
  double get bottomBarHeight => _data.padding.bottom;

  /// The ratio of actual width to UI design
  double get scaleWidth => screenWidth / _uiSize.width;

  /// The ratio of actual height to UI design
  /* double get scaleHeight =>
      (_splitScreenMode ? max(screenHeight, 700) : screenHeight) /
      _uiSize.height; */
  double get scaleHeight => screenHeight / _uiSize.height;

  double get scaleText => _minTextAdapt ? min(scaleWidth, scaleHeight) : scaleWidth;

  /// Adapted to the device width of the UI Design.
  /// Height can also be adapted according to this to ensure no deformation ,
  /// if you want a square
  double setWidth(num width) => width * scaleWidth;

  /// Highly adaptable to the device according to UI Design
  /// It is recommended to use this method to achieve a high degree of adaptation
  /// when it is found that one screen in the UI design
  /// does not match the current style effect, or if there is a difference in shape.
  double setHeight(num height) => height * scaleHeight;

  ///Adapt according to the smaller of width or height
  double radius(num r) => r * min(scaleWidth, scaleHeight);

  /// Adapt according to the both width and height
  double diagonal(num d) => d * scaleHeight * scaleWidth;

  /// Adapt according to the maximum value of scale width and scale height
  double diameter(num d) => d * max(scaleWidth, scaleHeight);

  ///Font size adaptation method
  ///- [fontSize] The size of the font on the UI design, in dp.
  double setSp(num fontSize) => fontSize * scaleText;

  SizedBox setVerticalSpacing(num height) => SizedBox(height: setHeight(height));

  SizedBox setVerticalSpacingFromWidth(num height) => SizedBox(height: setWidth(height));

  SizedBox setHorizontalSpacing(num width) => SizedBox(width: setWidth(width));

  SizedBox setHorizontalSpacingRadius(num width) => SizedBox(width: radius(width));

  SizedBox setVerticalSpacingRadius(num height) => SizedBox(height: radius(height));

  SizedBox setHorizontalSpacingDiameter(num width) => SizedBox(width: diameter(width));

  SizedBox setVerticalSpacingDiameter(num height) => SizedBox(height: diameter(height));

  SizedBox setHorizontalSpacingDiagonal(num width) => SizedBox(width: diagonal(width));

  SizedBox setVerticalSpacingDiagonal(num height) => SizedBox(height: diagonal(height));
}
