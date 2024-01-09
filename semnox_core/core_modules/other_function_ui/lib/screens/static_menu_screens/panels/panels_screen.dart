import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:other_function_data/model/menu_panel/menu_panels_data.dart';
import 'package:other_function_ui/bloc/cubits/panels/panels_cubit.dart';
import 'package:other_function_ui/screens/static_menu_screens/panels/edit_panel_screen.dart';
import 'package:other_function_ui/screens/widgets/primary_dark_button.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/scroller.dart';
import '../../../bloc/cubits/panels/edit_panels/edit_panels_cubit.dart';
import '../../../bloc/cubits/panels/panels_state.dart';
import '../../../utils/constants.dart';
import 'package:widgets_library/utils/size_config.dart';


class PanelsScreen extends StatelessWidget {
  const PanelsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PanelsSection();
  }
}

class PanelsSection extends StatefulWidget {
  const PanelsSection({Key? key}) : super(key: key);

  @override
  State<PanelsSection> createState() => _PanelsSectionState();
}

class _PanelsSectionState extends State<PanelsSection> {
  final _panelListScrollBar = ScrollController();
  final _verticalScrollController = ScrollController();
  final TextEditingController _searchTextController = TextEditingController();
  late SemnoxTheme _theme;

  @override
  void initState() {
    super.initState();
    _initiateValues();
  }

  _initiateValues() async {
    context.read<PanelsCubit>().setInitialValues();
    final panelCubit = context.read<PanelsCubit>();
    final editPanelCubit =  context
        .read<EditPanelsCubit>();
    await panelCubit.getMenuPanelsData();
    await panelCubit.getProductContainerDetails();
    editPanelCubit.getMenuPanelsData(panelCubit.state.menuPanelsDtoList);
    editPanelCubit.getProductContainerDetails(
        panelCubit.state.productMenuResponse);
    editPanelCubit.getMapOfProductContainerDetails(productListsMaps:
        panelCubit.state.productContainerDtosMaps, redeemProductsMaps:  panelCubit.state.redeemProductContainerDtosMaps);
    editPanelCubit.updateCategoryAndProductTypeContainerList(
        panelCubit.state.categoryContainerList,
        panelCubit.state.productTypeContainerList );
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.only(left: SizeConfig.getSize(8), right: SizeConfig.getSize(8)),
          child: Container(
            height: SizeConfig.getHeight(SizeConfig.getSize(64)),
            width: SizeConfig.screenWidth,
            decoration: BoxDecoration(
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
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          MessagesProvider.get("Show All"),
                          style: _theme.heading5!.copyWith(fontSize: SizeConfig.getFontSize(18))
                        ),
                      ),
                       SizedBox(
                        height: SizeConfig.getSize(4),
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Padding(
                            padding:  EdgeInsets.only(left: SizeConfig.getSize(6), right: SizeConfig.getSize(6)),
                            child: SizedBox(
                              height: SizeConfig.getSize(42),
                              child: BlocSelector<PanelsCubit, PanelsState,
                                      String>(
                                  selector: (state) =>
                                      state.searchedValue ?? '',
                                  builder: (context, searchedValueState) {
                                    return TextFormField(
                                      onChanged: (String? value) {
                                        context
                                            .read<PanelsCubit>()
                                            .searchMenuPanels(value ?? '');
                                      },
                                      keyboardType: TextInputType.text,
                                      controller: _searchTextController,
                                      style:  _theme.heading4!.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                      decoration: AppDecorations
                                          .textFieldInputDecoration
                                          .copyWith(
                                          fillColor: _theme.primaryColor,
                                          filled: true,
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
                                              fontSize: SizeConfig.getFontSize(18)),
                                        hintText: MessagesProvider.get(
                                            'Search by Panel Name'),
                                        suffixIcon: searchedValueState
                                                .isNotEmpty
                                            ? InkWell(
                                                onTap: () {
                                                  _searchTextController.clear();
                                                  context
                                                      .read<PanelsCubit>()
                                                      .clearSearchTextField();
                                                },
                                                child: Icon(
                                                    Icons.cancel_outlined,
                                                    size: SizeConfig.getSize(35),
                                                    color:_theme.secondaryColor))
                                            : const SizedBox(),

                                      ),
                                    );
                                  }),
                            ),
                          )),
                          BlocSelector<PanelsCubit, PanelsState, bool>(
                              selector: (state) => state.isShowAll ?? false,
                              builder: (context, state) {
                                return InkWell(
                                  onTap: () {
                                    context
                                        .read<PanelsCubit>()
                                        .onSelectedShowAll();
                                  },
                                  child: Container(
                                    width: SizeConfig.getSize(42),
                                    height: SizeConfig.getSize(42),
                                    decoration: BoxDecoration(
                                        borderRadius:  BorderRadius.all(
                                            Radius.circular(SizeConfig.getSize(8))),
                                        border: Border.all(
                                            color: _theme.secondaryColor!)),
                                    child: Center(
                                      child: state
                                          ? Icon(
                                              Icons.check,
                                              size: SizeConfig.getSize(30),
                                              color: _theme.secondaryColor!,
                                            )
                                          : const SizedBox(),
                                    ),
                                  ),
                                );
                              })
                        ],
                      ),
                      Padding(
                        padding:  EdgeInsets.fromLTRB(SizeConfig.getSize(20), SizeConfig.getSize(24), SizeConfig.getSize(34), SizeConfig.getSize(10)),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Text(
                                  MessagesProvider.get('Panel ID'),
                                  style:  _theme.heading5!.copyWith(fontSize: SizeConfig.getFontSize(18))
                                )),
                            Expanded(
                              flex: 4,
                              child: Text(
                                MessagesProvider.get('Name'),
                                style: _theme.heading5!.copyWith(fontSize: SizeConfig.getFontSize(18)),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                '${MessagesProvider.get('Active')}?',
                                style:  _theme.heading5!.copyWith(fontSize: SizeConfig.getFontSize(18))
                              ),
                            ),

                          ],
                        ),
                      ),
                      Expanded(
                        child: BlocSelector<PanelsCubit, PanelsState,
                                List<MenuPanelsDto>>(
                            selector: (state) =>
                                state.filteredMenuPanelsDtoList ?? [],
                            builder: (context, menuListState) {
                              return Scroller(
                                controller: _panelListScrollBar,
                                child: ListView.builder(
                                    controller: _panelListScrollBar,
                                    itemCount: menuListState.length,
                                    // shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding:  EdgeInsets.fromLTRB(
                                            SizeConfig.getSize(15), SizeConfig.getSize(2), 30, SizeConfig.getSize(4)),
                                        child: BlocSelector<PanelsCubit,
                                                PanelsState, int>(
                                            selector: (state) =>
                                                state.selectedMenuPanelIndex ??
                                                0,
                                            builder: (context, selectedIndex) {
                                              return InkWell(
                                                onTap: () {
                                                  context
                                                      .read<PanelsCubit>()
                                                      .onSelectedPanel(index);
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: _theme.button1BG1!,
                                                      borderRadius:
                                                           BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  SizeConfig.getSize(8))),
                                                      border: Border.all(
                                                          color: selectedIndex ==
                                                                  index
                                                              ?  _theme.secondaryColor!
                                                              : _theme.transparentColor!)),
                                                  child: Padding(
                                                    padding:
                                                         EdgeInsets.all(
                                                            SizeConfig.getSize(8)),
                                                    child: Center(
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                              flex: 2,
                                                              child: Text(
                                                                '${menuListState[index].panelId}',
                                                                style:  _theme.heading5!.copyWith(fontSize: SizeConfig.getFontSize(18))
                                                              )),
                                                          Expanded(
                                                            flex: 4,
                                                            child: Text(
                                                              '${menuListState[index].name}',
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: _theme.heading5!.copyWith(fontSize: SizeConfig.getFontSize(18))
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 2,
                                                            child: Opacity(
                                                              opacity: .3,
                                                              child: Row(
                                                                children: [
                                                                  Container(
                                                                    width: SizeConfig.getSize(30),
                                                                    height: SizeConfig.getSize(30),
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                             BorderRadius.all(Radius.circular(
                                                                                SizeConfig.getSize(8))),
                                                                        border: Border.all(
                                                                            color: _theme.secondaryColor!)),
                                                                    child:
                                                                        Center(
                                                                      child: (menuListState[index].isActive ??
                                                                              false)
                                                                          ? Icon(
                                                                              Icons.check,
                                                                              size: SizeConfig.getSize(25),
                                                                              color: _theme.secondaryColor!,
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
                            }),
                      )
                    ],
                  )),
              Expanded(
                flex: 3,
                child: IntrinsicHeight(
                  child: BlocConsumer<PanelsCubit, PanelsState>(
                      listener: (context, state) {},
                      builder: (context, panelsState) {
                        return Padding(
                          padding:  EdgeInsets.fromLTRB(SizeConfig.getSize(8), 0, SizeConfig.getSize(8), SizeConfig.getSize(8)),
                          child: Column(
                            children: [
                              Container(
                                height:SizeConfig.getHeight(58),
                                // width: SizeConfig.getSize(336),
                                color:  _theme.button1BG1!,
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Opacity(
                                        opacity: panelsState
                                            .selectedMenuPanelIndex ==
                                            0
                                            ? 0.4
                                            :1,
                                        child: IconButton(
                                            onPressed: panelsState
                                                        .selectedMenuPanelIndex ==
                                                    0
                                                ? null
                                                : () {
                                              // _panelListScrollBar.jumpTo((panelsState.selectedMenuPanelIndex.toDouble() * ((SizeConfig.screenHeight-SizeConfig.safeBlockVertical)*(SizeConfig.screenHeight>600?0.060:.070)))-50);
                                              _scrollToIndex(listLength: panelsState
                                                  .filteredMenuPanelsDtoList
                                                  .length,selectedIndex: panelsState.selectedMenuPanelIndex);
                                              context
                                                        .read<PanelsCubit>()
                                                        .clickPrevMenu();
                                                  },
                                            icon:  Icon(Icons
                                                .arrow_back_ios_new_rounded, color: _theme.secondaryColor!, size: SizeConfig.getSize(30),)),
                                      ),
                                      panelsState
                                              .filteredMenuPanelsDtoList.isEmpty
                                          ? const SizedBox()
                                          : Expanded(
                                            child: Center(
                                              child: Text(
                                                  '${panelsState.selectedMenuPanelIndex != -1 ? panelsState.filteredMenuPanelsDtoList[panelsState.selectedMenuPanelIndex].name : ''}',
                                                  style: _theme.subtitle3!.copyWith(fontSize:SizeConfig.getFontSize(18)),
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                ),
                                            ),
                                          ),
                                      Opacity(
                                        opacity: panelsState
                                            .selectedMenuPanelIndex ==
                                            panelsState
                                                .filteredMenuPanelsDtoList
                                                .length -
                                                1
                                            ? 0.4
                                            :1,
                                        child: IconButton(
                                            hoverColor: _theme.secondaryColor!,
                                            onPressed: panelsState
                                                        .selectedMenuPanelIndex ==
                                                    panelsState
                                                            .filteredMenuPanelsDtoList
                                                            .length -
                                                        1
                                                ? null
                                                : () {
                                              _scrollToIndex(listLength: panelsState
                                                  .filteredMenuPanelsDtoList
                                                  .length,selectedIndex: panelsState.selectedMenuPanelIndex);
                                              // _panelListScrollBar.jumpTo((panelsState.selectedMenuPanelIndex.toDouble() *((SizeConfig.screenHeight-SizeConfig.safeBlockVertical)*(SizeConfig.screenHeight>600?0.065:.075)))-50);
                                                    context
                                                        .read<PanelsCubit>()
                                                        .clickNextMenu();
                                                  },
                                            icon:  Icon(
                                                Icons.arrow_forward_ios_rounded,color:  _theme.secondaryColor!, size: SizeConfig.getSize(30))),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  width: SizeConfig.screenWidth,
                                  height: SizeConfig.screenHeight,
                                  child: Scroller(
                                    controller: _verticalScrollController,
                                    child: panelsState.menuPanelsDtoList.isEmpty
                                        ? const SizedBox()
                                        : Padding(
                                          padding: const EdgeInsets.only(right: 30),
                                          child: ListView(
                                              controller:
                                                  _verticalScrollController,
                                              children: [
                                                columTexts(
                                                    MessagesProvider.get('Name'),
                                                    panelsState
                                                        .menuPanelsDtoList[panelsState
                                                            .selectedMenuPanelIndex]
                                                        .name),
                                                columTexts(
                                                    MessagesProvider.get(
                                                        'Column Count'),
                                                    panelsState
                                                        .menuPanelsDtoList[panelsState
                                                            .selectedMenuPanelIndex]
                                                        .columnCount),
                                                columTexts(
                                                    MessagesProvider.get(
                                                        'Row Count'),
                                                    panelsState
                                                        .menuPanelsDtoList[panelsState
                                                            .selectedMenuPanelIndex]
                                                        .rowCount),
                                                columTexts(
                                                    MessagesProvider.get(
                                                        'Image URL'),
                                                    panelsState
                                                        .menuPanelsDtoList[panelsState
                                                            .selectedMenuPanelIndex]
                                                        .imageURL
                                                        .toString()),
                                                columTexts(
                                                    MessagesProvider.get(
                                                        'Display Order'),
                                                    panelsState
                                                        .menuPanelsDtoList[panelsState
                                                            .selectedMenuPanelIndex]
                                                        .displayOrder),
                                                columTexts(
                                                    MessagesProvider.get(
                                                        'Cell Margin Left'),
                                                    panelsState
                                                        .menuPanelsDtoList[panelsState
                                                            .selectedMenuPanelIndex]
                                                        .cellMarginLeft),
                                                columTexts(
                                                    MessagesProvider.get(
                                                        'Cell Margin Right'),
                                                    panelsState
                                                        .menuPanelsDtoList[panelsState
                                                            .selectedMenuPanelIndex]
                                                        .cellMarginRight),
                                                columTexts(
                                                    MessagesProvider.get(
                                                        'Cell Margin Top'),
                                                    panelsState
                                                        .menuPanelsDtoList[panelsState
                                                            .selectedMenuPanelIndex]
                                                        .cellMarginTop),
                                                columTexts(
                                                    MessagesProvider.get(
                                                        'Cell Margin Bottom'),
                                                    panelsState
                                                        .menuPanelsDtoList[panelsState
                                                            .selectedMenuPanelIndex]
                                                        .cellMarginBottom),
                                                columTexts(
                                                    '${MessagesProvider.get('IsActive')}?',
                                                    panelsState
                                                        .menuPanelsDtoList[panelsState
                                                            .selectedMenuPanelIndex]
                                                        .isActive),
                                              ],
                                            ),
                                        ),
                                  ),
                                ),
                              ),
                               SizedBox(
                                height: SizeConfig.getSize(8),
                              ),
                              IntrinsicHeight(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: PrimaryDarkButton(
                                          onPressed: () {
                                            context
                                                .read<EditPanelsCubit>()
                                                .onSelectMenuPanelsData(
                                                    const MenuPanelsDto(
                                                  cellMarginTop: 2,
                                                  rowCount: 5,
                                                  panelId: -1,
                                                  columnCount: 5,
                                                  displayOrder: 0,
                                                  cellMarginBottom: 2,
                                                  name: '',
                                                  imageURL: '',
                                                  cellMarginLeft: 2,
                                                  cellMarginRight: 2,
                                                  isActive: true,
                                                  createdBy: '',
                                                  creationDate: '',
                                                  lastUpdatedBy: '',
                                                  siteId: -1,
                                                  masterEntityId: -1,
                                                  synchStatus: false,
                                                  guid: '',
                                                  productMenuPanelContentDTOList: [],
                                                  isChanged: true,
                                                  isChangedRecursive: false,
                                                ));
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
                                                                  refreshData:_initiateValues
                                                          ),
                                                        )));
                                          },
                                          title: MessagesProvider.get('New').toUpperCase()),
                                    ),
                                     SizedBox(
                                      width: SizeConfig.getSize(4),
                                    ),
                                    Expanded(
                                      child: PrimaryDarkButton(
                                          onPressed: panelsState
                                                  .filteredMenuPanelsDtoList
                                                  .isEmpty
                                              ? null
                                              : () {
                                                  context
                                                      .read<EditPanelsCubit>()
                                                      .onSelectMenuPanelsData(
                                                          panelsState
                                                                  .filteredMenuPanelsDtoList[
                                                              panelsState
                                                                  .selectedMenuPanelIndex]);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (newContext) =>
                                                              BlocProvider<
                                                                  EditPanelsCubit>.value(
                                                                value: context.read<
                                                                    EditPanelsCubit>(),
                                                                child: EditPanelScreen(
                                                                    refreshData:_initiateValues,isNew:
                                                                        false,
                                                                    menuPanelsDto: panelsState
                                                                            .filteredMenuPanelsDtoList[
                                                                        panelsState
                                                                            .selectedMenuPanelIndex]),
                                                              )));
                                                              },
                                                title: MessagesProvider.get('Edit').toUpperCase()),
                                    ),
                                     SizedBox(
                                      width: SizeConfig.getSize(4),
                                    ),
                                    Expanded(
                                      child: PrimaryDarkButton(
                                          onPressed: panelsState
                                                  .filteredMenuPanelsDtoList
                                                  .isEmpty
                                              ? null
                                              : () {
                                                  context
                                                      .read<PanelsCubit>()
                                                      .deleteMenuPanel()
                                                      .then((isSuccess) {
                                                    if (isSuccess) {
                                                      context
                                                          .read<
                                                              EditPanelsCubit>()
                                                          .getMenuPanelsData(context
                                                              .read<
                                                                  PanelsCubit>()
                                                              .state
                                                              .menuPanelsDtoList);
                                                    }
                                                  });
                                                },
                                          title: MessagesProvider.get('Delete').toUpperCase()),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  _scrollToIndex({required int listLength,required int selectedIndex, }){
    final contentSize = _panelListScrollBar.position.viewportDimension + _panelListScrollBar.position.maxScrollExtent;
    final itemCount = listLength;
    final target = contentSize * selectedIndex / itemCount;
    _panelListScrollBar.animateTo(target-100.00,curve: Curves.ease,duration:  const Duration(milliseconds: 10));
  }

  Widget columTexts(title, data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: _theme.subtitle2!.copyWith(fontSize:SizeConfig.getFontSize(18)),
        ),
         SizedBox(
          height: SizeConfig.getSize(4),
        ),
        Text(
          '$data',
          style: _theme.subtitle3!.copyWith(fontSize:SizeConfig.getFontSize(18)),
        ),
         SizedBox(
          height:  SizeConfig.getSize(10),
        )
      ],
    );
  }
}
