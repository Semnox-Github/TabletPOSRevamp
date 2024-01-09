import 'package:flutter/material.dart';
import 'package:messages_data/builder.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:themes_library/themes_library.dart';
import 'dart:ui';
import '../../../widgets/colors.dart';
import '../../widgets/primary_dark_button.dart';
import '../../widgets/primary_light_button.dart';
import 'package:widgets_library/utils/size_config.dart';

class CustomColorPicker extends StatefulWidget {
  const CustomColorPicker({Key? key, required this.onConfirm})
      : super(key: key);
  final Function onConfirm;

  @override
  State<CustomColorPicker> createState() => _CustomColorPickerState();
}

class _CustomColorPickerState extends State<CustomColorPicker> {
  Size _screenSize = const Size(0, 0);
  double _screenWidth = 0.0;
  double _screenHeight = 0.0;
  NotificationBar? _notificationBar;
  HSVColor _hsvColor = const HSVColor.fromAHSV(1.0, 0.0, 0.5, 0.5);
   late SemnoxTheme _theme;


  @override
  void initState() {
    _notificationBar = NotificationBar(showHideSideBar: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;
    _screenWidth = _screenSize.width;
    _screenHeight = _screenSize.height;
    _theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Scaffold(
      bottomNavigationBar: SizedBox(
        width: _screenWidth,
        child: Container(
          child: _notificationBar,
        ),
      ),
      backgroundColor: _theme.transparentColor,
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(top: SizeConfig.getSize(8), right: SizeConfig.getSize(8), left: SizeConfig.getSize(8)),
            child: Container(
              decoration:  BoxDecoration(
                color: _theme.backGroundColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(SizeConfig.getSize(8)), topLeft: Radius.circular(SizeConfig.getSize(8))),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0.1,
                              blurRadius: .1,
                              offset: const Offset(
                                  0, 2), // changes position of shadow
                            ),
                          ],
                          color: _theme.button2InnerShadow1,
                          borderRadius:  BorderRadius.only(
                              bottomRight: Radius.circular(SizeConfig.getSize(8)),
                              topLeft: Radius.circular(SizeConfig.getSize(8)))),
                      height: SizeConfig.getSize(64),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           SizedBox(
                            width: SizeConfig.getSize(10),
                          ),
                           Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: SizeConfig.getSize(25),
                          ),
                           SizedBox(
                            width: SizeConfig.getSize(8),
                          ),
                          Text(
                            MessagesProvider.get('Color Picker').toUpperCase(),
                            style: _theme.headingLight2!.copyWith(color: _theme.light1, fontSize:SizeConfig.getFontSize(26)),
                          ),
                           SizedBox(
                            width: SizeConfig.getSize(8),
                          ),
                        ],
                      ),
                    ),
                  ),
                   SizedBox(
                    width: SizeConfig.getSize(8),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0.2,
                              blurRadius: .2,
                              offset: const Offset(
                                  0, 2), // changes position of shadow
                            ),
                          ],
                          color: _theme.button1BG1!,
                          borderRadius:  BorderRadius.only(
                              bottomLeft: Radius.circular(SizeConfig.getSize(8)),
                              topRight: Radius.circular(SizeConfig.getSize(8)))),
                      height:SizeConfig.getSize(64),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: CustomScrollView(
              //Instead of ListView or SingleChildScrollView put CustomScrollVIew to use Expanded or spacer
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: true,
                  child: Padding(
                    padding:
                         EdgeInsets.only(left: SizeConfig.getSize(8), right: SizeConfig.getSize(8), bottom: 0),
                    child: Container(
                      decoration:  BoxDecoration(
                        color:_theme.backGroundColor
                      ),
                      child: Padding(
                        padding:  EdgeInsets.all(SizeConfig.getSize(8)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Row(
                                children: [
                                   SizedBox(
                                    width: SizeConfig.getSize(10),
                                  ),
                                  _buildColorPicker(),
                                   SizedBox(
                                    width: SizeConfig.getSize(10),
                                  ),
                                  _buildColorSlider()
                                ],
                              ),
                            ),
                            Container(
                              height: _screenHeight * .45,
                              width: _screenHeight * .45,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: KColor.borderGrey)),
                              child: Center(
                                child: Container(
                                  height: _screenHeight * .45,
                                  width: _screenHeight * .45,
                                  margin: const EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    color: _hsvColor.toColor(),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 1,
                                child: Padding(
                                  padding:
                                       EdgeInsets.fromLTRB(SizeConfig.getSize(20), SizeConfig.getSize(8), SizeConfig.getSize(20), SizeConfig.getSize(8)),
                                  child: SizedBox(
                                    height: _screenHeight * .45,
                                    width: _screenHeight * .45,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "R",
                                                style:_theme.heading5!,
                                              ),
                                              const SizedBox(width: 5,),
                                              Expanded(
                                                child: Container(
                                                  width: 100,
                                                  height: 48,
                                                  decoration: BoxDecoration(
                                                      color:  _theme.button1BG1!,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  8)),
                                                      border: Border.all(
                                                          width: 1,
                                                          color: KColor
                                                              .borderGrey)),
                                                  child: Center(
                                                      child: Text(
                                                    '${_hsvColor.toColor().toHex().substring(3, 5).toUpperCase()}',
                                                    style: _theme.heading5,
                                                  )),
                                                ),
                                              ),
                                              const SizedBox(width: 5,),
                                              Expanded(
                                                child: Container(
                                                  width: 100,
                                                  height: 48,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  8)),
                                                      border: Border.all(
                                                          width: 1,
                                                          color: KColor
                                                              .borderGrey)),
                                                  child: Center(
                                                      child: Text(
                                                    '${_hsvColor.toColor().red}',
                                                    style: _theme.heading5,
                                                  )),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "G",
                                                style:_theme.heading5,
                                              ),
                                              const SizedBox(width: 5,),
                                              Expanded(
                                                child: Container(
                                                  width: 100,
                                                  height: 48,
                                                  decoration: BoxDecoration(
                                                      color:  _theme.button1BG1!,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  8)),
                                                      border: Border.all(
                                                          width: 1,
                                                          color: KColor
                                                              .borderGrey)),
                                                  child: Center(
                                                      child: Text(
                                                    '${_hsvColor.toColor().toHex().substring(5, 7).toUpperCase()}',
                                                    style: _theme.heading5,
                                                  )),
                                                ),
                                              ),
                                              const SizedBox(width: 5,),
                                              Expanded(
                                                child: Container(
                                                  width: 100,
                                                  height: 48,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  8)),
                                                      border: Border.all(
                                                          width: 1,
                                                          color: KColor
                                                              .borderGrey)),
                                                  child: Center(
                                                      child: Text(
                                                    '${_hsvColor.toColor().green}',
                                                    style: _theme.heading5,
                                                  )),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "B",
                                                style:_theme.heading5,
                                              ),
                                              const SizedBox(width: 5,),
                                              Expanded(
                                                child: Container(
                                                  width: 100,
                                                  height: 48,
                                                  decoration: BoxDecoration(
                                                      color: _theme.button1BG1!,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  8)),
                                                      border: Border.all(
                                                          width: 1,
                                                          color: KColor
                                                              .borderGrey)),
                                                  child: Center(
                                                      child: Text(
                                                    '${_hsvColor.toColor().toHex().substring(7, 9).toUpperCase()}',
                                                    style:_theme.heading5,
                                                  )),
                                                ),
                                              ),
                                              const SizedBox(width: 5,),
                                              Expanded(
                                                child: Container(
                                                  width: 100,
                                                  height: 48,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  8)),
                                                      border: Border.all(
                                                          width: 1,
                                                          color: KColor
                                                              .borderGrey)),
                                                  child: Center(
                                                      child: Text(
                                                    '${_hsvColor.toColor().blue}',
                                                    style:_theme.heading5,
                                                  )),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(0.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 48,
                                              decoration: BoxDecoration(
                                                  color: _theme.button1BG1!,
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(8)),
                                                  border: Border.all(
                                                      width: 1,
                                                      color: _theme.dialogFooterInnerShadow!)),
                                              child: Center(
                                                  child: Text(
                                                '${_hsvColor.toColor().toHex().toUpperCase()}',
                                                style:_theme.heading5,
                                              )),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(bottom: SizeConfig.getSize(8), right: SizeConfig.getSize(8), left: SizeConfig.getSize(8)),
            child: Container(
              decoration:  BoxDecoration(
                  color: _theme.backGroundColor,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(SizeConfig.getSize(8)),
                      bottomLeft: Radius.circular(SizeConfig.getSize(8)))),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 4.0, top: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PrimaryLightButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        title: MessagesProvider.get('Cancel').toUpperCase()),
                    const SizedBox(
                      width: 8,
                    ),
                    PrimaryDarkButton(
                        onPressed: () {
                          widget.onConfirm(
                              "${_hsvColor.toColor().red},${_hsvColor.toColor().green},${_hsvColor.toColor().blue}");
                          Navigator.pop(context);
                        },
                        title: MessagesProvider.get('Confirm').toUpperCase())
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildColorPicker() {
    return SizedBox(
      width: _screenHeight * .45,
      height: _screenHeight * .45,
      child: ColorPickerWidget(
          hsvColor: _hsvColor,
          onColorSelected: (HSVColor newColor) {
            setState(() {
              _hsvColor = newColor;
              // print("colorValue : ${newColor.toColor().toHex()}");
              // print(
              //     "rgbValue : ${newColor.toColor().red},${newColor.toColor().green},${newColor.toColor().green}");
            });
          }),
    );
  }

  Widget _buildColorSlider() {
    return Container(
      height: _screenHeight * .45,
      width: _screenWidth * .05,
      child: HuePicker(
          selectedHue: _hsvColor.hue,
          onHueSelected: (double newHue) {
            setState(() {
              _hsvColor = _hsvColor.withHue(newHue);
            });
          }),
    );
  }
}

// class CustomColorPicker extends StatefulWidget {
//   const CustomColorPicker({Key? key}) : super(key: key);
//
//   @override
//   State<CustomColorPicker> createState() => _CustomColorPickerState();
// }
//
// class _CustomColorPickerState extends State<CustomColorPicker> {
//   HSVColor _hsvColor = const HSVColor.fromAHSV(1.0, 0.0, 0.5, 1.0);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Container(
//           height: 50,
//           width: 50,
//           decoration: BoxDecoration(color: _hsvColor.toColor()),
//         ),
//         const SizedBox(
//           width: 20,
//         ),
//         _buildColorPicker(),
//         const SizedBox(
//           width: 20,
//         ),
//         _buildColorSlider()
//       ],
//     );
//   }
//
//   Widget _buildColorPicker() {
//     return ColorPickerWidget(
//         hsvColor: _hsvColor,
//         onColorSelected: (HSVColor newColor) {
//           setState(() {
//             _hsvColor = newColor;
//             print("colorValue : ${newColor.toColor().toHex()}");
//             print("rgbValue : ${newColor.toColor().red},${newColor.toColor().green},${newColor.toColor().green}");
//           });
//         });
//     // return Container(
//     //   height: 200,
//     //   width: 200,
//     //   child: CustomPaint(
//     //     painter: ColorPickerPainter(
//     //         hue: _hsvColor.hue
//     //     ),
//     //   ),
//     // );
//   }
//
//   Widget _buildColorSlider() {
//     return HuePicker(
//         selectedHue: _hsvColor.hue,
//         onHueSelected: (double newHue) {
//           setState(() {
//             _hsvColor = _hsvColor.withHue(newHue);
//           });
//         });
//   }
// }

extension ColorX on Color {
  String toHexTriplet() =>
      '#${(value & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase()}';
}

extension HexColor on Color {
  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

typedef ColorPickerCallBack = void Function(HSVColor newColor);

class ColorPickerWidget extends StatefulWidget {
  const ColorPickerWidget(
      {Key? key, required this.hsvColor, required this.onColorSelected})
      : super(key: key);
  final HSVColor hsvColor;
  final ColorPickerCallBack onColorSelected;

  @override
  State<ColorPickerWidget> createState() => _ColorPickerWidgetState();
}

class _ColorPickerWidgetState extends State<ColorPickerWidget> {
  void _onDragStart(DragStartDetails details) {
    if (widget.onColorSelected == null) {
      return;
    }

    final percentOffset = _calculatePercentOffset(details.localPosition);
    widget.onColorSelected(
      _hsvColorFromPercentOffset(percentOffset),
    );
  }

  Offset _calculatePercentOffset(Offset localPosition) {
    final RenderBox box = context.findRenderObject() as RenderBox;
    return Offset((localPosition.dx / box.size.width).clamp(.0, 1.0),
        (1.0 - (localPosition.dy / box.size.height)).clamp(0.0, 1.0));
  }

  HSVColor _hsvColorFromPercentOffset(Offset percentOffset) {
    return HSVColor.fromAHSV(
        1.0, widget.hsvColor.hue, percentOffset.dx, percentOffset.dy);
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (widget.onColorSelected == null) {
      return;
    }

    final percentOffset = _calculatePercentOffset(details.localPosition);
    widget.onColorSelected(
      _hsvColorFromPercentOffset(percentOffset),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: KColor.borderGrey)),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        margin: const EdgeInsets.all(5.0),
        child: LayoutBuilder(builder: (context, constraints) {
          return GestureDetector(
            onPanStart: _onDragStart,
            onPanUpdate: _onDragUpdate,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                CustomPaint(
                  painter: ColorPickerPainter(hue: widget.hsvColor.hue),
                  size: Size.infinite,
                ),
                _buildSelector(
                    Size(constraints.maxWidth, constraints.maxHeight))
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildSelector(Size size) {
    final double saturationPercent = widget.hsvColor.saturation;
    final double darknessPercent = 1.0 - widget.hsvColor.value;

    return Positioned(
      left: lerpDouble(0, size.width, saturationPercent),
      top: lerpDouble(0, size.height, darknessPercent),
      child: FractionalTranslation(
        translation: const Offset(-.5, -.5),
        child: Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3)),
        ),
      ),
    );
  }
}

class ColorPickerPainter extends CustomPainter {
  ColorPickerPainter({required this.hue});

  final double hue;

  @override
  void paint(Canvas canvas, Size size) {
    final lightGradientShader = LinearGradient(
      colors: [Colors.white, Colors.black],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ).createShader(Offset.zero & size);
    final lightPaint = Paint()..shader = lightGradientShader;

    canvas.drawRect(Offset.zero & size, lightPaint);

    final noSaturationColor = HSVColor.fromAHSV(1.0, hue, 0.0, 1.0);
    final fullSaturationColor = HSVColor.fromAHSV(1.0, hue, 1.0, 1.0);
    final saturationGradientShader = LinearGradient(
      colors: [noSaturationColor.toColor(), fullSaturationColor.toColor()],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).createShader(Offset.zero & size);

    final saturationPaint = Paint()
      ..shader = saturationGradientShader
      ..blendMode = BlendMode.modulate;
    canvas.drawRect(Offset.zero & size, saturationPaint);
  }

  @override
  bool shouldRepaint(ColorPickerPainter oldDelegate) {
    return hue != oldDelegate.hue;
  }
}

typedef HuePickerCallBack = void Function(double hue);

class HuePicker extends StatefulWidget {
  const HuePicker(
      {Key? key, required this.selectedHue, required this.onHueSelected})
      : super(key: key);
  final double selectedHue;
  final HuePickerCallBack onHueSelected;

  @override
  State<HuePicker> createState() => _HuePickerState();
}

class _HuePickerState extends State<HuePicker> {
  void _onDragStart(DragStartDetails details) {
    if (widget.onHueSelected == null) {
      return;
    }

    final sliderPercent = _calculateSliderPercent(details.localPosition);
    widget.onHueSelected(
      _hueFromSliderPercent(sliderPercent),
    );
  }

  double _calculateSliderPercent(Offset localPosition) {
    final RenderBox box = context.findRenderObject() as RenderBox;
    return (1.0 - (localPosition.dy / box.size.height)).clamp(0.0, 1.0);
  }

  double _hueFromSliderPercent(double sliderPercent) {
    return sliderPercent * 360;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (widget.onHueSelected == null) {
      return;
    }

    final sliderPercent = _calculateSliderPercent(details.localPosition);
    widget.onHueSelected(
      _hueFromSliderPercent(sliderPercent),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return GestureDetector(
        onPanStart: _onDragStart,
        onPanUpdate: _onDragUpdate,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: KColor.borderGrey)),
              child: Container(
                height: double.infinity,
                width: double.infinity,
                margin: const EdgeInsets.all(6.0),
                child: CustomPaint(
                  painter: HuePickerPainter(),
                  size: Size.infinite,
                ),
              ),
            ),
            _buildSelector(constraints.maxHeight)
          ],
        ),
      );
    });
  }

  _buildSelector(double maxHeight) {
    final huePercent = widget.selectedHue / 360;
    return Align(
      alignment: Alignment(0.0, 1.0 - (huePercent * 2)),
      child: SizedBox(
        width: double.infinity,
        height: 15,
        child: IntrinsicHeight(
          child: Row(
            children: [
              const SizedBox(
                width: 6,
              ),
              Expanded(
                flex: 3,
                child: Container(
                  // width: 30,
                  height: 3,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.black),
                      shape: BoxShape.circle),
                ),
              ),
            ],
          ),
        ),
        // child: Row(
        //   children: [
        //
        //     Container(
        //       width: 5,
        //       height: 3,
        //       decoration: BoxDecoration(
        //           color: Colors.white,
        //           shape: BoxShape.circle
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}

class HuePickerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final hueGradientShader = LinearGradient(
      colors: [
        // const Color(0xFFFF0000),
        //  const Color(0xFF00FF00),
        //  const Color(0xFF0000FF),
        //  const Color(0xFFFF0000) ,
        HSVColor.fromAHSV(1.0, 0.0, 1.0, 1).toColor(),
        HSVColor.fromAHSV(1.0, 51, 1.0, 1).toColor(),
        HSVColor.fromAHSV(1.0, 102, 1.0, 1).toColor(),
        HSVColor.fromAHSV(1.0, 153, 1.0, 1).toColor(),
        HSVColor.fromAHSV(1.0, 204, 1.0, 1).toColor(),
        HSVColor.fromAHSV(1.0, 255, 1.0, 1).toColor(),
        HSVColor.fromAHSV(1.0, 306, 1.0, 1).toColor(),
        HSVColor.fromAHSV(1.0, 360, 1.0, 1).toColor(),
      ],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    ).createShader(Offset.zero & size);

    final paint = Paint()..shader = hueGradientShader;
    canvas.drawRect(Offset.zero & size, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
