import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:other_function_data/model/menu_panel/menu_panels_data.dart';
import 'package:other_function_ui/bloc/cubits/panels/choose_panel/choose_product_cubit.dart';
import 'package:other_function_ui/bloc/cubits/panels/choose_panel/choose_product_state.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/scroller.dart';
import '../../../bloc/cubits/panels/edit_panels/edit_panels_cubit.dart';
import '../../../utils/constants.dart';
import '../../../widgets/colors.dart';
import 'package:widgets_library/utils/size_config.dart';
import '../../widgets/primary_dark_button.dart';
import '../../widgets/primary_light_button.dart';

class ChoosePanelDialog extends StatelessWidget {
  const ChoosePanelDialog(
      {Key? key,
      required this.menuPanelDtoList,
      required this.onConfirm,
      required this.onSelectView,
      required this.onSelectNew})
      : super(key: key);
  final List<MenuPanelsDto> menuPanelDtoList;
  final Function onConfirm;
  final Function onSelectView;
  final Function onSelectNew;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ChoosePanelCubit>(
              create: (context) => ChoosePanelCubit()),
          BlocProvider<EditPanelsCubit>.value(
            value: EditPanelsCubit(),
          )
        ],
        child: ChoosePanelDialogSection(
            menuPanelDtoList: menuPanelDtoList,
            onConfirm: onConfirm,
            onSelectView: onSelectView,
            onSelectNew: onSelectNew));
  }
}

class ChoosePanelDialogSection extends StatefulWidget {
  const ChoosePanelDialogSection(
      {Key? key,
      required this.menuPanelDtoList,
      required this.onConfirm,
      required this.onSelectView,
      required this.onSelectNew})
      : super(key: key);
  final List<MenuPanelsDto> menuPanelDtoList;
  final Function onConfirm;
  final Function onSelectView;
  final Function onSelectNew;

  @override
  State<ChoosePanelDialogSection> createState() =>
      _ChoosePanelDialogSectionState();
}

class _ChoosePanelDialogSectionState extends State<ChoosePanelDialogSection> {
  Size _screenSize = const Size(0, 0);
  double _screenWidth = 0.0;
  double _screenHeight = 0.0;
  NotificationBar? _notificationBar;

  // List<MenuPanelsDto> menuPanelDtoList = [];
  int? _selectedIndex;
  final TextEditingController _searchTextController = TextEditingController();
  final _scrollController = ScrollController();
  late SemnoxTheme _theme;

  @override
  void initState() {
    _notificationBar = NotificationBar(showHideSideBar: false);
    context
        .read<ChoosePanelCubit>()
        .setInitialValues(menuPanelsDtoList: widget.menuPanelDtoList);
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
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(top: SizeConfig.getSize(8), right: SizeConfig.getSize(8), left: SizeConfig.getSize(8)),
            child: Container(
              decoration:  BoxDecoration(
                color:_theme.backGroundColor,
                borderRadius:  BorderRadius.only(
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
                              color: _theme.secondaryColor!.withOpacity(0.5),
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
                            color: _theme.light1,
                            size: SizeConfig.getSize(25),
                          ),
                           SizedBox(
                            width: SizeConfig.getSize(8),
                          ),
                          Text(
                            MessagesProvider.get('Choose Panel').toUpperCase(),
                            style: _theme.headingLight4!.copyWith(color:_theme.light1, fontSize: SizeConfig.getFontSize(18)),
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
                              color: _theme.secondaryColor!.withOpacity(0.3),
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
              // scrollBehavior:const MaterialScrollBehavior(),
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: true,
                  child: Padding(
                    padding:
                         EdgeInsets.only(left: SizeConfig.getSize(8), right: SizeConfig.getSize(8), bottom: SizeConfig.getSize(8)),
                    child: Container(
                      decoration:  BoxDecoration(
                          color: _theme.backGroundColor!,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(SizeConfig.getSize(8)),
                              bottomLeft: Radius.circular(SizeConfig.getSize(8)))),
                      child: BlocBuilder<ChoosePanelCubit, ChoosePanelState>(
                          builder: (context, chooseProductState) {
                        return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
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
                                           SizedBox(
                                            height: SizeConfig.getSize(4),
                                          ),
                                          Text(
                                            MessagesProvider.get('Name'),
                                            style:_theme.heading5!.copyWith(fontSize:SizeConfig.getFontSize(18)),
                                          ),
                                           SizedBox(
                                            height: SizeConfig.getSize(4),
                                          ),
                                          SizedBox(
                                            height: SizeConfig.getSize(42),
                                            child: TextFormField(
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              style:_theme.subtitle1!.copyWith(fontSize: SizeConfig.getFontSize(18)),
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
                                            .read<ChoosePanelCubit>()
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
                                        context
                                            .read<ChoosePanelCubit>()
                                            .searchPanels(
                                                _searchTextController.text);
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
                              SizedBox(height: SizeConfig.getSize(8),),
                              Container(
                                height: 1,
                                color: _theme.dialogFooterInnerShadow,
                              ),
                              SizedBox(height: SizeConfig.getSize(8),),
                              chooseProductState
                                      .filteredMenuPanelsDtoList.isNotEmpty
                                  ? Expanded(
                                      child: Padding(
                                        padding:  EdgeInsets.only(
                                            left: SizeConfig.getSize(8), right: SizeConfig.getSize(8), bottom: SizeConfig.getSize(8)),
                                        child: Scroller(
                                          controller: _scrollController,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 30.0),
                                            child: GridView.builder(
                                              controller: _scrollController,
                                              gridDelegate:
                                                   SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 8,
                                                      crossAxisSpacing: 5.0,
                                                      mainAxisSpacing: 5.0,
                                                      mainAxisExtent: SizeConfig.getSize(68)),
                                              itemCount: chooseProductState
                                                  .filteredMenuPanelsDtoList
                                                  .length,
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      _selectedIndex = index;
                                                    });
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: _theme.secondaryColor!
                                                                .withOpacity(0.3),
                                                            spreadRadius:SizeConfig.getSize(0.3),
                                                            blurRadius: SizeConfig.getSize(0.3),
                                                            offset:  Offset(0,
                                                                SizeConfig.getSize(3)), // changes position of shadow
                                                          ),
                                                        ],
                                                        color: _selectedIndex ==
                                                                index
                                                            ? _theme.button2InnerShadow1
                                                            : _theme.button1BG1,
                                                        borderRadius:
                                                             BorderRadius
                                                                    .all(
                                                                Radius.circular(
                                                                    SizeConfig.getSize(8)))),
                                                    child: Center(
                                                        child: Padding(
                                                      padding:
                                                           EdgeInsets.only(
                                                              left: SizeConfig.getSize(4),
                                                              right: SizeConfig.getSize(4)),
                                                      child: Text(
                                                        chooseProductState
                                                                .filteredMenuPanelsDtoList[
                                                                    index]
                                                                .name ??
                                                            '',
                                                        style:_selectedIndex ==
                                                      index ? _theme.subtitleLight3!.copyWith(color: _theme.light1, fontSize:SizeConfig.getFontSize(18))
                                                              : _theme.subtitle3!.copyWith(fontSize:SizeConfig.getFontSize(18)),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    )),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : const Expanded(
                                child: SizedBox(
                                  child: Center(
                                    child: Text("No items found.")
                                    ,
                                  ),),
                              ),
                              Container(
                                height: 1,
                                color: _theme.dialogFooterInnerShadow,
                              ),
                              SizedBox(height: SizeConfig.getSize(8),),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 4.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    PrimaryLightButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        title: MessagesProvider.get('Cancel')
                                            .toUpperCase()),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    PrimaryDarkButton(
                                        onPressed: () {
                                          if (_selectedIndex != null ||
                                              (_selectedIndex ?? -1) >= 0) {
                                            Navigator.pop(context);
                                            widget.onConfirm(chooseProductState
                                                .filteredMenuPanelsDtoList[
                                                    (_selectedIndex ?? 0)]
                                                .guid);
                                          } else {
                                            _notificationBar?.showMessage(
                                                MessagesProvider.get(
                                                    'Please select a panel to proceed'),
                                                KColor.notificationBGRedColor);
                                          }
                                        },
                                        title: MessagesProvider.get('Confirm')
                                            .toUpperCase()),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    PrimaryLightButton(
                                      onPressed: () {
                                        if (_selectedIndex != null ||
                                            (_selectedIndex ?? -1) >= 0) {
                                          print("guiID${chooseProductState
                                              .filteredMenuPanelsDtoList[
                                          (_selectedIndex ?? 0)]
                                              .guid}");
                                          widget.onSelectView(chooseProductState
                                              .filteredMenuPanelsDtoList[
                                                  (_selectedIndex ?? 0)]
                                              .guid);
                                          // print("viewInside");
                                          // Navigator.pop(context);
                                        } else {
                                          _notificationBar?.showMessage(
                                              MessagesProvider.get(
                                                  'Please select a panel to proceed'),
                                              KColor.notificationBGRedColor);
                                        }
                                      },
                                      title: MessagesProvider.get('View')
                                          .toUpperCase(),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    PrimaryLightButton(
                                      onPressed: () {
                                        widget.onSelectNew(const MenuPanelsDto(
                                          cellMarginTop:2,
                                          rowCount:5,
                                          panelId:-1,
                                          columnCount:5,
                                          displayOrder:0,
                                          cellMarginBottom:2,
                                          name:'',
                                          imageURL:'',
                                          cellMarginLeft:2,
                                          cellMarginRight:2,
                                          isActive:true,
                                          createdBy:'',
                                          creationDate:'',
                                          lastUpdatedBy:'',
                                          siteId:-1,
                                          masterEntityId:-1,
                                          synchStatus:false,
                                          guid:'',
                                          productMenuPanelContentDTOList:[],
                                          isChanged:true,
                                          isChangedRecursive:false,
                                        )
                                        );
                                      },
                                      title: MessagesProvider.get('New')
                                          .toUpperCase(),
                                    ),
                                  ],
                                ),
                              )
                            ]);
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
