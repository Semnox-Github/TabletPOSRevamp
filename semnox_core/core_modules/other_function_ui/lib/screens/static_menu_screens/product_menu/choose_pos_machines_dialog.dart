import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:other_function_data/model/pos_machines/pos_machine_data.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/scroller.dart';
import '../../../bloc/cubits/product_menu/choose_pos_machine/choose_pos_machine_cubit.dart';
import '../../../bloc/cubits/product_menu/choose_pos_machine/choose_pos_machine_state.dart';
import '../../../utils/constants.dart';
import '../../widgets/primary_dark_button.dart';
import '../../widgets/primary_light_button.dart';
import 'package:widgets_library/utils/size_config.dart';


class ChoosePosMachineDialog extends StatelessWidget {
  const ChoosePosMachineDialog({Key? key, this.onSuccess, required this.posMachineList, required this.menuId}) : super(key: key);
  final Function? onSuccess;
  final List<PosMachineDate> posMachineList;
  final int menuId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<ChoosePosMachineCubit>(
          create: (context) => ChoosePosMachineCubit())
    ], child: ChoosePosMachineSection(onSuccess:onSuccess, posMachineList: posMachineList, menuId: menuId));
  }
}

class ChoosePosMachineSection extends StatefulWidget {
  const ChoosePosMachineSection({Key? key, this.onSuccess, required this.posMachineList, required this.menuId}) : super(key: key);
  final Function? onSuccess;
  final List<PosMachineDate> posMachineList;
  final int menuId;

  @override
  State<ChoosePosMachineSection> createState() =>
      _ChoosePosMachineSectionState();
}

class _ChoosePosMachineSectionState extends State<ChoosePosMachineSection> {
  Size _screenSize = const Size(0, 0);
  double _screenWidth = 0.0;
  double _screenHeight = 0.0;
  NotificationBar? _notificationBar;
  TextEditingController _searchTextController = TextEditingController();
  final _scrollController = ScrollController();
  late SemnoxTheme _theme;
  @override
  void initState() {
    _notificationBar = NotificationBar(showHideSideBar: false);
    context
        .read<ChoosePosMachineCubit>()
        .setInitialValues(posMachineList: widget.posMachineList, menuId:widget.menuId);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;
    _screenWidth = _screenSize.width;
    _screenHeight = _screenSize.height;
    _theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Stack(
      children: [
        Scaffold(
          bottomNavigationBar: SizedBox(
            width: _screenWidth,
            child: Container(
              child: _notificationBar,
            ),
          ),
          backgroundColor:_theme.transparentColor,
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              Padding(
                padding:  EdgeInsets.only(top: SizeConfig.getSize(8), right: SizeConfig.getSize(8), left: SizeConfig.getSize(8)),
                child: Container(
                  decoration:  BoxDecoration(
                    color: _theme.backGroundColor!,
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
                                  color: Colors.grey.withOpacity(0.4),
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
                                color:_theme.light1,
                                size: SizeConfig.getSize(25),
                              ),
                               SizedBox(
                                width: SizeConfig.getSize(8),
                              ),
                              Text(
                                MessagesProvider.get(
                                    'Choose POS Machine')
                                    .toUpperCase(),
                                style: _theme.headingLight4!.copyWith(color: _theme.light1, fontSize:SizeConfig.getFontSize(26)),
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
                              color:_theme.button1BG1!,
                              borderRadius:  BorderRadius.only(
                                  bottomLeft: Radius.circular(SizeConfig.getSize(6)),
                                  topRight: Radius.circular(SizeConfig.getSize(6)))),
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
                  // scrollBehavior:const MaterialScrollBehavior(),
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: true,
                      child: Padding(
                        padding:
                         EdgeInsets.only(left: SizeConfig.getSize(8), right: SizeConfig.getSize(8), bottom: 0),
                        child: Container(
                          decoration:  BoxDecoration(
                              color: _theme.backGroundColor,
                              borderRadius: const BorderRadius.only(
                                  )),
                          child: BlocBuilder<ChoosePosMachineCubit, ChoosePosMachineState>(
                              builder: (context, choosePosState) {
                                return Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                       SizedBox(
                                        height: SizeConfig.getSize(8),
                                      ),
                                      IntrinsicHeight(
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                             SizedBox(
                                              width: SizeConfig.getSize(8),
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    MessagesProvider.get('Search'),
                                                    style:_theme.heading5!.copyWith(fontSize:SizeConfig.getSize(18)),
                                                  ),
                                                   SizedBox(
                                                    height: SizeConfig.getSize(4),
                                                  ),
                                                  SizedBox(
                                                    height: SizeConfig.getSize(42),
                                                    child: TextFormField(
                                                      style: _theme.subtitle1!,
                                                      autofocus: false,
                                                      controller: _searchTextController,
                                                      decoration: AppDecorations
                                                          .textFieldInputDecoration
                                                          .copyWith(
                                                        hintText: MessagesProvider.get('Enter Text'), filled: true,
                                                        fillColor: _theme.primaryColor,
                                                        contentPadding: EdgeInsets.only(
                                                          top: 0,
                                                          bottom: 0,
                                                          right: SizeConfig.getSize(10),
                                                          left: SizeConfig.getSize(10),
                                                        ),
                                                        border: OutlineInputBorder(
                                                            borderRadius: BorderRadius.all(
                                                                Radius.circular(SizeConfig.getSize(8))),
                                                            borderSide: BorderSide(
                                                                color: _theme.secondaryColor!)),
                                                        focusedBorder: OutlineInputBorder(
                                                            borderRadius: BorderRadius.all(
                                                                Radius.circular(SizeConfig.getSize(8))),
                                                            borderSide: BorderSide(
                                                                color: _theme.secondaryColor!)),
                                                        enabledBorder: OutlineInputBorder(
                                                            borderRadius: BorderRadius.all(
                                                                Radius.circular(SizeConfig.getSize(8))),
                                                            borderSide: BorderSide(
                                                                color: _theme.secondaryColor!)),
                                                        hintStyle: _theme.textFieldHintStyle!.copyWith(
                                                            fontSize: SizeConfig.getFontSize(18)),),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                             SizedBox(
                                              width: SizeConfig.getSize(8),
                                            ),
                                            PrimaryLightButton(
                                              onPressed: () {
                                                if (FocusScope.of(context).hasFocus) {
                                                  FocusScope.of(context).unfocus();
                                                }
                                                context
                                                    .read<ChoosePosMachineCubit>()
                                                    .onSearchClear();
                                              },
                                              title: MessagesProvider.get('Clear')
                                                  .toUpperCase(),
                                            ),
                                             SizedBox(
                                              width: SizeConfig.getSize(8),
                                            ),
                                            PrimaryDarkButton(
                                              onPressed: () {
                                                if (FocusScope.of(context).hasFocus) {
                                                  FocusScope.of(context).unfocus();
                                                }
                                                context.read<ChoosePosMachineCubit>().searchPos(_searchTextController.text);
                                              },
                                              title: MessagesProvider.get('Search')
                                                  .toUpperCase(),
                                            ),
                                             SizedBox(
                                              width: SizeConfig.getSize(4),
                                            ),
                                          ],
                                        ),
                                      ),
                                       Divider(
                                        color: _theme.dialogFooterInnerShadow,
                                      ),
                                      Padding(
                                        padding:  EdgeInsets.fromLTRB(SizeConfig.getSize(12), SizeConfig.getSize(8), SizeConfig.getSize(8), SizeConfig.getSize(10)),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                flex:1,
                                                child: Text(
                                                  MessagesProvider.get('Id'),
                                                  style:_theme.heading5!.copyWith(fontSize:SizeConfig.getSize(18)),
                                                )),
                                            Expanded(
                                              flex:2,
                                              child: Text(
                                                MessagesProvider.get('POS Name'),
                                                style:_theme.heading5!.copyWith(fontSize:SizeConfig.getSize(18)),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Align(
                                                alignment:Alignment.topLeft,
                                                child: Text(
                                                  '${MessagesProvider.get('Computer Name')}',
                                                  style:_theme.heading5!.copyWith(fontSize:SizeConfig.getSize(18)),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Container(),
                                            ),


                                          ],
                                        ),
                                      ),
                                      choosePosState
                                          .filteredPosMachineList.isNotEmpty
                                          ? Expanded(
                                        child: Padding(
                                          padding:  EdgeInsets.only(
                                              left: SizeConfig.getSize(8), right: SizeConfig.getSize(8), bottom: SizeConfig.getSize(8)),
                                          child: Scroller(
                                            controller: _scrollController,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 30.0),
                                              child: ListView.builder(
                                                controller: _scrollController,
                                                itemCount: choosePosState
                                                    .filteredPosMachineList
                                                    .length,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding:  EdgeInsets.all(SizeConfig.getSize(4)),
                                                    child: InkWell(
                                                      onTap: () {
                                                        context
                                                            .read<ChoosePosMachineCubit>()
                                                            .onSelectIndex(index);
                                                      },
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            color:_theme.button1BG1,
                                                            borderRadius:
                                                             BorderRadius
                                                                .all(
                                                                Radius.circular(
                                                                    SizeConfig.getSize(8))),
                                                            border: Border.all(
                                                                color:choosePosState.selectedPosMachine == null?Colors
                                                                    .transparent: choosePosState.selectedPosMachine  ==
                                                                    index
                                                                    ?_theme.secondaryColor!
                                                                    : _theme.transparentColor!,)
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                           EdgeInsets.all(
                                                              SizeConfig.getSize(6)),
                                                          child: Center(
                                                            child: Row(
                                                              children: [
                                                                Expanded(
                                                                    flex: 1,
                                                                    child: Text(
                                                                      '${choosePosState.filteredPosMachineList[index]
                                                                          .pOSMachineId}',
                                                                      style:_theme.heading5!.copyWith(fontSize:SizeConfig.getSize(18)),
                                                                    )),
                                                                Expanded(
                                                                  flex: 2,
                                                                  child: Text(
                                                                    '${choosePosState.filteredPosMachineList[index]
                                                                        .pOSName}',
                                                                    maxLines: 2,
                                                                    overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                    style: _theme.heading5!.copyWith(fontSize:SizeConfig.getSize(18)),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 2,
                                                                  child: Text(
                                                                    '${choosePosState.filteredPosMachineList[index]
                                                                        .computerName}',
                                                                    maxLines: 2,
                                                                    overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                    style:_theme.heading5!.copyWith(fontSize:SizeConfig.getSize(18)),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                    flex: 3,
                                                                    child: Container())
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                          : Expanded(
                                          child:  Container(
                                            height: 500,
                                          )),

                                    ]);
                              }),
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
                      color:  _theme.backGroundColor,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(SizeConfig.getSize(8)),
                          bottomLeft: Radius.circular(SizeConfig.getSize(8)))),
                  child: Padding(
                    padding:  EdgeInsets.only(bottom: SizeConfig.getSize(4), top: SizeConfig.getSize(4)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PrimaryLightButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            title: MessagesProvider.get('Cancel').toUpperCase()),
                         SizedBox(
                          width: SizeConfig.getSize(8),
                        ),
                        BlocConsumer<ChoosePosMachineCubit, ChoosePosMachineState>(
                            listener: (context, state) {},
                            builder: (context, menuState) {
                              return PrimaryDarkButton(
                                  onPressed: () {
                                    if (FocusScope.of(context).hasFocus) {
                                      FocusScope.of(context).unfocus();
                                    }
                                    context.read<ChoosePosMachineCubit>().addPosMachine().then((isSuccess){
                                      if(isSuccess){
                                        widget.onSuccess!();
                                        Navigator.pop(context);
                                      }
                                    });

                                  },
                                  title: MessagesProvider.get('OK').toUpperCase());
                            })
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        BlocConsumer<ChoosePosMachineCubit, ChoosePosMachineState>(
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
                      width: _screenWidth,
                      height: _screenHeight,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.4),
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
    );
  }

  void _resetLoaderStatus(){
    context.read<ChoosePosMachineCubit>().resetLoaderStatus();
  }
}
