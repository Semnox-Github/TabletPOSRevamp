
import 'package:flutter/material.dart';

class SizeConfig{
  static late MediaQueryData _mediaQueryData;
static late double screenWidth;
static late double screenHeight;
static late double blockSizeHorizontal;
static late double blockSizeVertical;

static late double _safeAreaHorizontal;
static late double _safeAreaVertical;
static late double safeBlockHorizontal;
static late double safeBlockVertical;

static const Size _uiSize = Size(1280, 720);
static late Size _screenSize;
static late Size size;

static void init(BuildContext context) {
_mediaQueryData = MediaQuery.of(context);
_screenSize = MediaQuery.of(context).size;
final window = WidgetsBinding.instance.window;
size = window.physicalSize / window.devicePixelRatio;


screenWidth = _mediaQueryData.size.width;
screenHeight = _mediaQueryData.size.height;
blockSizeHorizontal = screenWidth / 100;
blockSizeVertical = screenHeight / 100;

_safeAreaHorizontal = _mediaQueryData.padding.left +
_mediaQueryData.padding.right;
_safeAreaVertical = _mediaQueryData.padding.top +
_mediaQueryData.padding.bottom;
safeBlockHorizontal = (screenWidth -
_safeAreaHorizontal) / 100;
safeBlockVertical = (screenHeight -
_safeAreaVertical) / 100;
}


static double getWidth(double width) =>
(width / _uiSize.width) * _screenSize.width;

static double getHeight(double height) =>
(height / _uiSize.height) * _screenSize.height;

static double getHorizontalSize(double px) => px * (size.width / 1280);

static double getVerticalSize(double px) {
final window = WidgetsBinding.instance.window;
num statusBar = MediaQueryData.fromWindow(window).viewPadding.top;
num screenHeight = size.height - statusBar;
return px * (screenHeight / 720);
}

static double getSize(double px) {
final height = getVerticalSize(px);
final width = getHorizontalSize(px);

if (height < width) {
return height.toInt().toDouble();
} else {
return width.toInt().toDouble();
}
}

static double getFontSize(double px) => getSize(px);
}


// Widget build(BuildContext context) {
//  return Center(
//   child: Container(
//    height: SizeConfig.blockSizeVertical * 20,
//    width: SizeConfig.blockSizeHorizontal * 50,
//    color: Colors.orange,
//   ),
//  );
// }
