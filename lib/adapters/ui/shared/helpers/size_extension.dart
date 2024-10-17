import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:tfg_maria_app/adapters/ui/shared/helpers/myscreenutils.dart';

extension SizeExtension on num {
  ///[ScreenUtil.setWidth]
  double get w => MyScreenUtil().setWidth(this);

  ///[ScreenUtil.setHeight]
  double get h => MyScreenUtil().setHeight(this);

  ///[ScreenUtil.radius]
  double get r => MyScreenUtil().radius(this);

  ///[ScreenUtil.diagonal]
  double get dg => MyScreenUtil().diagonal(this);

  ///[ScreenUtil.diameter]
  double get dm => MyScreenUtil().diameter(this);

  ///[ScreenUtil.setSp]
  double get sp => MyScreenUtil().setSp(this);

  ///smart size :  it check your value - if it is bigger than your value it will set your value
  ///for example, you have set 16.sm() , if for your screen 16.sp() is bigger than 16 , then it will set 16 not 16.sp()
  ///I think that it is good for save size balance on big sizes of screen
  double get spMin => min(toDouble(), sp);
  double get spMax => max(toDouble(), sp);

  ///Multiple of screen width
  double get sw => MyScreenUtil().screenWidth * this;

  ///Multiple of screen height
  double get sh => MyScreenUtil().screenHeight * this;

  ///[ScreenUtil.setHeight]
  SizedBox get verticalSpace => MyScreenUtil().setVerticalSpacing(this);

  ///[ScreenUtil.setVerticalSpacingFromWidth]
  SizedBox get verticalSpaceFromWidth => MyScreenUtil().setVerticalSpacingFromWidth(this);

  ///[ScreenUtil.setWidth]
  SizedBox get horizontalSpace => MyScreenUtil().setHorizontalSpacing(this);

  ///[ScreenUtil.radius]
  SizedBox get horizontalSpaceRadius => MyScreenUtil().setHorizontalSpacingRadius(this);

  ///[ScreenUtil.radius]
  SizedBox get verticalSpacingRadius => MyScreenUtil().setVerticalSpacingRadius(this);

  ///[ScreenUtil.diameter]
  SizedBox get horizontalSpaceDiameter => MyScreenUtil().setHorizontalSpacingDiameter(this);

  ///[ScreenUtil.diameter]
  SizedBox get verticalSpacingDiameter => MyScreenUtil().setVerticalSpacingDiameter(this);

  ///[ScreenUtil.diagonal]
  SizedBox get horizontalSpaceDiagonal => MyScreenUtil().setHorizontalSpacingDiagonal(this);

  ///[ScreenUtil.diagonal]
  SizedBox get verticalSpacingDiagonal => MyScreenUtil().setVerticalSpacingDiagonal(this);
}

extension EdgeInsetsExtension on EdgeInsets {
  /// Creates adapt insets using r [SizeExtension].
  EdgeInsets get r => copyWith(
        top: top.r,
        bottom: bottom.r,
        right: right.r,
        left: left.r,
      );

  EdgeInsets get dm => copyWith(
        top: top.dm,
        bottom: bottom.dm,
        right: right.dm,
        left: left.dm,
      );

  EdgeInsets get dg => copyWith(
        top: top.dg,
        bottom: bottom.dg,
        right: right.dg,
        left: left.dg,
      );

  EdgeInsets get w => copyWith(
        top: top.w,
        bottom: bottom.w,
        right: right.w,
        left: left.w,
      );

  EdgeInsets get h => copyWith(
        top: top.h,
        bottom: bottom.h,
        right: right.h,
        left: left.h,
      );
}

extension BorderRaduisExtension on BorderRadius {
  /// Creates adapt BorderRadius using r [SizeExtension].
  BorderRadius get r => copyWith(
        bottomLeft: bottomLeft.r,
        bottomRight: bottomRight.r,
        topLeft: topLeft.r,
        topRight: topRight.r,
      );

  BorderRadius get w => copyWith(
        bottomLeft: bottomLeft.w,
        bottomRight: bottomRight.w,
        topLeft: topLeft.w,
        topRight: topRight.w,
      );

  BorderRadius get h => copyWith(
        bottomLeft: bottomLeft.h,
        bottomRight: bottomRight.h,
        topLeft: topLeft.h,
        topRight: topRight.h,
      );
}

extension RadiusExtension on Radius {
  /// Creates adapt Radius using r [SizeExtension].
  Radius get r => Radius.elliptical(x.r, y.r);

  Radius get dm => Radius.elliptical(x.dm, y.dm);

  Radius get dg => Radius.elliptical(x.dg, y.dg);

  Radius get w => Radius.elliptical(x.w, y.w);

  Radius get h => Radius.elliptical(x.h, y.h);
}

extension BoxConstraintsExtension on BoxConstraints {
  /// Creates adapt BoxConstraints using r [SizeExtension].
  BoxConstraints get r => copyWith(
        maxHeight: maxHeight.r,
        maxWidth: maxWidth.r,
        minHeight: minHeight.r,
        minWidth: minWidth.r,
      );

  /// Creates adapt BoxConstraints using h-w [SizeExtension].
  BoxConstraints get hw => copyWith(
        maxHeight: maxHeight.h,
        maxWidth: maxWidth.w,
        minHeight: minHeight.h,
        minWidth: minWidth.w,
      );

  BoxConstraints get w => copyWith(
        maxHeight: maxHeight.w,
        maxWidth: maxWidth.w,
        minHeight: minHeight.w,
        minWidth: minWidth.w,
      );

  BoxConstraints get h => copyWith(
        maxHeight: maxHeight.h,
        maxWidth: maxWidth.h,
        minHeight: minHeight.h,
        minWidth: minWidth.h,
      );
}
