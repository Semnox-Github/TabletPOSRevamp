import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:other_function_data/model/menu/menu_data.dart';
import 'package:other_function_data/model/menu/product_menu_panel_mapping_dto.dart';
import 'package:other_function_data/model/menu_panel/menu_panels_data.dart';
import 'package:other_function_data/model/pos_machines/pos_machine_data.dart';
import 'package:other_function_data/model/pos_machines/product_menu_pos_machine_map_dto.dart';
import 'package:other_function_ui/bloc/cubits/panels/panels_cubit.dart';
import 'package:other_function_ui/bloc/cubits/product_menu/product_menu/product_menu_state.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/scroller.dart';
import '../../../bloc/cubits/panels/edit_panels/edit_panels_cubit.dart';
import '../../../bloc/cubits/product_menu/product_menu/product_menu_cubit.dart';
import '../../../widgets/colors.dart';
import '../../widgets/primary_dark_button.dart';
import '../panels/choose_panels_dialog.dart';
import '../panels/edit_panel_screen.dart';
import 'choose_pos_machines_dialog.dart';
import 'edit_menu_screen.dart';
import 'package:widgets_library/utils/size_config.dart';

class ProductMenuSection extends StatefulWidget {
  const ProductMenuSection({Key? key}) : super(key: key);

  @override
  State<ProductMenuSection> createState() => _ProductMenuSectionState();
}

class _ProductMenuSectionState extends State<ProductMenuSection> {
  late ProductMenuPanelMappingDto _panelDto;
  List<PosMachineDate> _posMachineList = [];
  List<PosMachineDate> _exeptedPosMachineList = [];
  List<MenuPanelsDto> _menuPanelsDtoList = [];
  final _menuScrollController = ScrollController();
  final _menuPanelsScrollController = ScrollController();
  final _posScrollController = ScrollController();
  Size _screenSize = const Size(0, 0);
  double _screenWidth = 0.0;
  double _screenHeight = 0.0;
  late SemnoxTheme _theme;

  @override
  void initState() {
    context.read<ProductMenuCubit>().getInitialAPIs();
    _menuPanelsDtoList = context.read<PanelsCubit>().state.menuPanelsDtoList;
    super.initState();
  }

  String _getMenuTypeString(String type) {
    switch (type) {
      case "O":
        return "Order Sale";
      case "B":
        return "Reservation";
      case "R":
        return "Redemption";
      default:
        return "Order Sale";
    }
  }

  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;
    _screenWidth = _screenSize.width;
    _screenHeight = _screenSize.height;
    _theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.only(left: SizeConfig.getSize(8), right: SizeConfig.getSize(8)),
          child: Container(
            height: SizeConfig.getHeight(64),
            width: SizeConfig.screenWidth,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0.2,
                    blurRadius: .2,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ],
                color: _theme.button1BG1,
                borderRadius:  BorderRadius.only(
                    bottomLeft: Radius.circular(SizeConfig.getSize(8)),
                    bottomRight: Radius.circular(SizeConfig.getSize(8)))),
          ),
        ),
         SizedBox(
          height: SizeConfig.getSize(12),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 4,
                      ),
                      BlocConsumer<ProductMenuCubit, ProductMenuState>(
                          listener: (context, state) {},
                          builder: (context, menuState) {
                            return Row(
                              children: [
                                Padding(
                                  padding:  EdgeInsets.only(
                                      left: SizeConfig.getSize(8), right: SizeConfig.getSize(8)),
                                  child: SizedBox(
                                    height: SizeConfig.getSize(57),
                                    child: IntrinsicHeight(
                                      child: Row(
                                        children: [
                                          ElevatedButton(
                                              onPressed: () {
                                                context
                                                    .read<ProductMenuCubit>()
                                                    .onSelectPanelButton();
                                              },
                                              style: ElevatedButton.styleFrom(
                                                maximumSize:  Size(
                                                  _screenWidth*.16,
                                                    SizeConfig.getSize(57),
                                                ),
                                                minimumSize:  Size(
                                                  _screenWidth*.16,
                                                    SizeConfig.getSize(57),
                                                ),
                                                backgroundColor: menuState
                                                        .isSelectedPosMachineButton
                                                    ?
                                                    _theme.button1BG1:_theme.button2InnerShadow1,
                                                disabledBackgroundColor:
                                                    KColor.primaryBtnColor,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    MessagesProvider.get(
                                                            'Panels')
                                                        .toUpperCase(),
                                                    style: menuState.isSelectedPosMachineButton
                                                        ? _theme.subtitle3!.copyWith(fontSize:SizeConfig.getFontSize(18))
                                :_theme.subtitleLight3!.copyWith(color: _theme.light1, fontSize:SizeConfig.getFontSize(18))
                                                  ),

                                                  Text(
                                                    '${menuState?.menuPanelsCount ?? 0}',
                                                    style: menuState
                                                            .isSelectedPosMachineButton
                                                        ? _theme.heading2!.copyWith(fontSize:SizeConfig.getFontSize(26))
                                                        :_theme.subtitleLight3!.copyWith(color: _theme.light1, fontSize: SizeConfig.getFontSize(26))
                                                  ),
                                                ],
                                              )),
                                           SizedBox(
                                            width: SizeConfig.getSize(8),
                                          ),
                                          ElevatedButton(
                                              onPressed: () {
                                                context
                                                    .read<ProductMenuCubit>()
                                                    .onSelectPosMachineButton();
                                              },
                                              style: ElevatedButton.styleFrom(
                                                padding: EdgeInsets.zero,
                                                maximumSize:  Size(
                                                  _screenWidth*.16,
                                                  SizeConfig.getSize(58),
                                                ),
                                                minimumSize:  Size(
                                                  _screenWidth*.16,
                                                  SizeConfig.getSize(58),
                                                ),
                                                backgroundColor: menuState
                                                        .isSelectedPosMachineButton
                                                    ? _theme.button2InnerShadow1:_theme.button1BG1,
                                                disabledBackgroundColor:
                                                    KColor.primaryBtnColor,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    MessagesProvider.get(
                                                            'Pos Machines')
                                                        .toUpperCase(),
                                                    style: menuState.isSelectedPosMachineButton
                                                        ? _theme.subtitleLight3!.copyWith(color: _theme.light1, fontSize:  SizeConfig.getSize(18) )
                                                        :_theme.subtitle3!.copyWith( fontSize:  SizeConfig.getSize(18) )
                                                  ),
                                                  Text(
                                                    '${menuState?.posMachineCount ?? 0}',
                                                    style: menuState
                                                            .isSelectedPosMachineButton
                                                        ? _theme.subtitleLight3!.copyWith(color: _theme.light1, fontSize:  SizeConfig.getSize(26))
                                                        :_theme.subtitle3!.copyWith(fontSize:  SizeConfig.getSize(26)) ,
                                                  ),
                                                ],
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                 SizedBox(
                                  width:  SizeConfig.getSize(16),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      MessagesProvider.get("Show All"),
                                      style: _theme.heading5!.copyWith(fontSize:SizeConfig.getFontSize(18)),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        context
                                            .read<ProductMenuCubit>()
                                            .onSelectedShowAll();
                                      },
                                      child: Container(
                                        width: SizeConfig.getSize(34),
                                        height: SizeConfig.getSize(34),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                 BorderRadius.all(
                                                    Radius.circular(SizeConfig.getSize(8))),
                                            border: Border.all(
                                                color: _theme.secondaryColor!)),
                                        child: Center(
                                            child: !menuState.isShowAll
                                                ? const SizedBox()
                                                : Icon(
                                                    Icons.check,
                                                    size: SizeConfig.getSize(25),
                                                    color: _theme.secondaryColor!,
                                                  )),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          }),
                      Padding(
                        padding:  EdgeInsets.fromLTRB(SizeConfig.getSize(12), SizeConfig.getSize(24), 30, SizeConfig.getSize(10)),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Text(
                                  MessagesProvider.get('Menu ID'),
                                  style: _theme.heading5!.copyWith(fontSize:SizeConfig.getFontSize(18)),
                                )),
                            Expanded(
                              flex: 1,
                              child: Text(
                                MessagesProvider.get('Name'),
                                style: _theme.heading5!.copyWith(fontSize:SizeConfig.getFontSize(18)),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                '${MessagesProvider.get('Description')}',
                                style: _theme.heading5!.copyWith(fontSize:SizeConfig.getFontSize(18)),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                '${MessagesProvider.get('Type')}',
                                style: _theme.heading5!.copyWith(fontSize:SizeConfig.getFontSize(18)),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                '${MessagesProvider.get('Active')}?',
                                style: _theme.heading5!.copyWith(fontSize:SizeConfig.getFontSize(18)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: _menuList(),
                      )
                    ],
                  )),
              BlocConsumer<ProductMenuCubit, ProductMenuState>(
                  listener: (context, state) {},
                  builder: (context, menuState) {
                    return Expanded(
                      flex: 3,
                      child: menuState.isSelectedPosMachineButton
                          ? _posMachineSectionView()
                          : _panelsSectionView(),
                    );
                  }),
            ],
          ),
        )
      ],
    );
  }

  //panels section view
  Widget _panelsSectionView() {
    return IntrinsicHeight(
      child: BlocConsumer<ProductMenuCubit, ProductMenuState>(
          listener: (context, state) {},
          builder: (context, productMenuState) {
            // print("lenGTH ${(productMenuState.menuDataList?[productMenuState.selectedMenuIndex??0].productMenuPanelMappingDtoList??[]).length}");
            return Padding(
              padding:  EdgeInsets.fromLTRB(SizeConfig.getSize(8), 0, SizeConfig.getSize(8), SizeConfig.getSize(8)),
              child: Column(
                children: [
                  Container(
                    height:SizeConfig.getHeight(52),
                    color: _theme.button1BG1!,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Opacity(
                            opacity:(productMenuState.selectedMenuIndex ?? 0) == 0
                          ? 0.4:1,
                            child: IconButton(
                                onPressed:
                                    (productMenuState.selectedMenuIndex ?? 0) == 0
                                        ? null
                                        : () {
                                            context
                                                .read<ProductMenuCubit>()
                                                .clickPrevMenu();
                                            _scrollToIndex(
                                                listLength: (productMenuState
                                                            .filteredMenuDataList ??
                                                        [])
                                                    .length,
                                                selectedIndex: productMenuState
                                                        .selectedMenuIndex ??
                                                    0);
                                          },
                                icon: Icon(Icons.arrow_back_ios_new_rounded,  color: _theme.secondaryColor!, size: SizeConfig.getSize(30))),
                          ),
                          Expanded(child: Container()),
                          Opacity(
                            opacity:(productMenuState.selectedMenuIndex ??
                                0) ==
                                (productMenuState.filteredMenuDataList ??
                                    [])
                                    .length -
                                    1
                                ? 0.4:1,
                            child: IconButton(
                                hoverColor: Colors.red,
                                onPressed: (productMenuState.selectedMenuIndex ??
                                            0) ==
                                        (productMenuState.filteredMenuDataList ??
                                                    [])
                                                .length -
                                            1
                                    ? null
                                    : () {
                                        context
                                            .read<ProductMenuCubit>()
                                            .clickNextMenu();
                                        _scrollToIndex(
                                            listLength: (productMenuState
                                                        .filteredMenuDataList ??
                                                    [])
                                                .length,
                                            selectedIndex: productMenuState
                                                    .selectedMenuIndex ??
                                                0);
                                      },
                                icon: Icon(Icons.arrow_forward_ios_rounded, color: _theme.secondaryColor!, size: SizeConfig.getSize(30),)),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color:_theme.button1BG1!,
                      width: SizeConfig.screenWidth,
                      height: SizeConfig.screenHeight,
                      child: Scroller(
                        controller: _menuPanelsScrollController,
                        child: ListView.builder(
                            controller: _menuPanelsScrollController,
                            itemCount: productMenuState.selectedMenuIndex ==
                                    null
                                ? 0
                                : ((productMenuState.filteredMenuDataList ?? [])
                                                .length -
                                            1 >=
                                        (productMenuState.selectedMenuIndex ??
                                            0))
                                    ? (productMenuState
                                                .filteredMenuDataList?[
                                                    productMenuState
                                                            .selectedMenuIndex ??
                                                        0]
                                                .productMenuPanelMappingDtoList ??
                                            [])
                                        .length
                                    : 0,
                            itemBuilder: (context, index) {
                              _panelDto = (productMenuState
                                      .filteredMenuDataList?[
                                          productMenuState.selectedMenuIndex ??
                                              0]
                                      .productMenuPanelMappingDtoList ??
                                  [])[index];
                              return Padding(
                                padding:
                                     EdgeInsets.fromLTRB(SizeConfig.getSize(4), SizeConfig.getSize(4), 30, SizeConfig.getSize(4)),
                                child: InkWell(
                                  onTap: () {
                                    context
                                        .read<ProductMenuCubit>()
                                        .onSelectedMenuPanelUpdateIndex(index);
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: SizeConfig.getSize(32),
                                    decoration: BoxDecoration(
                                        color: _theme.backGroundColor!,
                                        border: Border.all(
                                            width: 1,
                                            color: productMenuState
                                                            .selectedMenuIndex !=
                                                        null &&
                                                    productMenuState
                                                            .selectedMenuPanelIndex ==
                                                        index
                                                ? _theme.secondaryColor!
                                                : _theme.transparentColor!),
                                        borderRadius: BorderRadius.circular(SizeConfig.getSize(8))),
                                    child: Padding(
                                      padding:  EdgeInsets.only(
                                          left: SizeConfig.getSize(12), right: SizeConfig.getSize(12)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              '${_getPanelName(_panelDto.panelId ?? -1)}',
                                              style:_theme.subtitle3!.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              context
                                                  .read<ProductMenuCubit>()
                                                  .deleteMenuPanel(
                                                      panelId:
                                                          _panelDto.panelId ??
                                                              -1);
                                            },
                                            child: SizedBox(
                                              height: SizeConfig.getSize(15),
                                              width: SizeConfig.getSize(15),
                                              child: Image.asset(
                                                  'assets/ic_delete.png',color:_theme.secondaryColor),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                  ),
                   SizedBox(
                    height: SizeConfig.getSize(8),
                  ),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: PrimaryDarkButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext newContext) {
                                      return WillPopScope(
                                        onWillPop: () async => false,
                                        child: EditProductMenuDialog(
                                            isNew: true,
                                            onSuccess: _onSuccess,
                                            dateFormat: productMenuState
                                                .defaultDateFormat),
                                      );
                                    });
                              },
                              title: MessagesProvider.get('New').toUpperCase()),
                        ),
                         SizedBox(
                          width: SizeConfig.getSize(4),
                        ),
                        Expanded(
                          child: PrimaryDarkButton(
                              onPressed: productMenuState.selectedMenuIndex ==
                                      null
                                  ? null
                                  : () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext newContext) {
                                            return WillPopScope(
                                              onWillPop: () async => false,
                                              child: EditProductMenuDialog(
                                                isNew: false,
                                                dateFormat: productMenuState
                                                    .defaultDateFormat,
                                                onSuccess: _onSuccess,
                                                menuDto: productMenuState
                                                        .filteredMenuDataList?[
                                                    (productMenuState
                                                            .selectedMenuIndex ??
                                                        0)],
                                              ),
                                            );
                                          });
                                    },
                              title:
                                  MessagesProvider.get('Edit').toUpperCase()),
                        ),
                      ],
                    ),
                  ),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: PrimaryDarkButton(
                              onPressed:
                                  productMenuState.selectedMenuIndex == null
                                      ? null
                                      : () {
                                          context
                                              .read<ProductMenuCubit>()
                                              .deleteMenu();
                                        },
                              title:
                                  MessagesProvider.get('Delete').toUpperCase()),
                        ),
                         SizedBox(
                          width: SizeConfig.getSize(4),
                        ),
                        Expanded(
                          child: PrimaryDarkButton(
                              onPressed: productMenuState.selectedMenuIndex ==
                                      null
                                  ? null
                                  : () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext newContext) {
                                            return WillPopScope(
                                              onWillPop: () async => false,
                                              child: ChoosePanelDialog(
                                                menuPanelDtoList: context
                                                        .read<EditPanelsCubit>()
                                                        .state
                                                        .menuPanelsDtoList ??
                                                    [],
                                                onSelectView: (String guidId) {
                                                  context
                                                      .read<EditPanelsCubit>()
                                                      .onViewEditPanel(guidId);
                                                  _menuPanelsDtoList = context
                                                      .read<PanelsCubit>()
                                                      .state
                                                      .filteredMenuPanelsDtoList
                                                      .where((element) =>
                                                          element.guid
                                                              .toString() ==
                                                          guidId.toString())
                                                      .toList();
                                                  if (_menuPanelsDtoList
                                                      .isNotEmpty) {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (newContext) =>
                                                                BlocProvider<
                                                                    EditPanelsCubit>.value(
                                                                  value: context.read<
                                                                      EditPanelsCubit>(),
                                                                  child:
                                                                      EditPanelScreen(
                                                                    isNew: false,
                                                                    menuPanelsDto:
                                                                        _menuPanelsDtoList[
                                                                            0],
                                                                    refreshData:
                                                                        _refreshData,
                                                                  ),
                                                                )));
                                                  }
                                                },
                                                onSelectNew:
                                                    (MenuPanelsDto menuPanelDto) {
                                                  context
                                                      .read<EditPanelsCubit>()
                                                      .onClickNewPanel(
                                                          menuPanelDto);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (newContext) =>
                                                              BlocProvider<
                                                                  EditPanelsCubit>.value(
                                                                value: context.read<
                                                                    EditPanelsCubit>(),
                                                                child:
                                                                    EditPanelScreen(
                                                                  refreshData:
                                                                      _refreshData,
                                                                  isNew: false,
                                                                ),
                                                              )));
                                                },
                                                onConfirm: (String? guidId) {
                                                  _menuPanelsDtoList = context
                                                      .read<PanelsCubit>()
                                                      .state
                                                      .filteredMenuPanelsDtoList
                                                      .where((element) =>
                                                          element.guid
                                                              .toString() ==
                                                          guidId.toString())
                                                      .toList();
                                                  if (_menuPanelsDtoList
                                                      .isNotEmpty) {
                                                    context
                                                        .read<ProductMenuCubit>()
                                                        .addMenuPanel(
                                                            panelId:
                                                                _menuPanelsDtoList[
                                                                            0]
                                                                        .panelId ??
                                                                    -1);
                                                  }
                                                  // _notificationBar?.showMessage("${StringsProvider.get('please_click_save_to_add')} '${_getPanelName(value??'', panelsState)}'", KColor.notificationBGLightBlueColor);
                                                },
                                              ),
                                            );
                                          });
                                    },
                              title: MessagesProvider.get('Add Panel')
                                  .toUpperCase()),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }

  void _refreshData() {}

  void _onSuccess() {
    context.read<ProductMenuCubit>().getInitialAPIs();
  }

  //pos section view
  Widget _posMachineSectionView() {
    return IntrinsicHeight(
      child: BlocConsumer<ProductMenuCubit, ProductMenuState>(
          listener: (context, state) {},
          builder: (context, productMenuState) {
            _posMachineList = [];
            if (productMenuState.selectedMenuIndex != null) {
              for (PosMachineDate element
                  in (productMenuState.posMachineList ?? [])) {
                for (ProductMenuPosMachineMapDto element2
                    in (element.productMenuPosMachineMapDto ?? [])) {
                  if ((productMenuState.filteredMenuDataList ?? []).length -
                          1 >=
                      (productMenuState.selectedMenuIndex ?? 0)) {
                    if (productMenuState
                                .filteredMenuDataList?[
                                    (productMenuState.selectedMenuIndex ?? 0)]
                                .menuId ==
                            element2.menuId &&
                        (element2.isActive ?? false)) {
                      _posMachineList.add(element);
                      break;
                    }
                  }
                }
              }
            }
            return Padding(
              padding:  EdgeInsets.fromLTRB(SizeConfig.getSize(8), 0, SizeConfig.getSize(8), SizeConfig.getSize(8)),
              child: Column(
                children: [
                  Container(
                    height: SizeConfig.getHeight(52),
                    color: _theme.button1BG1!,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                              onPressed:
                                  (productMenuState.selectedMenuIndex ?? 0) == 0
                                      ? null
                                      : () {
                                          context
                                              .read<ProductMenuCubit>()
                                              .clickPrevMenu();
                                          _scrollToIndex(
                                              listLength: (productMenuState
                                                          .filteredMenuDataList ??
                                                      [])
                                                  .length,
                                              selectedIndex: productMenuState
                                                      .selectedMenuIndex ??
                                                  0);
                                        },
                              icon: Icon(Icons.arrow_back_ios_new_rounded,  color: _theme.secondaryColor!, size: SizeConfig.getSize(30))),
                          Expanded(child: Container()),
                          IconButton(
                              hoverColor: Colors.red,
                              onPressed: (productMenuState.selectedMenuIndex ??
                                          0) ==
                                      (productMenuState.filteredMenuDataList ??
                                                  [])
                                              .length -
                                          1
                                  ? null
                                  : () {
                                      context
                                          .read<ProductMenuCubit>()
                                          .clickNextMenu();
                                      _scrollToIndex(
                                          listLength: (productMenuState
                                                      .filteredMenuDataList ??
                                                  [])
                                              .length,
                                          selectedIndex: productMenuState
                                                  .selectedMenuIndex ??
                                              0);
                                    },
                              icon: Icon(Icons.arrow_forward_ios_rounded, color: _theme.secondaryColor!, size: SizeConfig.getSize(30) ))
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: _theme.button1BG1!,
                      width: SizeConfig.screenWidth,
                      height: SizeConfig.screenHeight,
                      child: Scroller(
                        controller: _posScrollController,
                        child: ListView.builder(
                            controller: _posScrollController,
                            itemCount:
                                productMenuState.selectedMenuIndex == null
                                    ? 0
                                    : _posMachineList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                     EdgeInsets.fromLTRB(SizeConfig.getSize(4), SizeConfig.getSize(4), 30, SizeConfig.getSize(4)),
                                child: InkWell(
                                  onTap: () {
                                    context
                                        .read<ProductMenuCubit>()
                                        .onSelectedPosMachineUpdateIndex(index);
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: SizeConfig.getSize(32),
                                    decoration: BoxDecoration(
                                        color: _theme.backGroundColor!,
                                        border: Border.all(
                                            width: 1,
                                            color: productMenuState
                                                            .selectedPosMachineIndex !=
                                                        null &&
                                                    productMenuState
                                                            .selectedPosMachineIndex ==
                                                        index
                                                ? _theme.secondaryColor!
                                                : KColor.transparentColor),
                                        borderRadius: BorderRadius.circular(SizeConfig.getSize(4))),
                                    child: Padding(
                                      padding:  EdgeInsets.only(
                                          left: SizeConfig.getSize(12), right: SizeConfig.getSize(12)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              '${_posMachineList[index].pOSName}',
                                              style:_theme.subtitle3!.copyWith(fontSize:SizeConfig.getFontSize(18)),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              context
                                                  .read<ProductMenuCubit>()
                                                  .deletePosMachine(
                                                      posMachineData:
                                                          _posMachineList[
                                                              index]);
                                            },
                                            child: SizedBox(
                                              height: SizeConfig.getSize(15),
                                              width: SizeConfig.getSize(15),
                                              child: Image.asset(
                                                  'assets/ic_delete.png', color:_theme.secondaryColor),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                  ),
                   SizedBox(
                    height: SizeConfig.getSize(8),
                  ),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: PrimaryDarkButton(
                              onPressed: () {
                                _exeptedPosMachineList = [];
                                if (productMenuState.selectedMenuIndex !=
                                    null) {
                                  for (PosMachineDate element
                                      in (productMenuState.posMachineList ??
                                          [])) {
                                    for (ProductMenuPosMachineMapDto element2
                                        in (element
                                                .productMenuPosMachineMapDto ??
                                            [])) {
                                      if (productMenuState
                                              .filteredMenuDataList?[
                                                  (productMenuState
                                                          .selectedMenuIndex ??
                                                      0)]
                                              .menuId !=
                                          element2.menuId) {
                                        _exeptedPosMachineList.add(element);
                                        break;
                                      }
                                    }
                                  }
                                }
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return WillPopScope(
                                        onWillPop: () async => false,
                                        child: ChoosePosMachineDialog(
                                            posMachineList:
                                                _exeptedPosMachineList,
                                            onSuccess: _onSuccess,
                                            menuId: productMenuState
                                                    .filteredMenuDataList?[
                                                        productMenuState
                                                                .selectedMenuIndex ??
                                                            0]
                                                    .menuId ??
                                                -1),
                                      );
                                    });
                              },
                              title: MessagesProvider.get('Add Pos Machine')
                                  .toUpperCase()),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  Widget _menuList() {
    return BlocSelector<ProductMenuCubit, ProductMenuState, List<MenuDto>>(
        selector: (state) => state.filteredMenuDataList ?? [],
        builder: (context, menuListState) {
          return Scroller(
            controller: _menuScrollController,
            child: ListView.builder(
                controller: _menuScrollController,
                itemCount: menuListState.length,
                // shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:  EdgeInsets.fromLTRB(SizeConfig.getSize(12), SizeConfig.getSize(4), 30, SizeConfig.getSize(4)),
                    child: BlocSelector<ProductMenuCubit, ProductMenuState,
                            int?>(
                        selector: (state) => state.selectedMenuIndex,
                        builder: (context, selectedIndex) {
                          return InkWell(
                            onTap: () {
                              context
                                  .read<ProductMenuCubit>()
                                  .onSelectedMenu(index);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: _theme.button1BG1!,
                                  borderRadius:  BorderRadius.all(
                                      Radius.circular(SizeConfig.getSize(8))),
                                  border: Border.all(
                                      color: selectedIndex == null
                                          ? KColor.transparentColor
                                          : selectedIndex == index
                                              ? _theme.secondaryColor!
                                              : KColor.transparentColor)),
                              child: Padding(
                                padding:  EdgeInsets.only(left:SizeConfig.getSize(6), top: SizeConfig.getSize(2),bottom: SizeConfig.getSize(2)),
                                child: Center(
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: Text(
                                            '${menuListState[index].menuId}',
                                            style:_theme.heading5!.copyWith(fontSize:SizeConfig.getFontSize(18)),
                                            overflow: TextOverflow.ellipsis,
                                          )),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          '${menuListState[index].name}',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style:_theme.heading5!.copyWith(fontSize:SizeConfig.getFontSize(18)),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          '${menuListState[index].description}',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style:_theme.heading5!.copyWith(fontSize:SizeConfig.getFontSize(18)),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          '${_getMenuTypeString(menuListState[index].type ?? "O")}',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style:_theme.heading5!.copyWith(fontSize:SizeConfig.getFontSize(18)),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Opacity(
                                          opacity: .3,
                                          child: Row(
                                            children: [
                                              Container(
                                                width: SizeConfig.getSize(30),
                                                height: SizeConfig.getSize(30),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                         BorderRadius.all(
                                                            Radius.circular(SizeConfig.getSize(8))),
                                                    border: Border.all(
                                                        color: _theme.secondaryColor!)),
                                                child: Center(
                                                  child: (menuListState[index]
                                                              .isActive ??
                                                          false)
                                                      ? Icon(
                                                          Icons.check,
                                                          size: SizeConfig.getSize(20),
                                                          color:_theme.secondaryColor!,
                                                        )
                                                      : const SizedBox(),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  );
                }),
          );
        });
  }

  _scrollToIndex({
    required int listLength,
    required int selectedIndex,
  }) {
    final contentSize = _menuScrollController.position.viewportDimension +
        _menuScrollController.position.maxScrollExtent;
    final itemCount = listLength;
    final target = contentSize * selectedIndex / itemCount;
    _menuScrollController.animateTo(target - 100.00,
        curve: Curves.ease, duration: const Duration(milliseconds: 10));
  }

  String _getPanelName(int panelId) {
    String panelName = '';
    _menuPanelsDtoList = context.read<PanelsCubit>().state.menuPanelsDtoList;
    for (MenuPanelsDto element in _menuPanelsDtoList) {
      if (element.panelId == panelId) {
        panelName = element.name ?? '';
      }
    }
    return panelName;
  }
}
