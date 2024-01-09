import 'package:flutter/material.dart';
import 'dart:math' as math;

GlobalKey childKey = GlobalKey();
GlobalKey childKey2 = GlobalKey();

class DraggableScrollbar extends StatefulWidget {
  final Widget? child;

  final double widthScrollThumb;

  final Color thumbColor;

  final Color iconColor;

  final Duration scrollbarAnimationDuration;

  final Duration scrollbarTimeToFade;

  final ScrollController controller;

  final Axis? scrollDirection;

  final double radiusScrollThumb;

  const DraggableScrollbar({
    Key? key,
    required this.thumbColor,
    required this.child,
    required this.controller,
    this.scrollDirection,
    this.scrollbarAnimationDuration = const Duration(milliseconds: 300),
    this.scrollbarTimeToFade = const Duration(milliseconds: 600),
    this.widthScrollThumb = 20.0,
    this.radiusScrollThumb = 2.0,
    this.iconColor = Colors.black,
  }) : super(key: key);

  @override
  DraggableScrollbarState createState() => DraggableScrollbarState();
}

class DraggableScrollbarState extends State<DraggableScrollbar>
    with TickerProviderStateMixin {
  late double _barOffset;
  late double _viewOffset;
  late bool _isDragInProcess;

  late AnimationController _thumbAnimationController;
  late Animation<double> _thumbAnimation;
  late double heightScrollThumb;
  double clcHight = 10.0;
  bool thumbHightCalculated = false;
  bool isLeadingButtonActivated = false;
  bool isTrailingButtonActivated = true;
  bool? isArrowButtonVisible;
  @override
  void initState() {
    super.initState();
    //print("viewMaxScrollExtent : "+widget.controller.position.maxScrollExtent.toString());
    _barOffset = 0.0;
    _viewOffset = 0.0;
    _isDragInProcess = false;
    heightScrollThumb = 48.0;

    _thumbAnimationController = AnimationController(
      vsync: this,
      duration: widget.scrollbarAnimationDuration,
    );

    _thumbAnimation = CurvedAnimation(
      parent: _thumbAnimationController,
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void dispose() {
    _thumbAnimationController.dispose();
    super.dispose();
  }

  double get barMaxScrollExtent => context.size!.height - heightScrollThumb;

  double get barMaxScrollExtentHoriz => context.size!.width - heightScrollThumb;

  double get barMinScrollExtent => 0.0;

  double get viewMaxScrollExtent => widget.controller.position.maxScrollExtent;

  double get viewMinScrollExtent => widget.controller.position.minScrollExtent;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (thumbHightCalculated) return;
            final viewPortHight = widget.scrollDirection == Axis.horizontal
                ? constraints.maxWidth
                : constraints.maxHeight;
            clcHight =
                (viewPortHight / viewMaxScrollExtent) * 100;
            print('clcHight: $clcHight');
            print('viewProthight: $viewPortHight');
            print('he: ${widget.controller.position.viewportDimension }');
            print('maxScrollExtent: $viewMaxScrollExtent');
            setState(() {
              isArrowButtonVisible = ((viewMaxScrollExtent + viewPortHight)/viewPortHight) > 1.5;
              if (clcHight.isFinite) {
                heightScrollThumb = clcHight;
              }
              if (!isArrowButtonVisible!) {
                heightScrollThumb = viewPortHight - ((viewPortHight / (viewMaxScrollExtent + viewPortHight)) * 100);
                // log('heightScrollThumb: $heightScrollThumb');

              }
              thumbHightCalculated = true;
            });
            // log('isArrowButtonHidden: $isArrowButtonVisible');
          });
          return NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification notification) {
              changePosition(notification);
              return false;
            },
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                  scrollbars: false, physics: const ClampingScrollPhysics()),
              child: widget.scrollDirection == Axis.horizontal
                  ? buildHorizontal()
                  : buildVertical(),
            ),
          );
        });
  }

  Widget buildHorizontal() {
    return Column(
      children: [
        Expanded(
          child: RepaintBoundary(
            key: childKey,
            child: widget.child,
          ),
        ),
        Visibility(
          visible: clcHight.isFinite,
          child: Row(
            children: [
              customIconButton(
                isButtonActive: isLeadingButtonActivated,
                buttonPress: leadingButtonPress,
                iconImage: Icons.arrow_back_ios_new,
                width: 15,
                height: widget.widthScrollThumb,
              ),
              Expanded(
                child: RepaintBoundary(
                  child: GestureDetector(
                    onHorizontalDragStart: dragStart,
                    onHorizontalDragUpdate: onHorizontalDragUpdate,
                    onHorizontalDragEnd: dragEnd,
                    child: Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(
                        left: _barOffset < 0 ? 0 : _barOffset,
                      ),
                      child: Container(
                        height: widget.widthScrollThumb,
                        width: heightScrollThumb,
                        decoration: thumbDecoration(widget.radiusScrollThumb),
                      ),
                    ),
                  ),
                ),
              ),
              customIconButton(
                isButtonActive: isTrailingButtonActivated,
                buttonPress: trailingButtonPress,
                iconImage: Icons.arrow_back_ios_new,
                width: 15,
                height: widget.widthScrollThumb,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget buildVertical() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            height: 1000,
            child: RepaintBoundary(
              child: widget.child,
            ),
          ),
        ),
        Visibility(
          visible: clcHight.isFinite,
          child: Column(
            children: [
              customIconButton(
                isButtonActive: isLeadingButtonActivated,
                buttonPress: leadingButtonPress,
                iconImage: Icons.arrow_back_ios_new,
                width: widget.widthScrollThumb,
                height: 15,
              ),
              Expanded(
                child: RepaintBoundary(
                  child: GestureDetector(
                    onVerticalDragStart: dragStart,
                    onVerticalDragUpdate: _onVerticalDragUpdate,
                    onVerticalDragEnd: dragEnd,
                    child: Container(
                      alignment: Alignment.topRight,
                      key: childKey2,
                      margin: EdgeInsets.only(
                        top: _barOffset < 0 ? 0 :
                        _barOffset > 35 ? (_barOffset-35) : (_barOffset),
                      ),
                      child: Container(
                        height: heightScrollThumb,
                        width: widget.widthScrollThumb,
                        decoration: thumbDecoration(widget.radiusScrollThumb),
                      ),
                    ),
                  ),
                ),
              ),
              customIconButton(
                isButtonActive: isTrailingButtonActivated,
                buttonPress: trailingButtonPress,
                iconImage: Icons.arrow_back_ios_new,
                width: widget.widthScrollThumb,
                height: 15,
              ),
            ],
          ),
        ),
      ],
    );
  }

  BoxDecoration thumbDecoration(double radius) {
    return BoxDecoration(
        color: widget.thumbColor, borderRadius: BorderRadius.circular(radius));
  }

  Widget customIconButton({
    required bool isButtonActive,
    required void Function() buttonPress,
    required IconData iconImage,
    required double width,
    required double height,
  }) {
    return Visibility(
      visible: isArrowButtonVisible ?? false,
      child: GestureDetector(
        onTap: () => !isButtonActive ? null : buttonPress(),
        child: SizedBox(
          width: width,
          height: height,
          child: Transform.rotate(
              angle: buttonPress.toString().contains('trailing') ? 300 : math.pi / 2,
              child: Icon(
                iconImage,
                color: isButtonActive ? widget.iconColor : Colors.grey.shade400,
                size: 15,)),
        ),
      ),
    );
  }

  changePosition(ScrollNotification notification) {
    if (_isDragInProcess) {
      if (barMinScrollExtent == widget.controller.offset) {
        setState(() {
          isLeadingButtonActivated = false;
          isTrailingButtonActivated = true;
        });
      } else if (viewMaxScrollExtent ==
          widget.controller.offset) {
        setState(() {
          isLeadingButtonActivated = true;
          isTrailingButtonActivated = false;
        });
      } else {
        setState(() {
          isLeadingButtonActivated = true;
          isTrailingButtonActivated = true;
        });
      }
      return;
    }

    if (widget.scrollDirection == Axis.vertical) {
      setState(() {
        if (notification is ScrollUpdateNotification) {
          _barOffset += getBarDelta(
            notification.scrollDelta!,
            barMaxScrollExtent,
            viewMaxScrollExtent,
          );

          if (_barOffset < barMinScrollExtent) {
            _barOffset = barMinScrollExtent;
          }
          if (_barOffset > barMaxScrollExtent) {
            _barOffset = barMaxScrollExtent;
          }

          _viewOffset += notification.scrollDelta!;
          if (_viewOffset < widget.controller.position.minScrollExtent) {
            _viewOffset = widget.controller.position.minScrollExtent;
          }
          if (_viewOffset > viewMaxScrollExtent) {
            _viewOffset = viewMaxScrollExtent;
          }
        }

        if (notification is ScrollUpdateNotification ||
            notification is OverscrollNotification) {
          if (_thumbAnimationController.status != AnimationStatus.forward) {
            _thumbAnimationController.forward();
          }

          _thumbAnimationController.reverse();
        }
        isLeadingButtonActivated = checkLeadingButtonActivation();
        isTrailingButtonActivated = checkTrailingButtonActivation();
      });
    }
    if (widget.scrollDirection == Axis.horizontal) {
      setState(() {
        if (notification is ScrollUpdateNotification) {
          _barOffset += getBarDelta(
            notification.scrollDelta!,
            barMaxScrollExtentHoriz,
            viewMaxScrollExtent,
          );
          if (_barOffset < barMinScrollExtent) {
            _barOffset = barMinScrollExtent;
          }
          if (_barOffset > barMaxScrollExtentHoriz) {
            _barOffset = barMaxScrollExtentHoriz;
          }
          _viewOffset += notification.scrollDelta!;
          if (_viewOffset < widget.controller.position.minScrollExtent) {
            _viewOffset = widget.controller.position.minScrollExtent;
          }
          if (_viewOffset > viewMaxScrollExtent) {
            _viewOffset = viewMaxScrollExtent;
          }
        }
        if (notification is ScrollUpdateNotification ||
            notification is OverscrollNotification) {
          if (_thumbAnimationController.status != AnimationStatus.forward) {
            _thumbAnimationController.forward();
          }

          _thumbAnimationController.reverse();
        }
        isLeadingButtonActivated = checkLeadingButtonActivation();
        isTrailingButtonActivated = checkTrailingButtonActivation();
      });
    }else{
      setState(() {
        if (notification is ScrollUpdateNotification) {
          _barOffset += getBarDelta(
            notification.scrollDelta!,
            barMaxScrollExtent,
            viewMaxScrollExtent,
          );

          if (_barOffset < barMinScrollExtent) {
            _barOffset = barMinScrollExtent;
          }
          if (_barOffset > barMaxScrollExtent) {
            _barOffset = barMaxScrollExtent;
          }

          _viewOffset += notification.scrollDelta!;
          if (_viewOffset < widget.controller.position.minScrollExtent) {
            _viewOffset = widget.controller.position.minScrollExtent;
          }
          if (_viewOffset > viewMaxScrollExtent) {
            _viewOffset = viewMaxScrollExtent;
          }
        }

        if (notification is ScrollUpdateNotification ||
            notification is OverscrollNotification) {
          if (_thumbAnimationController.status != AnimationStatus.forward) {
            _thumbAnimationController.forward();
          }

          _thumbAnimationController.reverse();
        }
        isLeadingButtonActivated = checkLeadingButtonActivation();
        isTrailingButtonActivated = checkTrailingButtonActivation();
      });
    }
  }

  double getBarDelta(
      double scrollViewDelta,
      double barMaxScrollExtent,
      double viewMaxScrollExtent,
      ) {
    return scrollViewDelta * barMaxScrollExtent / viewMaxScrollExtent;
  }

  double getScrollViewDelta(
      double barDelta,
      double barMaxScrollExtent,
      double viewMaxScrollExtent,
      ) {
    return barDelta * viewMaxScrollExtent / barMaxScrollExtent;
  }

  void dragStart(DragStartDetails details) {
    setState(() {
      _isDragInProcess = true;
    });
  }


  void _onVerticalDragUpdate(DragUpdateDetails details) {
    setState(() {
      if (_thumbAnimationController.status != AnimationStatus.forward) {
        _thumbAnimationController.forward();
      }
      if (_isDragInProcess) {
        _barOffset += details.delta.dy;

        if (_barOffset < barMinScrollExtent) {
          _barOffset = barMinScrollExtent;
        }
        if (_barOffset > barMaxScrollExtent) {
          _barOffset = barMaxScrollExtent;
        }

        double viewDelta = getScrollViewDelta(
            details.delta.dy, barMaxScrollExtent, viewMaxScrollExtent);

        _viewOffset = widget.controller.position.pixels + viewDelta;
        if (_viewOffset < widget.controller.position.minScrollExtent) {
          _viewOffset = widget.controller.position.minScrollExtent;
        }
        if (_viewOffset > viewMaxScrollExtent) {
          _viewOffset = viewMaxScrollExtent;
        }
        widget.controller.jumpTo(_viewOffset);
      }
    });
  }

  void onHorizontalDragUpdate(DragUpdateDetails details) {
    setState(() {
      if (_thumbAnimationController.status != AnimationStatus.forward) {
        _thumbAnimationController.forward();
      }
      if (_isDragInProcess) {
        _barOffset += details.delta.dx;

        if (_barOffset < barMinScrollExtent) {
          _barOffset = barMinScrollExtent;
        }
        if (_barOffset > barMaxScrollExtentHoriz) {
          _barOffset = barMaxScrollExtentHoriz;
        }

        double viewDelta = getScrollViewDelta(
            details.delta.dx, barMaxScrollExtentHoriz, viewMaxScrollExtent);

        _viewOffset = widget.controller.position.pixels + viewDelta;
        if (_viewOffset < widget.controller.position.minScrollExtent) {
          _viewOffset = widget.controller.position.minScrollExtent;
        }
        if (_viewOffset > viewMaxScrollExtent) {
          _viewOffset = viewMaxScrollExtent;
        }
        widget.controller.jumpTo(_viewOffset);
      }
    });
  }

  void dragEnd(DragEndDetails details) {
    setState(() {
      _isDragInProcess = false;
    });
  }

  void trailingButtonPress() {
    final double currentOffset = widget.controller.offset;
    setState(() {
      widget.controller.animateTo(currentOffset + 100,
          duration: const Duration(milliseconds: 200), curve: Curves.linear);
    });
  }

  void leadingButtonPress() {
    final double currentOffset = widget.controller.offset;
    setState(() {
      _thumbAnimationController.reverse();
      widget.controller.animateTo(currentOffset - 100,
          duration: const Duration(milliseconds: 200), curve: Curves.linear);
    });
  }

  bool checkLeadingButtonActivation() =>
      barMinScrollExtent == widget.controller.offset ? false : true;

  bool checkTrailingButtonActivation() =>
      viewMaxScrollExtent == widget.controller.offset
          ? false
          : true;
}


/*
import 'package:flutter/material.dart';
import 'dart:math' as math;

class DraggableScrollbar extends StatefulWidget {
  final BoxScrollView child;

  final double widthScrollThumb;

  final Color thumbColor;

  final Color iconColor;

  final Duration scrollbarAnimationDuration;

  final Duration scrollbarTimeToFade;

  final ScrollController controller;

  final Axis scrollDirection;

  final double radiusScrollThumb;

  const DraggableScrollbar({
    Key? key,
    required this.thumbColor,
    required this.child,
    required this.controller,
    required this.scrollDirection,
    this.scrollbarAnimationDuration = const Duration(milliseconds: 300),
    this.scrollbarTimeToFade = const Duration(milliseconds: 600),
    this.widthScrollThumb = 20.0,
    this.radiusScrollThumb = 2.0,
    this.iconColor = Colors.black,
  }) : super(key: key);

  @override
  DraggableScrollbarState createState() => DraggableScrollbarState();
}

class DraggableScrollbarState extends State<DraggableScrollbar>
    with TickerProviderStateMixin {
  late double _barOffset;
  late double _viewOffset;
  late bool _isDragInProcess;

  late AnimationController _thumbAnimationController;
  late Animation<double> _thumbAnimation;
  late double heightScrollThumb;
  double clcHight = 10.0;
  bool thumbHightCalculated = false;
  bool isLeadingButtonActivated = false;
  bool isTrailingButtonActivated = true;
  bool? isArrowButtonVisible;
  @override
  void initState() {
    super.initState();
    _barOffset = 0.0;
    _viewOffset = 0.0;
    _isDragInProcess = false;
    heightScrollThumb = 48.0;

    _thumbAnimationController = AnimationController(
      vsync: this,
      duration: widget.scrollbarAnimationDuration,
    );

    _thumbAnimation = CurvedAnimation(
      parent: _thumbAnimationController,
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void dispose() {
    _thumbAnimationController.dispose();
    super.dispose();
  }

  double get barMaxScrollExtent => context.size!.height - heightScrollThumb;

  double get barMaxScrollExtentHoriz => context.size!.width - heightScrollThumb;

  double get barMinScrollExtent => 0.0;

  double get viewMaxScrollExtent => widget.controller.position.maxScrollExtent;

  double get viewMinScrollExtent => widget.controller.position.minScrollExtent;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Future.delayed(Duration(seconds: 0),(){
              if (thumbHightCalculated) return;
              final viewPortHight = widget.scrollDirection == Axis.vertical
                  ? constraints.maxHeight
                  : constraints.maxWidth;
              clcHight =
                  (viewPortHight / viewMaxScrollExtent) * 100;
              // log('clcHight: $clcHight');
              // log('viewProthight: $viewPortHight');
              // log('he: ${widget.controller.position.viewportDimension }');
              // log('maxScrollExtent: $viewMaxScrollExtent');
              setState(() {
                isArrowButtonVisible = ((viewMaxScrollExtent + viewPortHight)/viewPortHight) > 1.5;
                if (clcHight.isFinite) {
                  heightScrollThumb = clcHight;
                }
                if (!isArrowButtonVisible!) {
                  heightScrollThumb = viewPortHight - ((viewPortHight / (viewMaxScrollExtent + viewPortHight)) * 100);
                  // log('heightScrollThumb: $heightScrollThumb');

                }
                thumbHightCalculated = true;
              });
            });
            // log('isArrowButtonHidden: $isArrowButtonVisible');
          });
          return NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification notification) {
              changePosition(notification);
              return false;
            },
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                  scrollbars: false, physics: const ClampingScrollPhysics()),
              child: widget.scrollDirection == Axis.vertical
                  ? buildVertical()
                  : buildHorizontal(),
            ),
          );
        });
  }

  Widget buildHorizontal() {
    return Column(
      children: [
        Expanded(
          child: RepaintBoundary(
            child: widget.child,
          ),
        ),
        Visibility(
          visible: clcHight.isFinite,
          child: Row(
            children: [
              customIconButton(
                isButtonActive: isLeadingButtonActivated,
                buttonPress: leadingButtonPress,
                iconImage: Icons.arrow_upward,
                width: 15,
                height: widget.widthScrollThumb,
              ),
              Expanded(
                child: RepaintBoundary(
                  child: GestureDetector(
                    onHorizontalDragStart: dragStart,
                    onHorizontalDragUpdate: onHorizontalDragUpdate,
                    onHorizontalDragEnd: dragEnd,
                    child: Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(
                        left: _barOffset < 0 ? 0 : _barOffset,
                      ),
                      child: Container(
                        height: widget.widthScrollThumb,
                        width: heightScrollThumb,
                        decoration: thumbDecoration(widget.radiusScrollThumb),
                      ),
                    ),
                  ),
                ),
              ),
              customIconButton(
                isButtonActive: isTrailingButtonActivated,
                buttonPress: trailingButtonPress,
                iconImage: Icons.arrow_downward,
                width: 15,
                height: widget.widthScrollThumb,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget buildVertical() {
    return Row(
      children: <Widget>[
        Expanded(
          child: RepaintBoundary(
            child: Container(
                height: 1000,
                child: widget.child),
          ),
        ),
        Visibility(
          visible: clcHight.isFinite,
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              border: Border(
                right: BorderSide( //                   <--- right side
                  color: Colors.grey,
                  width: 1.0,
                ),
                left: BorderSide( //                   <--- right side
                  color: Colors.grey,
                  width: 1.0,
                ),
                bottom: BorderSide( //                   <--- right side
                  color: Colors.grey,
                  width: 1.0,
                ),
                top: BorderSide( //                   <--- right side
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4,left: 2),
                  child: customIconButton(
                    isButtonActive: isLeadingButtonActivated,
                    buttonPress: leadingButtonPress,
                    iconImage: Icons.arrow_back_ios_new,
                    width: widget.widthScrollThumb,
                    height: 15,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 3,top: 0),
                  child: Container(
                    width: 30,
                    height: 1,
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  child: RepaintBoundary(
                    child: GestureDetector(
                      onVerticalDragStart: dragStart,
                      onVerticalDragUpdate: _onVerticalDragUpdate,
                      onVerticalDragEnd: dragEnd,
                      child: Container(
                        alignment: Alignment.topRight,
                        margin: EdgeInsets.only(
                          top: _barOffset < 0 ? 0 : _barOffset,
                        ),
                        child: Container(
                          height: heightScrollThumb,
                          width: widget.widthScrollThumb,
                          decoration: thumbDecoration(widget.radiusScrollThumb),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3, bottom: 3),
                  child: Container(
                    width: 30,
                    height: 1,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 2,left: 2),
                  child: customIconButton(
                    isButtonActive: isTrailingButtonActivated,
                    buttonPress: trailingButtonPress,
                    iconImage: Icons.arrow_back_ios_new,
                    width: widget.widthScrollThumb,
                    height: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  BoxDecoration thumbDecoration(double radius) {
    return BoxDecoration(
        color: widget.thumbColor, borderRadius: BorderRadius.circular(radius));
  }

  Widget customIconButton({
    required bool isButtonActive,
    required void Function() buttonPress,
    required IconData iconImage,
    required double width,
    required double height,
  }) {
    return Visibility(
      visible: isArrowButtonVisible ?? false,
      child: GestureDetector(
        onTap: () => !isButtonActive ? null : buttonPress(),
        child: Padding(
          padding: const EdgeInsets.only(left: 2,right: 5,bottom: 10),
          child: SizedBox(
            width: width,
            height: height,
            child: Icon(Icons.add,
              color: isButtonActive ? widget.iconColor : Colors.grey.shade400,
            ),

            // Transform.rotate(
            //     angle: buttonPress.toString().contains('trailing') ? 300 : math.pi / 2,
            //     child: Icon(
            //       iconImage,
            //       color: isButtonActive ? widget.iconColor : Colors.grey.shade400,
            //       size: 15,)),
          ),
        ),
      ),
    );
  }

  changePosition(ScrollNotification notification) {
    if (_isDragInProcess) {
      if (barMinScrollExtent == widget.controller.offset) {
        setState(() {
          isLeadingButtonActivated = false;
          isTrailingButtonActivated = true;
        });
      } else if (viewMaxScrollExtent ==
          widget.controller.offset) {
        setState(() {
          isLeadingButtonActivated = true;
          isTrailingButtonActivated = false;
        });
      } else {
        setState(() {
          isLeadingButtonActivated = true;
          isTrailingButtonActivated = true;
        });
      }
      return;
    }

    if (widget.scrollDirection == Axis.vertical) {
      setState(() {
        if (notification is ScrollUpdateNotification) {
          _barOffset += getBarDelta(
            notification.scrollDelta!,
            barMaxScrollExtent-65,
            viewMaxScrollExtent,
          );

          if (_barOffset < barMinScrollExtent) {
            _barOffset = barMinScrollExtent;
          }
          if (_barOffset > barMaxScrollExtent) {
            _barOffset = barMaxScrollExtent;
          }

          _viewOffset += notification.scrollDelta!;
          if (_viewOffset < widget.controller.position.minScrollExtent) {
            _viewOffset = widget.controller.position.minScrollExtent;
          }
          if (_viewOffset > viewMaxScrollExtent) {
            _viewOffset = viewMaxScrollExtent;
          }
        }

        if (notification is ScrollUpdateNotification ||
            notification is OverscrollNotification) {
          if (_thumbAnimationController.status != AnimationStatus.forward) {
            _thumbAnimationController.forward();
          }

          _thumbAnimationController.reverse();
        }
        isLeadingButtonActivated = checkLeadingButtonActivation();
        isTrailingButtonActivated = checkTrailingButtonActivation();
      });
    }
    if (widget.scrollDirection == Axis.horizontal) {
      setState(() {
        if (notification is ScrollUpdateNotification) {
          _barOffset += getBarDelta(
            notification.scrollDelta!,
            barMaxScrollExtentHoriz,
            viewMaxScrollExtent,
          );
          if (_barOffset < barMinScrollExtent) {
            _barOffset = barMinScrollExtent;
          }
          if (_barOffset > barMaxScrollExtentHoriz) {
            _barOffset = barMaxScrollExtentHoriz;
          }
          _viewOffset += notification.scrollDelta!;
          if (_viewOffset < widget.controller.position.minScrollExtent) {
            _viewOffset = widget.controller.position.minScrollExtent;
          }
          if (_viewOffset > viewMaxScrollExtent) {
            _viewOffset = viewMaxScrollExtent;
          }
        }
        if (notification is ScrollUpdateNotification ||
            notification is OverscrollNotification) {
          if (_thumbAnimationController.status != AnimationStatus.forward) {
            _thumbAnimationController.forward();
          }

          _thumbAnimationController.reverse();
        }
        isLeadingButtonActivated = checkLeadingButtonActivation();
        isTrailingButtonActivated = checkTrailingButtonActivation();
      });
    }
  }

  double getBarDelta(
      double scrollViewDelta,
      double barMaxScrollExtent,
      double viewMaxScrollExtent,
      ) {
    return scrollViewDelta * barMaxScrollExtent / viewMaxScrollExtent;
  }

  double getScrollViewDelta(
      double barDelta,
      double barMaxScrollExtent,
      double viewMaxScrollExtent,
      ) {
    return barDelta * viewMaxScrollExtent / barMaxScrollExtent;
  }

  void dragStart(DragStartDetails details) {
    setState(() {
      _isDragInProcess = true;
    });
  }


  void _onVerticalDragUpdate(DragUpdateDetails details) {
    setState(() {
      if (_thumbAnimationController.status != AnimationStatus.forward) {
        _thumbAnimationController.forward();
      }
      if (_isDragInProcess) {
        _barOffset += details.delta.dy;

        if (_barOffset < barMinScrollExtent) {
          _barOffset = barMinScrollExtent;
        }
        if (_barOffset > barMaxScrollExtent) {
          _barOffset = barMaxScrollExtent;
        }

        double viewDelta = getScrollViewDelta(
            details.delta.dy, barMaxScrollExtent, viewMaxScrollExtent);

        _viewOffset = widget.controller.position.pixels + viewDelta;
        if (_viewOffset < widget.controller.position.minScrollExtent) {
          _viewOffset = widget.controller.position.minScrollExtent;
        }
        if (_viewOffset > viewMaxScrollExtent) {
          _viewOffset = viewMaxScrollExtent;
        }
        widget.controller.jumpTo(_viewOffset);
      }
    });
  }

  void onHorizontalDragUpdate(DragUpdateDetails details) {
    setState(() {
      if (_thumbAnimationController.status != AnimationStatus.forward) {
        _thumbAnimationController.forward();
      }
      if (_isDragInProcess) {
        _barOffset += details.delta.dx;

        if (_barOffset < barMinScrollExtent) {
          _barOffset = barMinScrollExtent;
        }
        if (_barOffset > barMaxScrollExtentHoriz) {
          _barOffset = barMaxScrollExtentHoriz;
        }

        double viewDelta = getScrollViewDelta(
            details.delta.dx, barMaxScrollExtentHoriz, viewMaxScrollExtent);

        _viewOffset = widget.controller.position.pixels + viewDelta;
        if (_viewOffset < widget.controller.position.minScrollExtent) {
          _viewOffset = widget.controller.position.minScrollExtent;
        }
        if (_viewOffset > viewMaxScrollExtent) {
          _viewOffset = viewMaxScrollExtent;
        }
        widget.controller.jumpTo(_viewOffset);
      }
    });
  }

  void dragEnd(DragEndDetails details) {
    setState(() {
      _isDragInProcess = false;
    });
  }

  void trailingButtonPress() {
    print("barOffset : "+_barOffset.toString());
    final double currentOffset = widget.controller.offset;
    setState(() {
      widget.controller.animateTo(currentOffset + 100,
          duration: const Duration(milliseconds: 200), curve: Curves.linear);
    });
  }

  void leadingButtonPress() {
    final double currentOffset = widget.controller.offset;
    setState(() {
      _thumbAnimationController.reverse();
      widget.controller.animateTo(currentOffset - 100,
          duration: const Duration(milliseconds: 200), curve: Curves.linear);
    });
  }

  bool checkLeadingButtonActivation() =>
      barMinScrollExtent == widget.controller.offset ? false : true;

  bool checkTrailingButtonActivation() =>
      viewMaxScrollExtent == widget.controller.offset
          ? false
          : true;
}*/
