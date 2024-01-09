import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:other_function_ui/bloc/cubits/panels/edit_panels/edit_panels_cubit.dart';
import 'package:other_function_ui/bloc/cubits/panels/panels_state.dart';
import 'package:other_function_ui/bloc/cubits/product_menu/product_menu/product_menu_cubit.dart';
import 'package:other_function_ui/bloc/cubits/product_menu/product_menu/product_menu_state.dart';
import 'package:other_function_ui/bloc/cubits/setup_menu_dashboard/setup_menu_dashboard_state.dart';
import 'package:other_function_ui/screens/static_menu_screens/panels/panels_screen.dart';
import 'package:other_function_ui/screens/static_menu_screens/product_menu/product_menu_section.dart';
import 'package:messages_data/builder.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'package:themes_library/themes_library.dart';
import '../../bloc/cubits/panels/panels_cubit.dart';
import '../../bloc/cubits/setup_menu_dashboard/setup_menu_dashboard_cubit.dart';

class StaticMenuDashBoard extends StatelessWidget {
  const StaticMenuDashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<SetUpMenuDashBoardCubit>(
          create: (BuildContext context) => SetUpMenuDashBoardCubit()),
      BlocProvider<PanelsCubit>(
          create: (BuildContext context) => PanelsCubit()),
      BlocProvider<EditPanelsCubit>(
        create:(context) =>EditPanelsCubit()
      ),
      BlocProvider<ProductMenuCubit>(
          create:(context) =>ProductMenuCubit()
      ),
      // BlocProvider<EditPanelsCubit>.value(value: EditPanelsCubit(),)

    ], child: const StaticMenuDashBoardPage());
  }
}

class StaticMenuDashBoardPage extends StatefulWidget {
  const StaticMenuDashBoardPage({Key? key}) : super(key: key);

  @override
  State<StaticMenuDashBoardPage> createState() =>
      _StaticMenuDashBoardPageState();
}

class _StaticMenuDashBoardPageState extends State<StaticMenuDashBoardPage> {
  NotificationBar? _notificationBar;
  static late SemnoxTheme _theme;

  @override
  void initState() {
    super.initState();
    _notificationBar = NotificationBar(
      showHideSideBar: true,
      onSideBarStatusUpdate: (shouldShowSidebar) {
        context.read<SetUpMenuDashBoardCubit>().changeSideBar();
      },
    );
    context
        .read<SetUpMenuDashBoardCubit>()
        .initState(initialSelectedTab: "PANELS", isShowSideBar: true);
  }



  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    _theme = Theme.of(context).extension<SemnoxTheme>()!;
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async => false,
        child: Material(
          color: _theme.transparentColor,
          child: Stack(
            children: [
              Scaffold(
                  bottomNavigationBar: SizedBox(
                    width: SizeConfig.screenWidth,
                    child: Container(
                      child: _notificationBar,
                    ),
                  ),
                  body: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                  BlocConsumer<SetUpMenuDashBoardCubit, SetUpMenuDashBoardState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        if (!state.showSideBar) {
                          return const SizedBox();
                        }
                        return Container(
                          width: (SizeConfig.blockSizeHorizontal * 17.5) + 7,
                          color: Colors.black,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 21),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Row(
                                  children: [
                                     SizedBox(
                                      width: SizeConfig.getWidth(21),
                                    ),
                                    SizedBox(
                                      height: SizeConfig.getHeight(35),
                                      width:  SizeConfig.getWidth(20),
                                      child: Image.asset(
                                          'assets/back_arrow_white.png'),
                                    ),
                                     SizedBox(
                                      width: SizeConfig.getWidth(21),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          MessagesProvider.get(
                                                  'Setup product menu')
                                              .toUpperCase(),
                                          style: _theme.headingLight2!.copyWith(color:_theme.light1, fontSize:SizeConfig.getFontSize(26)),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 3,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                               SizedBox(height: SizeConfig.getSize(24)),
                              Column(
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.symmetric(
                                        horizontal: SizeConfig.getSize(10)),
                                    child: TextButton(
                                      onPressed: () {
                                        context
                                            .read<SetUpMenuDashBoardCubit>()
                                            .changeTab("PANELS");
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              state.selectedButtonValue ==
                                                      'PANELS'
                                                  ? _theme.button2BG1
                                                  : _theme.transparentColor,
                                          padding: EdgeInsets.all(SizeConfig.getWidth(4)),
                                          tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                          minimumSize:  Size(SizeConfig.getSize(210), SizeConfig.getSize(40)),
                                          maximumSize:  Size(SizeConfig.getSize(210), SizeConfig.getSize(40)),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(SizeConfig.getSize(8)),
                                          )
                                        ),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding:  EdgeInsets.symmetric(
                                              horizontal:SizeConfig.getSize(4)),
                                          child: Text(
                                            MessagesProvider.get('Panels'),
                                            style:_theme.subtitleLight3!.copyWith(color: Colors.white, fontSize: SizeConfig.getFontSize(24)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: SizeConfig.getSize(4)),
                                  Padding(
                                    padding:  EdgeInsets.symmetric(
                                        horizontal:SizeConfig.getSize(10)),
                                    child: TextButton(
                                        onPressed: () {
                                          context
                                              .read<SetUpMenuDashBoardCubit>()
                                              .changeTab("PRODUCTMENU");
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                state.selectedButtonValue ==
                                                        'PRODUCTMENU'
                                                    ?_theme.button2BG1
                                                    : _theme.transparentColor,
                                            padding: EdgeInsets.all(SizeConfig.getWidth(4)),
                                            tapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                            minimumSize:  Size(SizeConfig.getSize(210), SizeConfig.getSize(40)),
                                            maximumSize:  Size(SizeConfig.getSize(210), SizeConfig.getSize(40)),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(SizeConfig.getSize(8)),
                                            )),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding:  EdgeInsets.symmetric(
                                                horizontal: SizeConfig.getSize(4)),
                                            child: Text(
                                              MessagesProvider.get(
                                                  'Product Menu'),
                                              style:  _theme.subtitleLight3!.copyWith(color:_theme.light1, fontSize: SizeConfig.getFontSize(24)),
                                              maxLines: 2,
                                            ),
                                          ),
                                        )),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      }),
                  Expanded(
                      child: BlocConsumer<SetUpMenuDashBoardCubit,
                              SetUpMenuDashBoardState>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            if (state.selectedButtonValue == "PANELS") {
                              return const PanelsScreen();
                            }
                            return const ProductMenuSection();
                          })),

                    ],
                  )),
              BlocConsumer<PanelsCubit, PanelsState>(
                  listener: (context, state) {
                if (state.isError) {
                  _notificationBar?.showMessage(state.statusMessage.toString(),
                      _theme.footerBG3!);
                  _resetLoaderStatus();
                } else if (state.isSuccess) {
                  _notificationBar?.showMessage(state.statusMessage.toString(),
                      _theme.footerBG4! );
                  _resetLoaderStatus();
                }
              },
                  builder: (context, state) {
                if (state.isLoading) {
                  return Positioned(
                      bottom: 0,
                      left: 0,
                      child: Container(
                        width: SizeConfig.screenWidth,
                        height: SizeConfig.screenHeight,
                        decoration: BoxDecoration(
                          color: _theme.secondaryColor!.withOpacity(.4),
                        ),
                        child: Center(
                          child: Container(
                            decoration:  BoxDecoration(
                                color: _theme.backGroundColor,
                                borderRadius:
                                BorderRadius.all(Radius.circular(SizeConfig.getSize(8)))),
                            width: SizeConfig.screenWidth * .40,
                            child: Padding(
                              padding:  EdgeInsets.all(SizeConfig.getSize(25)),
                              child: Row(children: [
                                 SizedBox(width: SizeConfig.getSize(10)),
                                const CircularProgressIndicator(),
                                 SizedBox(width: SizeConfig.getSize(36)),
                                Expanded(
                                  child: Text(
                                    state.loaderMessage ?? '',
                                    maxLines: 2,
                                    style:_theme.title1!.copyWith(fontSize:SizeConfig.getFontSize(26)),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ),
                      ));
                }
                return const SizedBox();
              }),
              BlocConsumer<ProductMenuCubit, ProductMenuState>(
                  listener: (context, state) {
                    if (state.isError) {
                      _notificationBar?.showMessage(state.statusMessage.toString(),
                          _theme.footerBG3!);
                      _resetLoaderStatus();
                    } else if (state.isSuccess) {
                      _notificationBar?.showMessage(state.statusMessage.toString(),
                          _theme.footerBG4!);
                      _resetLoaderStatus();
                    }
                  },
                  builder: (context, state) {
                    if (state.isLoading) {
                      return Positioned(
                          bottom: 0,
                          left: 0,
                          child: Container(
                            width: SizeConfig.screenWidth,
                            height: SizeConfig.screenHeight,
                            decoration: BoxDecoration(
                              color: _theme.secondaryColor!.withOpacity(.4),
                            ),
                            child: Center(
                              child: Container(
                                decoration:  BoxDecoration(
                                    color:_theme.backGroundColor,
                                    borderRadius:
                                    const BorderRadius.all(Radius.circular(6))),
                                width: SizeConfig.screenWidth * .40,
                                child: Padding(
                                  padding:  EdgeInsets.all(SizeConfig.getSize(25)),
                                  child: Row(children: [
                                    SizedBox(width: SizeConfig.getSize(10)),
                                    const CircularProgressIndicator(),
                                    SizedBox(width: SizeConfig.getSize(36)),
                                    Expanded(
                                      child: Text(
                                        state.loaderMessage ?? '',
                                        maxLines: 2,
                                        style:_theme.title1!.copyWith(fontSize:SizeConfig.getFontSize(26)),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ]),
                                ),
                              ),
                            ),
                          ));
                    }
                    return const SizedBox();
                  }),
            ],
          ),
        ),
      ),
    );
  }

  _resetLoaderStatus() {
    context.read<PanelsCubit>().resetValues();
  }
}
