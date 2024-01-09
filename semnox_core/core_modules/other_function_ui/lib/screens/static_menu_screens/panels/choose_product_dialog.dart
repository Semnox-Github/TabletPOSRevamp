import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_data/models/category_container/category_container_dto.dart';
import 'package:master_data/models/product_type_container/product_type_container_dto.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:other_function_ui/bloc/cubits/panels/choose_product/choose_product_state.dart';
import 'package:product_menu_data/models/products_container/product_container_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/scroller.dart';
import '../../../bloc/cubits/panels/choose_product/choose_product_cubit.dart';
import '../../../utils/constants.dart';
import '../../widgets/primary_dark_button.dart';
import '../../widgets/primary_light_button.dart';
import 'package:widgets_library/utils/size_config.dart';


class ChooseProductDialog extends StatelessWidget {
  const ChooseProductDialog(
      {Key? key,
      required this.sellableProducts,
        required this.redeemableProducts,
        required this.allProducts,
      required this.onConfirm,
      required this.categoryContainerList,
      required this.productTypeContainerList})
      : super(key: key);
  final List<ProductContainerDTO> sellableProducts;
  final List<ProductContainerDTO> redeemableProducts;
  final List<ProductContainerDTO> allProducts;
  final Function onConfirm;
  final List<CategoryContainerDTO> categoryContainerList;
  final List<ProductTypeContainerDto> productTypeContainerList;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChooseProductCubit>(
        create: (context) => ChooseProductCubit(),
        child: ChooseProductDialogSection(
          sellableProducts: sellableProducts,
          redeemableProducts: redeemableProducts,
          allProducts: allProducts,
          onConfirm: onConfirm,
          categoryContainerList: categoryContainerList,
            productTypeContainerList:productTypeContainerList,
        ));
  }
}

class ChooseProductDialogSection extends StatefulWidget {
  const ChooseProductDialogSection(
      {Key? key,
        required this.sellableProducts,
        required this.redeemableProducts,
        required this.allProducts,
        required this.onConfirm,
        required this.categoryContainerList,
        required this.productTypeContainerList})
      : super(key: key);
  final List<ProductContainerDTO> sellableProducts;
  final List<ProductContainerDTO> redeemableProducts;
  final List<ProductContainerDTO> allProducts;
  final Function onConfirm;
  final List<CategoryContainerDTO> categoryContainerList;
  final List<ProductTypeContainerDto> productTypeContainerList;

  @override
  State<ChooseProductDialogSection> createState() =>
      _ChooseProductDialogSectionState();
}

class _ChooseProductDialogSectionState
    extends State<ChooseProductDialogSection> {
  Size _screenSize = const Size(0, 0);
  double _screenWidth = 0.0;
  double _screenHeight = 0.0;
  NotificationBar? _notificationBar;
  int? _selectedIndex;
  final TextEditingController _searchTextController = TextEditingController();
  final _scrollController = ScrollController();
  late SemnoxTheme _theme;

  @override
  void initState() {
    _notificationBar = NotificationBar(showHideSideBar: false);
    // print("sellable:${widget.sellableProducts.length}");
    // print("redeemable:${widget.redeemableProducts.length}");
    // print("all:${widget.allProducts.length}");
    context.read<ChooseProductCubit>().setInitialValues(
      sellableProductsContainerDtoList: widget.sellableProducts,
      redeemableProductsContainerDtoList:widget.redeemableProducts,
      allProductsContainerDtoList: widget.allProducts,
        categoryLists: widget.categoryContainerList,
    productTypeList: widget.productTypeContainerList, );
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
                              color: _theme.secondaryColor!.withOpacity(0.3),
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
                      height:SizeConfig.getSize(64),
                      // width:5,
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
                            MessagesProvider.get('Choose Product').toUpperCase(),
                            style: _theme.headingLight2!.copyWith(color:_theme.light1, fontSize: SizeConfig.getFontSize(26)),
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
                      height: SizeConfig.getSize(64),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: CustomScrollView(
              scrollDirection: Axis.vertical,
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
                      child: BlocConsumer<ChooseProductCubit,
                              ChooseProductState>(
                          listener: (context, state) {},
                          builder: (context, chooseProductState) {
                            return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IntrinsicHeight(
                                    child: Padding(
                                      padding:  EdgeInsets.only(top:SizeConfig.getSize(8)),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
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
                                                  style:_theme.heading5!.copyWith(fontSize:SizeConfig.getFontSize(18)),
                                                ),
                                                 SizedBox(
                                                  height: SizeConfig.getSize(8),
                                                ),
                                                SizedBox(
                                                  height:SizeConfig.getSize(52),
                                                  child: TextFormField(
                                                    style: _theme.subtitle1!,
                                                    autofocus: false,
                                                    controller:
                                                        _searchTextController,
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
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  MessagesProvider.get('Type'),
                                                  style: _theme.heading5!.copyWith(fontSize:SizeConfig.getFontSize(18)),
                                                ),
                                                 SizedBox(
                                                  height:  SizeConfig.getSize(8),
                                                ),
                                                SizedBox(
                                                  height: SizeConfig.getSize(52),
                                                  child: DropdownButtonFormField(
                                                    isExpanded: true,
                                                    items: chooseProductState
                                                        .productTypeList
                                                        .map<
                                                                DropdownMenuItem<
                                                                    String>>(
                                                            (String value) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: value,
                                                        child: Padding(
                                                          padding:
                                                               EdgeInsets.only(
                                                                  left: SizeConfig.getSize(8)),
                                                          child: Text(value,overflow: TextOverflow.ellipsis,),
                                                        ),
                                                      );
                                                    }).toList(),
                                                    onChanged: (String? value) {
                                                      context
                                                          .read<
                                                              ChooseProductCubit>()
                                                          .onSelectSearchType(
                                                              value);
                                                    },
                                                    value: chooseProductState
                                                        .selectedSearchType,
                                                    hint: Text(
                                                      MessagesProvider.get('SELECT'),
                                                      style:
                                                      _theme.textFieldHintStyle!.copyWith(fontSize:SizeConfig.getFontSize(18)),
                                                    ),
                                                    style:_theme.subtitle1!.copyWith(fontSize: SizeConfig.getFontSize(18)),
                                                    isDense: true,
                                                    decoration: AppDecorations
                                                        .textFieldInputDecoration
                                                        .copyWith(
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
                                                        ),
                                                    icon: SizedBox(
                                                      height:SizeConfig.getSize(30),
                                                      width:SizeConfig.getSize(30),
                                                      child: Image.asset(
                                                          'assets/down_arrow_white.png',
                                                          color:_theme.secondaryColor),
                                                    ),
                                                    // isExpanded: true,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                           SizedBox(
                                            width:  SizeConfig.getSize(8),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  MessagesProvider.get('Category'),
                                                  style:_theme.heading5!.copyWith(fontSize:SizeConfig.getFontSize(18)),
                                                ),
                                                 SizedBox(
                                                  height:  SizeConfig.getSize(8),
                                                ),
                                                SizedBox(
                                                  height: SizeConfig.getSize(52),
                                                  child: DropdownButtonFormField(
                                                    isExpanded: true,
                                                    items: chooseProductState
                                                        .categoryListStrings
                                                        .map<
                                                                DropdownMenuItem<
                                                                    String>>(
                                                            (String value) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: value,
                                                        child: Padding(
                                                          padding:
                                                               EdgeInsets.only(
                                                                  left:  SizeConfig.getSize(8)),
                                                          child: Text(value, overflow: TextOverflow.ellipsis,style:_theme.title1!.copyWith(fontSize: SizeConfig.getFontSize(18))),
                                                        ),
                                                      );
                                                    }).toList(),
                                                    onChanged: (String? value) {
                                                      context
                                                          .read<
                                                              ChooseProductCubit>()
                                                          .onSelectCategory(value);
                                                    },
                                                    value: chooseProductState
                                                        .selectedSearchCategory,
                                                    hint: Text(
                                                      MessagesProvider.get(
                                                          'SELECT'),
                                                      style:_theme.textFieldHintStyle!.copyWith(fontSize:SizeConfig.getFontSize(18)),
                                                    ),
                                                    style:_theme.subtitle1!.copyWith(fontSize:  SizeConfig.getSize(18)),
                                                    isDense: true,
                                                    decoration: AppDecorations
                                                        .textFieldInputDecoration
                                                        .copyWith(
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
                                                            hintStyle:_theme.textFieldHintStyle!.copyWith(fontSize:SizeConfig.getFontSize(18)),),
                                                    icon: SizedBox(
                                                      height:SizeConfig.getSize(30),
                                                      width:SizeConfig.getSize(30),
                                                      child: Image.asset(
                                                          'assets/down_arrow_white.png',
                                                          color: _theme.secondaryColor!),
                                                    ),
                                                    // isExpanded: true,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width:  SizeConfig.getSize(8),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  MessagesProvider.get('Product Type'),
                                                  style:_theme.heading5!.copyWith(fontSize:SizeConfig.getFontSize(18)),
                                                ),
                                                SizedBox(
                                                  height:  SizeConfig.getSize(8),
                                                ),
                                                SizedBox(
                                                  height: SizeConfig.getSize(52),
                                                  child: DropdownButtonFormField(
                                                    isExpanded: true,
                                                    items: chooseProductState
                                                        .mainProductType
                                                        .map<
                                                        DropdownMenuItem<
                                                            String>>(
                                                            (String value) {
                                                          return DropdownMenuItem<
                                                              String>(
                                                            value: value,
                                                            child: Padding(
                                                              padding:
                                                              EdgeInsets.only(
                                                                  left:  SizeConfig.getSize(8)),
                                                              child: Text(value, overflow: TextOverflow.ellipsis,style:_theme.title1!.copyWith(fontSize: SizeConfig.getFontSize(18))),
                                                            ),
                                                          );
                                                        }).toList(),
                                                    onChanged: (String? value) {
                                                      context
                                                          .read<
                                                          ChooseProductCubit>()
                                                          .onProductTypeSelected(value);
                                                    },
                                                    value: chooseProductState
                                                        .selectedMainProductType,
                                                    hint: Text(
                                                      MessagesProvider.get(
                                                          'SELECT'),
                                                      style:_theme.textFieldHintStyle!.copyWith(fontSize:SizeConfig.getFontSize(18)),
                                                    ),
                                                    style:_theme.subtitle1!.copyWith(fontSize:  SizeConfig.getSize(18)),
                                                    isDense: true,
                                                    decoration: AppDecorations
                                                        .textFieldInputDecoration
                                                        .copyWith(
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
                                                      hintStyle:_theme.textFieldHintStyle!.copyWith(fontSize:SizeConfig.getFontSize(18)),),
                                                    icon: SizedBox(
                                                      height:SizeConfig.getSize(30),
                                                      width:SizeConfig.getSize(30),
                                                      child: Image.asset(
                                                          'assets/down_arrow_white.png',
                                                          color: _theme.secondaryColor!),
                                                    ),
                                                    // isExpanded: true,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                           SizedBox(
                                            width:  SizeConfig.getSize(8),
                                          ),
                                          PrimaryLightButton(
                                            onPressed: () {
                                              if (FocusScope.of(context)
                                                  .hasFocus) {
                                                FocusScope.of(context).unfocus();
                                              }
                                              context
                                                  .read<ChooseProductCubit>()
                                                  .onSearchClear();
                                            },
                                            title: MessagesProvider.get('Clear').toUpperCase(),
                                          ),
                                           SizedBox(
                                            width:  SizeConfig.getSize(8),
                                          ),
                                          PrimaryDarkButton(
                                            onPressed: () {
                                              if (FocusScope.of(context)
                                                  .hasFocus) {
                                                FocusScope.of(context).unfocus();
                                              }
                                              context
                                                  .read<ChooseProductCubit>()
                                                  .onClickSearchButton(
                                                      searchedValue:
                                                          _searchTextController
                                                              .text,
                                                      categoryContainerList: widget
                                                          .categoryContainerList);
                                            },
                                            title: MessagesProvider.get('Search').toUpperCase(),
                                          ),
                                           SizedBox(
                                            width:  SizeConfig.getSize(4),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: SizeConfig.getSize(8),),
                                  Container(
                                    height: 1,
                                    color: _theme.dialogFooterInnerShadow,
                                  ),
                                  SizedBox(height: SizeConfig.getSize(8),),
                                  chooseProductState
                                          .filteredProductContainerDtoList
                                          .isNotEmpty
                                      ? Expanded(
                                          child: Padding(
                                            padding:  EdgeInsets.only(
                                                left:  SizeConfig.getSize(8), right: 0, bottom:  SizeConfig.getSize(8)),
                                            child: Scroller(
                                              controller: _scrollController,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 30.0),
                                                child: GridView.builder(
                                                  controller: _scrollController,
                                                  // physics: NeverScrollableScrollPhysics(),
                                                  // shrinkWrap: true,
                                                  gridDelegate:
                                                       SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount: 8,
                                                          crossAxisSpacing: 5.0,
                                                          mainAxisSpacing: 5.0,
                                                          mainAxisExtent:  SizeConfig.getSize(68)),
                                                  itemCount: chooseProductState
                                                      .filteredProductContainerDtoList
                                                      .length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          _selectedIndex =
                                                              index;
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
                                                                : _theme.button1BG1!,
                                                            borderRadius:
                                                                 BorderRadius
                                                                        .all(
                                                                    Radius
                                                                        .circular(
                                                                        SizeConfig.getSize(8)))),
                                                        child: Center(
                                                            child: Padding(
                                                          padding:
                                                               EdgeInsets
                                                                      .only(
                                                                  left: SizeConfig.getSize(4),
                                                                  right:  SizeConfig.getSize(4)),
                                                          child: Text(
                                                            chooseProductState
                                                                    .filteredProductContainerDtoList[
                                                                        index]
                                                                    .productName ??
                                                                '',
                                                             style:_selectedIndex ==
                                                                 index ? _theme.subtitleLight3!.copyWith(color: _theme.light1, fontSize:SizeConfig.getFontSize(18))
                                                                  : _theme.subtitle3!.copyWith(fontSize:SizeConfig.getSize(18)),
                                                            maxLines: 2,
                                                            overflow: TextOverflow.ellipsis,
                                                            textAlign: TextAlign
                                                                .center,
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
                                      :const Expanded(
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
                                  Padding(
                                    padding:  EdgeInsets.only(bottom:  SizeConfig.getSize(4)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        PrimaryLightButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            title: MessagesProvider.get('Cancel')
                                                .toUpperCase()),
                                         SizedBox(
                                          width:  SizeConfig.getSize(8),
                                        ),
                                        PrimaryDarkButton(
                                            onPressed: () {
                                              if (_selectedIndex != null ||
                                                  (_selectedIndex ?? -1) >= 0) {
                                                Navigator.pop(context);
                                                widget.onConfirm(chooseProductState
                                                    .filteredProductContainerDtoList[
                                                        (_selectedIndex ?? 0)]
                                                    .guid);
                                              } else {
                                                _notificationBar?.showMessage(
                                                    MessagesProvider.get(
                                                        'Please select a product to proceed'),
                                                    _theme.footerBG3!);
                                              }
                                            },
                                            title:
                                            MessagesProvider.get('Confirm')
                                                    .toUpperCase())
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
