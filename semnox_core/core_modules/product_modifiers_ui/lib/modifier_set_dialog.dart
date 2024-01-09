import 'package:execution_context/builder.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logs_data/logger.dart';
import 'package:messages_data/builder.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:product_menu_data/builder.dart';
import 'package:product_menu_data/models/product_price_container/modifier_set_container_dto.dart';
import 'package:product_menu_data/models/product_price_container/modifier_set_details_container_dto.dart';
import 'package:product_menu_data/models/product_price_container/product_modifier_container_dto.dart';
import 'package:product_menu_data/models/products_container/product_container_dto.dart';
import 'package:product_modifiers_ui/models/modifier_customization_model.dart';
import 'package:product_modifiers_ui/models/modifier_dto.dart';
import 'package:product_modifiers_ui/models/selected_item_model.dart';
import 'package:product_modifiers_ui/modifier_set_item.dart';
import 'package:product_modifiers_ui/product_list_item.dart';
import 'package:product_modifiers_ui/select_items_dialog.dart';
import 'package:product_modifiers_ui/selected_customizations.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_data/models/create_transaction/transaction_line_dto.dart';
import 'package:widgets_library/utils/size_config.dart';

import 'modifier_list_dialog.dart';

class ModifierSetDialog extends StatefulWidget {
  int _quantity;
  final ProductContainerDTO _productContainer;
  Function _onConfirm;
  Function _onCancel;
  final List<TransactionLineDTO> _transactionLineDtoList;
  final Map<int, ProductContainerDTO>? _productListsMaps;
  final Map<int, ModifierSetContainerDTO>? _modifierSetContainerMap;

  ModifierSetDialog(this._productListsMaps, this._modifierSetContainerMap,  this._productContainer, this._quantity, this._onConfirm, this._onCancel,
      [this._transactionLineDtoList = const []]);

  @override
  State<StatefulWidget> createState() {
    return ModifierSetDialogState();
  }
}

class ModifierSetDialogState extends State<ModifierSetDialog> {
  final ScrollController _scrollController = ScrollController();
  List<ModifierCustomizationModel> customizationItems = [];
  int itemIndex = 0;
  late NotificationBar _notificationBar;
  ScrollController scrollController = ScrollController();
  late List<ProductModifierContainerDTO> _productModifierContainerDTOList;
  Map<int, ProductContainerDTO>? _productListsMaps;
  final requiredModifiers = <ModifierSetContainerDTO>[];

  @override
  void initState() {
    super.initState();
    _productListsMaps = widget._productListsMaps;

    _notificationBar = NotificationBar(showHideSideBar: false);
    _productModifierContainerDTOList = widget._productContainer.productModifierContainerDTOList;

    for (var element in _productModifierContainerDTOList) { // sets from which modifier should be added mandatory.
      if(element.modifierSetContainerDTO?.minQuantity != -1) {
        requiredModifiers.add(element.modifierSetContainerDTO!);
      }
    }

    for (int i = 0; i < widget._quantity; i++) {
      customizationItems.add(ModifierCustomizationModel(
          widget._productContainer.productId, widget._productContainer.productName, 1, false));
    }

    if (widget._transactionLineDtoList.isNotEmpty) {
      final productQtyMap = <int, int>{};
      for (int i = 0; i < widget._transactionLineDtoList.length; i++) {
        final currQty = productQtyMap[widget._transactionLineDtoList[i].productId] ?? 0;
        if(currQty > 0) {
          customizationItems[itemIndex].selectedItems.removeWhere((element) => element.productId == widget._transactionLineDtoList[i].productId);
          productQtyMap[widget._transactionLineDtoList[i].productId] = currQty + 1;
          customizationItems[itemIndex].selectedItems.add(
              toModifierDTO(widget._transactionLineDtoList[i])..quantity = (currQty + 1)
          );
        } else {
          productQtyMap[widget._transactionLineDtoList[i].productId] = 1;
          customizationItems[itemIndex].selectedItems.add(toModifierDTO(widget._transactionLineDtoList[i]));
        }
      }
      updateQtyItemsList();
    }

    if (_productModifierContainerDTOList.length == 1) {
      loadModifiersList(_productModifierContainerDTOList[0]);
    }
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: theme.transparentColor,
        body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
          ),
          child: Column(children: [
            Expanded(
              child: Container(
                margin:  EdgeInsets.all(SizeConfig.getSize(24)),
                padding:  EdgeInsets.all(SizeConfig.getSize(8)),
                decoration: BoxDecoration(
                  color: theme.backGroundColor,
                  borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Customize",
                              style: GoogleFonts.robotoCondensed(
                                color: theme.secondaryColor,
                                fontSize: SizeConfig.getFontSize(16),
                              ),
                            ),
                            Text(
                              "${widget._productContainer.productName} (x${widget._quantity})",
                              style: GoogleFonts.robotoCondensed(
                                  color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ),
                     Divider(
                      thickness: 1,
                      color: theme.dividerColor,
                      indent: SizeConfig.getSize(8),
                      endIndent: SizeConfig.getSize(8),
                    ),
                    Expanded(
                      flex: 6,
                        child: Row(
                      children: [
                        if (widget._quantity > 1)
                          Expanded(
                            flex: 2,
                            child: Scrollbar(
                              controller: scrollController,
                              thumbVisibility: true,
                              child: ListView.builder(
                                controller: scrollController,
                                itemCount: widget._quantity,
                                itemBuilder: (BuildContext context, int index) {
                                  return getProductListItem(index);
                                },
                              ),
                            ),
                          ),
                        if (widget._quantity > 1)
                           VerticalDivider(
                            thickness: 1,
                            color: theme.dividerColor,
                          ),
                        Expanded(
                          flex: 6,
                          child: Column(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding:  EdgeInsets.only(right: SizeConfig.getSize(8)),
                                  child: Scrollbar(
                                    thumbVisibility: true,
                                    controller: _scrollController,
                                    child: GridView.builder(
                                      controller: _scrollController,
                                      padding:  EdgeInsets.symmetric(horizontal: SizeConfig.getSize(8)),
                                      itemCount: _productModifierContainerDTOList.length,
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: widget._quantity > 1 ? 2 : 4,
                                      mainAxisSpacing: 4,
                                      crossAxisSpacing: 4,
                                      childAspectRatio: widget._quantity > 1 ? 19/6 : 19/9,
                                    ),
                                    shrinkWrap: true,
                                    physics: const ClampingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return getModifierItem(
                                          _productModifierContainerDTOList[index]);
                                      return const Text("No items");
                                    },
                                  ),
                                ),
                              ),
                            ),
                            if (widget._quantity > 1)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton.icon(
                                    icon: Image.asset(
                                      'assets/ic_apply_to_all.png',
                                      height: SizeConfig.getSize(24),
                                      width: SizeConfig.getSize(24),
                                      color: theme.secondaryColor,
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                                      ),
                                      backgroundColor: theme.dividerColor,
                                    ),
                                    onPressed: () {
                                      customizationItems
                                          .map((e) => e.selectedItems = customizationItems[itemIndex].selectedItems)
                                          .toList();
                                      setState(() {});
                                      onConfirm(context);
                                    },
                                    label: Text(
                                      "APPLY TO ALL",
                                      style: GoogleFonts.robotoCondensed(
                                          color: theme.secondaryColor, fontSize:SizeConfig.getFontSize(16), fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                   SizedBox(
                                    width: SizeConfig.getSize(8),
                                  ),
                                  ElevatedButton.icon(
                                    icon: Image.asset(
                                      'assets/ic_apply_to_few.png',
                                      height: SizeConfig.getSize(24),
                                      width: SizeConfig.getSize(24),
                                      color: theme.secondaryColor,
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                                      ),
                                      backgroundColor: theme.dividerColor,
                                    ),
                                    onPressed: () {
                                      List<SelectedItemModel> items = [];
                                      for (int i = 0; i < widget._quantity; i++) {
                                        if (i != itemIndex) {
                                          items.add(SelectedItemModel(i, "Item ${i + 1}", false));
                                        }
                                      }
                                      showGeneralDialog(
                                          context: context,
                                          barrierDismissible: true,
                                          barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
                                          barrierColor: Colors.black45,
                                          transitionDuration: const Duration(milliseconds: 200),
                                          pageBuilder: (BuildContext buildContext, Animation animation,
                                              Animation secondaryAnimation) {
                                            return SelectItemsDialog(items, (int fromRange, int toRange) {
                                              for (int i = fromRange - 1; i < toRange; i++) {
                                                customizationItems[i].selectedItems = [
                                                  ...customizationItems[itemIndex].selectedItems
                                                ];
                                              }
                                              setState(() {});
                                            }, (List<SelectedItemModel> selectedItems) {
                                              for (int i = 0; i < selectedItems.length; i++) {
                                                customizationItems[selectedItems[i].index].selectedItems = [
                                                  ...customizationItems[itemIndex].selectedItems
                                                ];
                                              }
                                              setState(() {});
                                            });
                                          });
                                    },
                                    label: Text(
                                      "APPLY TO FEW",
                                      style: GoogleFonts.robotoCondensed(
                                          color: theme.secondaryColor, fontSize:SizeConfig.getFontSize(16), fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              )
                          ],
                        ),
                      ),
                      SelectedCustomizations(customizationItems, requiredModifiers,(String message, Color color) {
                        _notificationBar.showMessage(message, color);
                      }, () {
                        setState(() {});
                      }),
                    ],
                  )),
                   Divider(
                    thickness: 1,
                    color: theme.dividerColor,
                    indent: SizeConfig.getSize(8),
                    endIndent: SizeConfig.getSize(8),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: SizeConfig.getSize(68),
                          width: SizeConfig.getSize(120),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all( SizeConfig.getSize(4)),
                              tapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                              ),
                              backgroundColor: theme.button1BG1,
                            ),
                            onPressed: () {
                              widget._onCancel();
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Cancel".toUpperCase(),
                              style: GoogleFonts.robotoCondensed(
                                  color: theme.secondaryColor, fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                         SizedBox(width: SizeConfig.getSize(10)),
                        SizedBox(
                          height: SizeConfig.getSize(68),
                          width: SizeConfig.getSize(120),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.all( SizeConfig.getSize(4)),
                              tapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                              ),
                              backgroundColor: theme.button2BG1,
                            ),
                            onPressed: () {
                              onConfirm(context);
                            },
                            child: Text(
                              "OK",
                              style: GoogleFonts.robotoCondensed(
                                  color: Colors.white, fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
              child: _notificationBar,
            ),
          ]),
        ),
      ),
    );
  }

  void onConfirm(BuildContext context) {
    if(requiredModifiers.isNotEmpty) {
      int completed = 0;
      final customizationLength = customizationItems.length;
      for (var element in requiredModifiers) {
        for(int i = 0; i < customizationLength; i++) {
          customizationItems[i].selectedItems.firstWhere((e) {
            if(e.modifierSetId == element.modifierSetId) {
              completed++;
              return true;
            } else {
              return false;
            }
          }, orElse: () => ModifierDTO(-1,-1,-1,"", 0, false, false, false, 0, false, 0));
        }
      }
      if(completed != (requiredModifiers.length * customizationItems.length)) {
        _notificationBar.showMessage(MessagesProvider.get('Please complete the pending items.'), const Color(0xFFFEE891));
        return;
      }
    }
    Navigator.of(context).pop();
    widget._onConfirm(customizationItems);
  }

  Widget getModifierItem(ProductModifierContainerDTO productModifierContainerDTO) {
    return ModifierSetItem(productModifierContainerDTO.modifierSetContainerDTO, customizationItems[itemIndex].selectedItems, () {
      loadModifiersList(productModifierContainerDTO);
    });
  }

  Widget getProductListItem(int index) {
    return ProductListItem(index, widget._productContainer.productName, (index == itemIndex), customizationItems, requiredModifiers,
            (selectedIndex) {
      itemIndex = selectedIndex;
      setState(() {});
    });
  }



  loadParentModifiersData(ProductModifierContainerDTO productModifierContainerDTO) async {
    List<ModifierDTO> modifierDTOs = [];

    if (productModifierContainerDTO.modifierSetContainerDTO?.parentModifierSetDTO != null) {
      await Future.forEach(productModifierContainerDTO
          .modifierSetContainerDTO!.parentModifierSetDTO!.modifierSetDetailsContainerDTOList, (modifierSetDetailsContainerDTO) {

        var item = _productListsMaps?[modifierSetDetailsContainerDTO.modifierProductId];

        if (item != null) {
          int quantity = 0;
          modifierDTOs.add(ModifierDTO(
              modifierSetDetailsContainerDTO.modifierSetId,
              modifierSetDetailsContainerDTO.modifierSetDetailId,
              item.productId,
              item.productName,
              quantity,
              true,
              item.managerApprovalRequired.toLowerCase().contains("y"),
              item.trxRemarksMandatory.toLowerCase().contains("y"),
              0,
              false,
              0
          ));
        }
      });
    }
    return modifierDTOs;
  }

  Future<List<ModifierDTO>> loadModifiersSetData(ProductModifierContainerDTO productModifierContainerDTO) async {
    Log.v("loading ${productModifierContainerDTO.modifierSetContainerDTO?.setName}");

    List<ModifierDTO> modifierDTOs = [];
    await Future.forEach((productModifierContainerDTO.modifierSetContainerDTO?.modifierSetDetailsContainerDTOList ?? <ModifierSetDetailsContainerDTO>[]), (modifierSetDetailsContainerDTO) async {
      var item = _productListsMaps?[modifierSetDetailsContainerDTO.modifierProductId];
      Log.v(item?.productName ?? '');

      if (item != null) {
        int quantity = 0;

        // set quantity for pre-selected multi-quantity items
        if (customizationItems[itemIndex].qtyItemsList.isNotEmpty) {
          List<ModifierDTO> items = customizationItems[itemIndex]
              .qtyItemsList
              .where((element) => element.productId == item.productId && element.level == 0)
              .toList();
          if (items.isNotEmpty) {
            quantity = items[0].quantity.toInt();
          }
        }
        modifierDTOs.add(ModifierDTO(
            modifierSetDetailsContainerDTO.modifierSetId,
            modifierSetDetailsContainerDTO.modifierSetDetailId,
            item.productId,
            item.productName,
            quantity,
            false,
            item.managerApprovalRequired.toLowerCase().contains("y"),
            item.trxRemarksMandatory.toLowerCase().contains("y"),
            item.productModifierContainerDTOList.length,
            false,
            0
        ));
      }
    });
    return modifierDTOs;
  }

  void loadModifiersList(ProductModifierContainerDTO productModifierContainerDTO) async {
    Log.printMethodStart("loadModifiersList()", "Sales Screen -> Customize", "Init");
    List<ModifierDTO> modifierDTOs = await loadModifiersSetData(productModifierContainerDTO);
    List<ModifierDTO> parentModifierDTOs = await loadParentModifiersData(productModifierContainerDTO);
    if(productModifierContainerDTO.modifierSetContainerDTO != null) {
      Future.microtask(() => showGeneralDialog(
          context: context,
          barrierDismissible: false,
          barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
          barrierColor: Colors.black45,
          transitionDuration: const Duration(milliseconds: 200),
          pageBuilder: (BuildContext buildContext, Animation animation, Animation secondaryAnimation) {
            return ModifierListDialog(
                widget._productContainer.productName,
                productModifierContainerDTO.modifierSetContainerDTO!,
                modifierDTOs,
                parentModifierDTOs,
                [...customizationItems[itemIndex].qtyItemsList], (List<ModifierDTO> updatedList, int maxLevel) {
                  final selectedItems = updatedList.toSet().toList();
              final originalList = <ModifierDTO>[];
              final baseList = selectedItems.where((element) => element.level == 0);
              for (var element in baseList) {
                setUpdatedModifiers(0, element, selectedItems);
                originalList.add(element);
              }
              customizationItems[itemIndex].selectedItems.clear();
              customizationItems[itemIndex].selectedItems.addAll(originalList);
              customizationItems[itemIndex].qtyItemsList.clear();
              customizationItems[itemIndex].qtyItemsList.addAll(selectedItems);
              setState(() {});

              if (_productModifierContainerDTOList.length == 1 && widget._quantity == 1) {
                onConfirm(context);
              } else {
                _notificationBar.showMessage(
                    MessagesProvider.get('Updated the item(s) successfully.'), Colors.lightBlueAccent);
              }
            }, () {
              // onCancel
              if (_productModifierContainerDTOList.length == 1) {
                Navigator.of(context).pop();
              }
            });
          }));
    }
    Log.printMethodEnd("loadModifiersList()", "Sales Screen -> Customize", "Init");
    Log.printMethodReturn("loadModifiersList() - Loading modifiers completed.", "Sales Screen -> Customize", "Init");
  }

  void setUpdatedModifiers(int index, ModifierDTO dto, List<ModifierDTO> list) {
    final modifiers = <ModifierDTO>[];
    final levelList = list.where((element) => element.level == (index + 2)).toList();
    final productContainer = _productListsMaps?[dto.productId];
    final newModifierList = <ModifierDTO>[];
    for (var e in (productContainer?.productModifierContainerDTOList ?? <ProductModifierContainerDTO>[])) {
      for (var element in (e.modifierSetContainerDTO?.modifierSetDetailsContainerDTOList ?? <ModifierSetDetailsContainerDTO>[])) {
        newModifierList.add(
          ModifierDTO(element.modifierSetId, element.modifierSetDetailId, element.modifierProductId, "", 0, false, false, false, 0, false, 0)
        );
      }
    }
    for (var element in levelList) {
      for(var modifierPdt in newModifierList) {
        if(element.productId == modifierPdt.productId) {
          modifiers.add(element);
        }
      }
    }
    if(modifiers.isNotEmpty) {
      dto.childModifiers = modifiers;
      for (var innerElement in modifiers) {
        if(innerElement.childModifiersCount > 0) {
          setUpdatedModifiers(index + 2, innerElement, list);
        }
      }
    } else {
      dto.childModifiers = [];
    }
  }

  groupItems(List<ModifierDTO> selectedItems) {
    List<ModifierDTO> groupedList = [];
    for (int i = 0; i < selectedItems.length; i++) {
      bool productFound = false;
      for (int j = 0; j < groupedList.length; j++) {
        if (selectedItems[i].productId == groupedList[j].productId) {
          groupedList[j].quantity += selectedItems[i].quantity;
          productFound = true;
        }
      }

      if (!productFound) {
        groupedList.add(selectedItems[i]);
      }
    }
    return groupedList;
  }

  void updateQtyItemsList() {
    customizationItems[itemIndex].qtyItemsList.clear();
    for (var element in customizationItems[itemIndex].selectedItems) {
      if(element.childModifiers.isEmpty) {
        customizationItems[itemIndex].qtyItemsList.add(element);
      } else {
        customizationItems[itemIndex].qtyItemsList.add(element);
        checkModifiersRecursively(element);
      }
    }
  }

  void checkModifiersRecursively(ModifierDTO modifier) {
    if(modifier.childModifiers.isNotEmpty) {
      for (var element in modifier.childModifiers) {
        customizationItems[itemIndex].qtyItemsList.add(element);
        checkModifiersRecursively(element);
      }
    } else {
      modifier.childModifiers = [];
    }
  }
}
