import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:messages_data/builder.dart';
import 'package:sprintf/sprintf.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/number_pad/number_pad.dart';
import 'package:widgets_library/utils/size_config.dart';

class TablePagination extends StatelessWidget {
  VoidCallback? onGo;
  VoidCallback? onNext;
  VoidCallback? onPrevious;
  VoidCallback? onStart;
  VoidCallback? onEnd;
  VoidCallback? onRetrieve;
  var pageController = TextEditingController();
  TextEditingController currentPageController = TextEditingController();
  int currentPage = 0;
  int totalPage = 0;
  bool? isSelected = false;

  TablePagination(
      {super.key,
      required this.currentPage,
      required this.totalPage,
      this.onStart,
      this.onEnd,
      this.onPrevious,
      this.onNext,
      this.onGo,
      required this.pageController,
      required this.currentPageController,
      this.onRetrieve,
      this.isSelected});

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          flex: 7,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            reverse: true,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CupertinoButton(
                    minSize: double.minPositive,
                    padding: EdgeInsets.zero,
                    onPressed: onStart,
                    child: Row(children: [
                      Image.asset('assets/back_arrow_white.png',
                          color: (currentPage > 0)
                              ? theme.secondaryColor
                              : theme.dividerColor,
                          height: 22,
                          width: 12,
                          fit: BoxFit.fitHeight),
                      Image.asset('assets/back_arrow_white.png',
                          color: (currentPage > 0)
                              ? theme.secondaryColor
                              : theme.dividerColor,
                          height: 22,
                          width: 12,
                          fit: BoxFit.fitHeight),
                    ])),
                IconButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: onPrevious,
                    icon: Image.asset('assets/back_arrow_white.png',
                        height: 22,
                        color: (currentPage > 0)
                            ? theme.secondaryColor
                            : theme.dividerColor)),
                Container(
                    //padding: const EdgeInsets.all(8.0),
                    margin:
                        const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 3),
                    /* decoration: BoxDecoration(
                      border:  Border.all(color: Colors.black) ,
                      borderRadius: BorderRadius.circular(6),
                    ),*/
                    width: 25,
                    child: TextFormField(
                      controller: currentPageController,
                      textAlign: TextAlign.center,
                      readOnly: true,
                      showCursor: true,
                      onTap: () => showDialog(
                          barrierDismissible: true,
                          context: context,
                          barrierColor: const Color(0x01000000),
                          builder: (BuildContext context) {
                            return NumberPad(
                              initialOffset: const Offset(50, 50),
                              title: '',
                              onOkPressed: (value) {
                                if (value >= totalPage) {
                                  currentPageController.text =
                                      totalPage.toString();
                                } else {
                                  currentPageController.text = value.toString();
                                }
                              },
                            );
                          }),
                      textAlignVertical: TextAlignVertical.center,
                      validator: (value) {
                        /*if(validationText == null){
                                        return null;
                                      }else if (value == null || value.isEmpty) {
                                        return validationText;
                                      }*/
                        return null;
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[0-9.,]+')),
                      ],
                      maxLength: 3,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: theme.secondaryColor!),
                        ),
                        border: const OutlineInputBorder(),
                        isDense: true,
                        counterText: '',
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 8),
                      ),
                      style: theme.subtitle3?.copyWith(
                          color: theme.secondaryColor,
                          fontSize: SizeConfig.getFontSize(16),
                          fontWeight: FontWeight.w500),
                    )),
                //    Text((currentPage+1).toString(),style: AppStyle.customerText,)),
                Text(
                  sprintf(MessagesProvider.get("of %d"),
                      [totalPage == 0 ? 1 : totalPage]),
                  style: theme.subtitle2?.copyWith(
                      color: theme.secondaryColor, fontWeight: FontWeight.w500,
                   fontSize: SizeConfig.getFontSize(16)),
                ),
                IconButton(
                  onPressed: onNext,
                  icon: Image.asset('assets/ic_right_arrow.png',
                      height: 22,
                      color: currentPage + 1 < (totalPage ?? 0)
                          ? theme.secondaryColor
                          : theme.dividerColor),
                  padding: const EdgeInsets.all(0),
                ),
                CupertinoButton(
                    minSize: double.minPositive,
                    padding: EdgeInsets.zero,
                    onPressed: onEnd,
                    child: Row(
                      children: [
                        Image.asset('assets/ic_right_arrow.png',
                            color: currentPage + 1 < (totalPage ?? 0)
                                ? theme.secondaryColor
                                : theme.dividerColor,
                            height: 22,
                            width: 12,
                            fit: BoxFit.fitHeight),
                        Image.asset('assets/ic_right_arrow.png',
                            color: currentPage + 1 < (totalPage ?? 0)
                                ? theme.secondaryColor
                                : theme.dividerColor,
                            height: 22,
                            width: 12,
                            fit: BoxFit.fitHeight)
                      ],
                    )),
                //Flexible(child: TextFormField()),
                const SizedBox(
                  width: 8.0,
                ),
                SizedBox(
                  width: 50,
                  child: TextFormField(
                    controller: pageController,
                    textAlign: TextAlign.center,
                    readOnly: true,
                    showCursor: true,
                    onTap: () => showDialog(
                        barrierDismissible: true,
                        context: context,
                        barrierColor: const Color(0x01000000),
                        builder: (BuildContext context) {
                          return NumberPad(
                            initialOffset: const Offset(50, 50),
                            title: '',
                            onOkPressed: (value) {
                              if (value >= 100) {
                                pageController.text = "100";
                              } else {
                                pageController.text = value.toString();
                              }
                            },
                          );
                        }),
                    textAlignVertical: TextAlignVertical.center,
                    validator: (value) {
                      /*if(validationText == null){
                                        return null;
                                      }else if (value == null || value.isEmpty) {
                                        return validationText;
                                      }*/
                      return null;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9.,]+')),
                    ],
                    maxLength: 3,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: theme.secondaryColor!),
                      ),
                      border: const OutlineInputBorder(),
                      isDense: true,
                      counterText: '',
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 8),
                    ),
                    style: theme.subtitle2?.copyWith(
                        color: theme.secondaryColor,
                        fontSize: SizeConfig.getFontSize(16),
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  MessagesProvider.get("Per page").toUpperCase(),
                  style: theme.subtitle2?.copyWith(
                      color: theme.secondaryColor, fontWeight: FontWeight.w500, fontSize: SizeConfig.getFontSize(16)),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                ElevatedButton(
                    onPressed: onGo,
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.zero,
                      padding: const EdgeInsets.only(
                          left: 12.0, right: 12, top: 8.0, bottom: 8.0),
                      backgroundColor: theme.button2InnerShadow1!,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0)),
                    ),
                    child: Text(
                      MessagesProvider.get("go").toUpperCase(),
                      style: theme.subtitle2?.copyWith(color: theme.light1, fontSize: SizeConfig.getFontSize(16)),
                      textAlign: TextAlign.center,
                    )),
              ],
            ),
          ),
        ),
        Visibility(
          visible: onRetrieve == null ? false : true,
          //visible: false,
          child: SizedBox(
            width: (MediaQuery.of(context).size.width * 0.28),
            child: ElevatedButton(
                onPressed: onRetrieve,
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: const EdgeInsets.only(
                      left: 12.0, right: 12, top: 8.0, bottom: 8.0),
                  backgroundColor: (isSelected ?? false)
                      ? theme.button2InnerShadow1!
                      : Colors.grey.shade300,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0)),
                ),
                child: Text(
                  MessagesProvider.get("retrieve").toUpperCase(),
                  style: theme.subtitle1?.copyWith(color: theme.light1, fontSize: SizeConfig.getFontSize(16),
                  fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                )),
          ),
        )
      ],
    ); //darkGrey1
  }
}
