import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:other_function_ui/bloc/cubits/panels/choose_font/choose_font_cubit.dart';
import 'package:other_function_ui/bloc/cubits/panels/choose_font/choose_font_state.dart';
import 'package:other_function_ui/utils/constants.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/scroller.dart';
import '../../widgets/primary_dark_button.dart';
import '../../widgets/primary_light_button.dart';
import 'package:widgets_library/utils/size_config.dart';


class SetUpFontDialog extends StatelessWidget {
  const SetUpFontDialog({Key? key, required this.onConfirm}) : super(key: key);
  final Function onConfirm;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChooseFontCubit>(
        create: (context) => ChooseFontCubit(),
        child:  SetUpFontDialogSection(onConfirm: onConfirm));
  }
}

class SetUpFontDialogSection extends StatefulWidget {
  const SetUpFontDialogSection({Key? key, required this.onConfirm}) : super(key: key);
  final Function onConfirm;

  @override
  State<SetUpFontDialogSection> createState() => _SetUpFontDialogSectionState();
}

class _SetUpFontDialogSectionState extends State<SetUpFontDialogSection> {
  Size _screenSize = const Size(0, 0);
  double _screenWidth = 0.0;
  double _screenHeight = 0.0;
  NotificationBar? _notificationBar;
  bool isExpanded = false;
  late SemnoxTheme _theme;
  final _scrollController  = ScrollController();

  @override
  void initState() {
    context.read<ChooseFontCubit>().setInitialValues();
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
      body:   BlocConsumer<ChooseFontCubit,
          ChooseFontState>(
          listener: (context, state) {},
          builder: (context, state) {
          return Column(
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
                          // width:5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               SizedBox(
                                width: SizeConfig.getSize(8),
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
                                MessagesProvider.get('Font Picker').toUpperCase(),
                                style:_theme.headingLight2!.copyWith(color:_theme.light1, fontSize:SizeConfig.getFontSize(22)),
                              ),
                               SizedBox(
                                width: SizeConfig.getSize(10),
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
                          height: SizeConfig.getSize(64),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(child: Padding(
                padding:  EdgeInsets.only(left:SizeConfig.getSize(8),right:SizeConfig.getSize(8)),
                child: Container(
                  color: _theme.backGroundColor,
                  child :Scroller(
                    controller:_scrollController,
                    child: CustomScrollView(  //Instead of ListView or SingleChildScrollView put CustomScrollVIew to use Expanded or spacer
                     controller: _scrollController,
                      slivers: [
                        SliverFillRemaining(
                          hasScrollBody: false,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: _screenWidth/2.2,
                                    child: Padding(
                                      padding:
                                       EdgeInsets.all(SizeConfig.getSize(8)),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment
                                            .start,
                                        children: [
                                           SizedBox(
                                            height: SizeConfig.getSize(8),
                                          ),
                                          Text(
                                            MessagesProvider.get(
                                                "Font Family"),
                                            style: _theme.heading5!.copyWith(fontSize:SizeConfig.getFontSize(18)),
                                          ),
                                           SizedBox(
                                            height: SizeConfig.getSize(8),
                                          ),
                                          SizedBox(
                                            height:SizeConfig.getSize(52),
                                            child: DropdownButtonFormField(
                                              isExpanded: true,
                                              items: state
                                                  .fontFamilyList
                                                  .map<
                                                  DropdownMenuItem<
                                                      String>>((String
                                              value) {
                                                return DropdownMenuItem<
                                                    String>(
                                                  value: value,
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets
                                                        .only(
                                                        left:
                                                        8.0),
                                                    child:
                                                    Text(value),
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (value) {
                                                context.read<ChooseFontCubit>().onSelectFontFamily(value);

                                              },
                                              value: state
                                                  .fontFamilyList
                                                  .contains(state
                                                  .selectedFontFamily)
                                                  ? (state.selectedFontFamily??'RobotoCondensed')
                                                  .isNotEmpty
                                                  ? state
                                                  .selectedFontFamily
                                                  : 'Roboto'
                                                  : 'Roboto',
                                              validator: (value) {},
                                              hint: Text(
                                                MessagesProvider.get(
                                                    'Select Font Family'),
                                                style:  _theme.textFieldHintStyle!.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                              ),
                                              style:_theme.subtitle1!.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                              isDense: true,
                                              decoration: AppDecorations
                                                  .textFieldInputDecoration
                                                  .copyWith(
                                                  hintStyle:
                                                  _theme.textFieldHintStyle!.copyWith(fontSize: SizeConfig.getFontSize(18))),
                                              icon: SizedBox(
                                                height: SizeConfig.getSize(25),
                                                width:SizeConfig.getSize(25),
                                                child: Image.asset(
                                                    'assets/down_arrow_white.png',
                                                    color:_theme.secondaryColor!),
                                              ),
                                              // isExpanded: true,
                                            ),
                                          ),
                                           SizedBox(
                                            height: SizeConfig.getSize(16),
                                          ),
                                          Text(
                                            MessagesProvider.get(
                                                "Style"),
                                            style:  _theme.heading5!.copyWith(fontSize:SizeConfig.getFontSize(18)),
                                          ),
                                           SizedBox(
                                            height: SizeConfig.getSize(10),
                                          ),
                                          SizedBox(
                                            height:SizeConfig.getSize(52),
                                            child: DropdownButtonFormField(
                                              isExpanded: true,
                                              items: state.fontStyleList
                                                  .map<
                                                  DropdownMenuItem<
                                                      String>>(
                                                      (String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      enabled: value != "Style Stretch Weight",
                                                      value: value,
                                                      child:value == "Style Stretch Weight"?
                                                      Padding(
                                                        padding:
                                                        const EdgeInsets
                                                            .only(
                                                            left: 8.0),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                SizedBox(
                                                                    width:60,
                                                                    child: Text(value.split(" ")[0], style: TextStyle(fontWeight: FontWeight.bold),)),
                                                                SizedBox(
                                                                    width:60,
                                                                    child: Text(value.split(" ")[1],  style: TextStyle(fontWeight: FontWeight.bold),)),
                                                                SizedBox(
                                                                    width:60,
                                                                    child: Text(value.split(" ")[2],  style: TextStyle(fontWeight: FontWeight.bold),)),
                                                              ],
                                                            ),
                                                            const SizedBox(height: 4,),
                                                            Container(
                                                              height: 1,
                                                              width: _screenWidth/2.2,
                                                              color: _theme.dialogFooterInnerShadow,
                                                            )
                                                          ],
                                                        ),
                                                      ):
                                                      Padding(
                                                        padding:
                                                        const EdgeInsets
                                                            .only(
                                                            left: 8.0),
                                                        child: Row(
                                                          children: [
                                                            SizedBox(
                                                                width:60,
                                                                child: Text(value.split(" ")[0])),
                                                            SizedBox(
                                                                width:60,
                                                                child: Text(value.split(" ")[1])),
                                                            SizedBox(
                                                                width:60,
                                                                child: Text(value.split(" ")[2])),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  }).toList(),
                                              onChanged: (value) {
                                                context.read<ChooseFontCubit>().onSelectFontStyle(value);
                                              },
                                              value: state.selectedFontStyle,
                                              validator: (value) {},
                                              hint: Text(
                                                MessagesProvider.get('Select Font Style'),
                                                style:  _theme.textFieldHintStyle!.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                              ),
                                              style:_theme.subtitle1!.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                              isDense: true,
                                              decoration: AppDecorations.textFieldInputDecoration.copyWith( hintStyle:  _theme.textFieldHintStyle!.copyWith(fontSize: SizeConfig.getFontSize(18)),),
                                              icon: SizedBox(
                                                height: SizeConfig.getSize(25),
                                                width:SizeConfig.getSize(25),
                                                child: Image.asset(
                                                    'assets/down_arrow_white.png',
                                                    color: _theme.secondaryColor!),
                                              ),
                                              // isExpanded: true,
                                            ),
                                          ),

                                           SizedBox(
                                            height: SizeConfig.getSize(16),
                                          ),
                                          Text(
                                            MessagesProvider.get(
                                                "Size"),
                                            style: _theme.heading5!.copyWith(fontSize:SizeConfig.getFontSize(18)),
                                          ),
                                           SizedBox(
                                            height: SizeConfig.getSize(8),
                                          ),
                                          SizedBox(
                                            height: SizeConfig.getSize(52),
                                            child: DropdownButtonFormField(
                                              items: state
                                                  .fontSizeList
                                                  .map<
                                                  DropdownMenuItem<
                                                      int>>((int
                                              value) {

                                                return DropdownMenuItem<
                                                    int>(
                                                  value: value,
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets
                                                        .only(
                                                        left:
                                                        8.0),
                                                    child: Text(value
                                                        .toString()),
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (value) {
                                                context.read<ChooseFontCubit>().onSelectFontSize(value);
                                              },
                                              value: state
                                                  .selectedFontSize,
                                              validator: (value) {},
                                              hint: Text(
                                                MessagesProvider.get(
                                                    'Select Font Size'),
                                                style:  _theme.textFieldHintStyle!.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                              ),
                                              style:_theme.subtitle1!.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                              isDense: true,
                                              decoration: AppDecorations
                                                  .textFieldInputDecoration
                                                  .copyWith(
                                                  hintStyle: _theme.textFieldHintStyle!.copyWith(fontSize: SizeConfig.getFontSize(18)),),
                                              icon: SizedBox(
                                                height: SizeConfig.getSize(25),
                                                width:SizeConfig.getSize(25),
                                                child: Image.asset(
                                                    'assets/down_arrow_white.png',
                                                    color:_theme.secondaryColor!),
                                              ),
                                              // isExpanded: true,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: _screenWidth/2.2,
                                    height: _screenHeight/3,
                                    child: Center(
                                        child: Text(
                                          "AaBbYyZz",
                                          style: TextStyle(
                                              fontSize: double.parse(state.selectedFontSize.toString())??14.00,
                                              fontStyle: getFontStyle(state.selectedFontStyle.toString().split(" ")[0]??"Normal"),
                                              fontFamily: getFontFamily(state.selectedFontFamily??'RobotoCondensed'),
                                              fontWeight: getFontWeight(state.selectedFontStyle.toString().split(" ")[2])),
                                        )),
                                  )
                                ],
                              ),
                            ],),
                        ),],
                    ),
                  ),
                ),
              )),


              // Expanded(
              //   child: CustomScrollView(
              //     //Instead of ListView or SingleChildScrollView put CustomScrollVIew to use Expanded or spacer
              //     scrollDirection: Axis.vertical,
              //     // scrollBehavior:const MaterialScrollBehavior(),
              //     slivers: [
              //       SliverFillRemaining(
              //         hasScrollBody: true,
              //         child: Padding(
              //           padding:
              //               const EdgeInsets.only(left: 8.0, right: 8, bottom: 0),
              //           child: Container(
              //             decoration:  BoxDecoration(
              //                 color: _theme.backGroundColor!,
              //                 ),
              //             child: Column(
              //                 mainAxisAlignment: MainAxisAlignment.start,
              //                 crossAxisAlignment: CrossAxisAlignment.center,
              //                 children: [
              //
              //
              //                 ]),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8, right: 8, left: 8),
                child: Container(
                  decoration: BoxDecoration(
                      color: _theme.backGroundColor!,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(8),
                          bottomLeft: Radius.circular(8))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 4.0, top: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PrimaryLightButton(onPressed: (){
                          Navigator.pop(context);
                        }, title: MessagesProvider.get('Cancel').toUpperCase()),
                        const SizedBox(width: 8,),
                        PrimaryDarkButton(onPressed: (){
                          widget.onConfirm("${state.selectedFontFamily},${state.selectedFontSize},style=${state.selectedFontStyle}");
                          Navigator.pop(context);
                        }, title: MessagesProvider.get('Confirm').toUpperCase())
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        }
      ),
    );
  }

  String getFontFamily(String fontFamilyString) {
    if (fontFamilyString.isNotEmpty) {
      try {
        return GoogleFonts.getFont(fontFamilyString).fontFamily ??
            'RobotoCondensed';
      } catch (error) {
        return 'RobotoCondensed';
      }
    } else {
      return 'RobotoCondensed';
    }
  }

  FontWeight getFontWeight(fontWeightString) {
    switch (fontWeightString) {
      case 'Normal':
        return FontWeight.normal;
      case 'Bold':
        return FontWeight.bold;
      default:
        return FontWeight.normal;
    }
  }

  FontStyle getFontStyle(String fontStyleString) {
    switch (fontStyleString) {
      case 'Normal':
        return FontStyle.normal;
      case 'Italic':
        return FontStyle.italic;
      default:
        return FontStyle.normal;
    }
  }
}
