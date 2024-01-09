import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class NumberPad extends StatefulWidget {
  final String? title;
  final Function onOkPressed;
  final bool? isDecimalRequired;
  final bool? isInitialRequired;
  final int? initialIntValue;
  final double? initialDecimalValue;
  final Offset? initialOffset;
  final bool? isZeroRequired;
  final bool? shouldReturnEmptySpace;
  final bool barrierDismissible;

  const NumberPad({Key? key,
    required this.title,
    required this.onOkPressed,
    this.isDecimalRequired = false,
    this.isInitialRequired = false,
    this.initialIntValue = 0,
    this.initialDecimalValue = 0.00,
    this.initialOffset = const Offset(50, 50),
    this.isZeroRequired = false,
    this.shouldReturnEmptySpace = false,
    this.barrierDismissible = false
  }) : super(key: key);

  @override
  State<NumberPad> createState() => _NumberPadState();
}

class _NumberPadState extends State<NumberPad> {
  final _numberController = TextEditingController();
  NotificationBar? _notificationBar;
  Size _screenSize = const Size(0, 0);
  double _screenWidth = 0.00;
  double _screenHeight = 0.00;
  bool _onFirstTap = false;
  late SemnoxTheme _theme;

  @override
  void initState() {
    _notificationBar = NotificationBar(showHideSideBar: false);
    (widget.isInitialRequired??false) ? _numberController.text = (widget.isDecimalRequired??false)? widget.initialDecimalValue.toString(): widget.initialIntValue.toString():'';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context).extension<SemnoxTheme>()!;
    _screenSize = MediaQuery
        .of(context)
        .size;
    _screenHeight = _screenSize.height;
    _screenWidth = _screenSize.width;
    SizeConfig.init(context);
    return Scaffold(
        backgroundColor: _theme.transparentColor,
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: Container(
          child: _notificationBar,
        ),
        body: StatefulDragArea(
          initialOffset: widget.initialOffset??const Offset(50, 50),
          screenSize: _screenSize,
          barrierDismissible: widget.barrierDismissible,
          child: Material(
            color: _theme.transparentColor,
            child: Center(
              child: SizedBox(
                height: SizeConfig.getSize(325),
                width: SizeConfig.getSize(280),
                child: Stack(
                  children: [
                    Center(
                      child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(6)),
                            color: Colors.black,
                          ),
                          height: SizeConfig.getSize(286),
                          width: SizeConfig.getSize(250),
                          child: Padding(
                            padding:  EdgeInsets.all(SizeConfig.getSize(8)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding:  EdgeInsets.only(left: SizeConfig.getSize(2)),
                                    child: Text(
                                      widget.title ?? '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: _theme.headingLight4!.copyWith(fontSize: SizeConfig.getFontSize(20)),
                                    ),
                                  ),
                                ),
                                 SizedBox(
                                  height: SizeConfig.getSize(8),
                                ),
                                Container(
                                    width: SizeConfig.getSize(228),
                                    decoration:  BoxDecoration(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(SizeConfig.getSize(8))),
                                      color: Colors.white,
                                    ),
                                    child: Center(
                                      child: SizedBox(
                                        height: SizeConfig.getSize(42),
                                        child: TextFormField(
                                          maxLines: 1,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                                          ],
                                          readOnly: true,
                                          textAlignVertical: TextAlignVertical.center,
                                          style: _theme.heading4!.copyWith(color: Colors.black, fontSize: SizeConfig.getFontSize(20)),
                                          textAlign: TextAlign.right,
                                          controller: _numberController,
                                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                          decoration:  InputDecoration(
                                            contentPadding:  EdgeInsets.only(top: SizeConfig.getSize(10), bottom: SizeConfig.getSize(5), right: SizeConfig.getSize(5), left: SizeConfig.getSize(10)),
                                            isDense: true,
                                            filled: true,
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    )),
                                 SizedBox(
                                  height: SizeConfig.getSize(8),
                                ),
                                IntrinsicHeight(
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      numbersButton(title: "1"),
                                      numbersButton(title: "2"),
                                      numbersButton(title: "3"),
                                      numbersButton(title: "C")
                                    ],
                                  ),
                                ),
                                 SizedBox(
                                  height: SizeConfig.getSize(6),
                                ),
                                IntrinsicHeight(
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      numbersButton(title: "4"),
                                      numbersButton(title: "5"),
                                      numbersButton(title: "6"),
                                      numbersButton(title: "arrow")
                                    ],
                                  ),
                                ),
                                 SizedBox(
                                  height: SizeConfig.getSize(6),
                                ),
                                IntrinsicHeight(
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      numbersButton(title: "7"),
                                      numbersButton(title: "8"),
                                      numbersButton(title: "9"),
                                      numbersButton(title: ".")
                                    ],
                                  ),
                                ),
                                 SizedBox(
                                  height: SizeConfig.getSize(6),
                                ),
                                IntrinsicHeight(
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      zeroButton(title: "0"),
                                       SizedBox(width: SizeConfig.getWidth(6),),
                                      okButton(title: "OK"),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: CircleAvatar(
                          radius: SizeConfig.getSize(25),
                          backgroundColor: _theme.button2InnerShadow1,
                          child: Center(
                            child: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: SizeConfig.getSize(25)
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget numbersButton({title}) {
    // return BlocBuilder<NumberPadCubit, NumberPadState>(builder: builder)
    return Expanded(
      child: Padding(
        padding:  EdgeInsets.only(right: SizeConfig.getSize(3), left: SizeConfig.getSize(3)),
        child: ElevatedButton(
            onPressed: () {
              if(!_onFirstTap){
                _numberController.clear();
               _onFirstTap = true;
              }
              if (title == 'C') {
                _numberController.clear();
              } else if (title == 'arrow') {
                if (_numberController.text.isNotEmpty) {
                  _numberController.text = _numberController.text
                      .substring(0, _numberController.text.length - 1);
                }
              } else if (title == '.' && !(widget.isDecimalRequired ??false)) {

              } else {
                // _numberController.selection = TextSelection.fromPosition(TextPosition(offset: _numberController.text.length));
                _numberController.text = _numberController.text + title;
              }
              setState(() {});
            },
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(SizeConfig.getWidth(4)),
                tapTargetSize:
                MaterialTapTargetSize.shrinkWrap,
                maximumSize: Size(SizeConfig.getSize(53),SizeConfig.getSize(43)),
                minimumSize:  Size(SizeConfig.getSize(53),SizeConfig.getSize(43)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      SizeConfig.getSize(8)), // <-- Radius
                ),
              backgroundColor:const Color.fromARGB(255, 61, 61, 61)
            ),
            child: title == 'arrow'
                ? Image.asset(
              'assets/ic_back_arrow_white.png',
              height: SizeConfig.getSize(20),
              width:  SizeConfig.getSize(20),
            )
                : Text(
              '$title',
              style: _theme.headingLight4!.copyWith(color:Colors.white, fontSize: SizeConfig.getFontSize(20)),
            )),
      ),
    );
  }

  Widget okButton({title}) {
    return Expanded(
      child: Padding(
        padding:  EdgeInsets.only(right:SizeConfig.getSize(3)),
        child: ElevatedButton(
            onPressed: () {
              if(widget.shouldReturnEmptySpace == true) {
                if(_numberController.text.toString().isEmpty) {
                  Navigator.pop(context);
                  widget.onOkPressed('');
                  return;
                }
              }
              List<String> _listOfDots = [];
              for(var i=0;i<_numberController.text.length;i++){
                if(_numberController.text[i] =="."){
                  _listOfDots.add(_numberController.text[i]);
                }
              }
              if(_listOfDots.length>1){
                _notificationBar?.showMessage(
                    '${MessagesProvider.get('Invalid Number')} ',
                    _theme.footerBG3!);

              }else{
                if (!(widget.isDecimalRequired ??false) && _numberController.text.isNotEmpty
                ) {
                  if (
                  int.parse(_numberController.text.toString()) >= 0 && (widget.isZeroRequired??false)) {
                    Navigator.pop(context);
                    widget.onOkPressed(int.parse(_numberController.text));
                  }else if(int.parse(_numberController.text.toString()) > 0 && !(widget.isZeroRequired??false)){
                    Navigator.pop(context);
                    widget.onOkPressed(int.parse(_numberController.text));
                  } else {
                    _notificationBar?.showMessage(
                        '${MessagesProvider.get('Minimum required')} ${widget
                            .title} ${MessagesProvider.get('is')} 1',
                        _theme.footerBG3!);
                  }
                } else if (widget.isDecimalRequired ??false) {
                  if (_numberController.text.isNotEmpty && _numberController.text != '.') {
                    Navigator.pop(context);
                    widget.onOkPressed(double.parse(_numberController.text));
                  } else {
                    _notificationBar?.showMessage(
                        '${MessagesProvider.get('Minimum required')} ${widget
                            .title} ${MessagesProvider.get('is')} 0',
                        _theme.footerBG3!);
                  }
                } else {
                  _notificationBar?.showMessage(
                      '${MessagesProvider.get('Minimum required')} ${widget
                          .title} ${MessagesProvider.get('is')} 1',
                      _theme.footerBG3!);
                }

              }

            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(SizeConfig.getWidth(4)),
              tapTargetSize:
              MaterialTapTargetSize.shrinkWrap,
              maximumSize: Size(SizeConfig.getSize(140),SizeConfig.getSize(43)),
              minimumSize:  Size(SizeConfig.getSize(140),SizeConfig.getSize(43)),
              backgroundColor:const Color.fromARGB(255, 61, 61, 61),
            ),
            child: Text(
              '$title',
              style:  _theme.headingLight4!.copyWith(color:Colors.white, fontSize: SizeConfig.getFontSize(20)),
            )),
      ),
    );
  }

  Widget zeroButton({title}) {
    return Expanded(
      child: Padding(
        padding:  EdgeInsets.only(left: SizeConfig.getWidth(3)),
        child: ElevatedButton(
            onPressed: () {
              if(!_onFirstTap){
                _numberController.clear();
                _onFirstTap = true;
              }
              _numberController.text = _numberController.text + title;
              setState(() {});
            },
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(SizeConfig.getWidth(4)),
              tapTargetSize:
              MaterialTapTargetSize.shrinkWrap,
              maximumSize: Size(SizeConfig.getSize(140),SizeConfig.getSize(43)),
              minimumSize:  Size(SizeConfig.getSize(140),SizeConfig.getSize(43)),
              backgroundColor: const Color.fromARGB(255, 61, 61, 61),
            ),
            child: Text(
              '$title',
              style: _theme.headingLight4!.copyWith(color:Colors.white,  fontSize: SizeConfig.getFontSize(20)),
            )),
      ),
    );
  }
}

class StatefulDragArea extends StatefulWidget {
  final Widget child;
  final Size screenSize;
  final Offset initialOffset ;
  final bool barrierDismissible;

  const StatefulDragArea({
    Key? key,
    required this.child,
    required this.screenSize,
    required this.initialOffset,
    required this.barrierDismissible
  })
      : super(key: key);

  @override
  _DragAreaStateStateful createState() => _DragAreaStateStateful();
}

class _DragAreaStateStateful extends State<StatefulDragArea> {
  Offset position = const Offset(50, 50);

  @override
  void initState() {
    position = widget.initialOffset;
    // position = Offset.fromDirection(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            if(widget.barrierDismissible) {
              Navigator.pop(context);
            }
          },
          child: const SizedBox(),
        )),
        Positioned(
          left: position.dx,
          top: position.dy,
          child: Draggable(
            feedback: widget.child,
            childWhenDragging: Opacity(
              opacity: .0,
              child: widget.child,
            ),
            onDragEnd: (details) => setState(() => position = details.offset),
            child: widget.child,
          ),
        ),
      ],
    );
  }
}
