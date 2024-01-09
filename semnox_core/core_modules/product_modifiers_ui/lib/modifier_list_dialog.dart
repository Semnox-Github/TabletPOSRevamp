import 'package:execution_context/builder.dart';
import 'package:execution_context/models/execution_context_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_ui/manager_login_popup.dart';
import 'package:logs_data/logger.dart';
import 'package:master_data/builder.dart';
import 'package:messages_data/builder.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:product_menu_data/builder.dart';
import 'package:product_menu_data/models/product_price_container/modifier_set_container_dto.dart';
import 'package:product_menu_data/models/product_price_container/modifier_set_details_container_dto.dart';
import 'package:product_menu_data/models/product_price_container/product_modifier_container_dto.dart';
import 'package:product_menu_data/models/products_container/product_container_dto.dart';
import 'package:product_menu_data/product_menu_bl.dart';
import 'package:product_modifiers_ui/modifier_list_item.dart';
import 'package:product_modifiers_ui/parent_modifier_list_item.dart';
import 'package:sprintf/sprintf.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/breadcrumb_item_ui.dart';
import 'package:widgets_library/mandatory_remark_dialog.dart';
import 'package:widgets_library/quantity_dialog.dart';
import 'package:widgets_library/utils/size_config.dart';

import 'models/modifier_dto.dart';

class ModifierListDialog extends StatefulWidget {
  final String _productName;
  final ModifierSetContainerDTO _modifierSet;
  final Function _onConfirm;
  final Function _onCancel;
  final List<ModifierDTO> _items;
  final List<ModifierDTO> _parentModifiers;
  final List<ModifierDTO> _selectedModifiers;

  const ModifierListDialog(
      this._productName, this._modifierSet, this._items, this._parentModifiers, this._selectedModifiers, this._onConfirm, this._onCancel,
      {super.key});

  @override
  State<StatefulWidget> createState() => ModifierListDialogState();
}

class ModifierListDialogState extends State<ModifierListDialog> {
  final ScrollController _modifiersScrollController = ScrollController();
  final ScrollController _parentModifiersScrollController = ScrollController();
  late ExecutionContextDTO? execContext;
  late NotificationBar _notificationBar;
  final List<ModifierDTO> _breadcrumbs = [];
  List<ModifierDTO> modifierDTOs = [];
  List<ModifierDTO> qtyModifierDTOs = [];
  ModifierDTO? selectedItem;
  int selectedModifierIndex = 0;
  bool _isCurrentUserManager = true;
  Map<int, ProductContainerDTO>? _productListsMaps;
  Map<int, ModifierSetContainerDTO>? _modifierSetContainerMap;
  int breadCrumbIndex = 0;
  int maxLevel = 0;
  late ModifierSetContainerDTO currentSetDTO;

  @override
  void initState() {
    super.initState();
    Future.microtask(() => initProductMap());
    _breadcrumbs.add(ModifierDTO(
        widget._modifierSet.modifierSetId,
        -1,
        widget._modifierSet.modifierSetId,
        widget._modifierSet.setName,
        0,
        false,
        false,
        false,
        0,
        false,
        0
    ));

    qtyModifierDTOs = widget._selectedModifiers;
    currentSetDTO = widget._modifierSet;

    setInitialModifiers();
    _notificationBar = NotificationBar(showHideSideBar: false);

    Future.microtask(() async {
      await _checkCurrentUserPrivileges();
    });
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    String minValidation = (widget._modifierSet.minQuantity != -1) ? "Min: ${widget._modifierSet.minQuantity}" : "";
    String maxValidation = (widget._modifierSet.maxQuantity != -1) ? "Max: ${widget._modifierSet.maxQuantity}" : "";
    String validationText = (minValidation.isNotEmpty || maxValidation.isNotEmpty)
        ? "($minValidation${(minValidation.isNotEmpty && maxValidation.isNotEmpty) ? ", " : ""}$maxValidation)"
        : "";

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
          ),
          child: Column(
            children: [
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
                          padding:  EdgeInsets.symmetric( horizontal: SizeConfig.getSize(16)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Item 1 - ${widget._productName}",
                                style: GoogleFonts.robotoCondensed(
                                  color: theme.secondaryColor,
                                  fontSize: SizeConfig.getFontSize(16),
                                ),
                              ),
                              Text(
                                "${widget._modifierSet.setName} $validationText",
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
                      Row(
                        children: [
                           Icon(Icons.arrow_right, size: SizeConfig.getSize(24),),
                          BreadCrumb.builder(
                            itemCount: _breadcrumbs.length,
                            builder: (index) {
                              return BreadCrumbItem(
                                content: GestureDetector(
                                onTap: () {
                                  qtyModifierDTOs.forEach((element) {
                                    print('DDDD>> ${element.productName} qty ${element.quantity} \n');
                                  });
                                  if (index != _breadcrumbs.length - 1) {
                                    _breadcrumbs.removeRange(index + 1, _breadcrumbs.length);
                                    breadCrumbIndex = index;
                                    if(index > maxLevel) {
                                      maxLevel = index;
                                    }
                                    _setUpdatedModifiersList();
                                    refreshUI();
                                  }
                                },
                                  child: BreadCrumbItemUI(_breadcrumbs[index].productName)
                              ),
                              );
                            },
                            divider:  Icon(Icons.arrow_right, size: SizeConfig.getSize(25),),
                            overflow: ScrollableOverflow(
                              keepLastDivider: false,
                              reverse: false,
                              direction: Axis.horizontal,
                            ),
                          ),
                        ],
                      ),
                       Padding(padding: EdgeInsets.all(SizeConfig.getSize(2))),
                      if (selectedItem != null && modifierDTOs.isNotEmpty && modifierDTOs[selectedModifierIndex].parentModifiers.isNotEmpty)
                        Row(
                          children: [
                            Padding(
                              padding:  EdgeInsets.symmetric(vertical: SizeConfig.getSize(8), horizontal: SizeConfig.getSize(16)),
                              child: Text(
                                "Qualifier for ${selectedItem?.productName}",
                                style:  TextStyle(
                                  color: theme.secondaryColor,
                                  fontSize: SizeConfig.getFontSize(16),
                                ),
                              ),
                            ),
                          ],
                        ),
                      if (modifierDTOs.isNotEmpty && modifierDTOs[selectedModifierIndex].parentModifiers.isNotEmpty)
                        Scrollbar(
                          controller: _parentModifiersScrollController,
                          thumbVisibility: true,
                          child: GridView.builder(
                            controller: _parentModifiersScrollController,
                            padding:  EdgeInsets.symmetric(horizontal:SizeConfig.getSize(8)),
                            itemCount: modifierDTOs[selectedModifierIndex].parentModifiers.length,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 6,
                              mainAxisSpacing: 4,
                              crossAxisSpacing: 4,
                              childAspectRatio: 2,
                            ),
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return getParentModifierItem(index);
                            },
                          ),
                        ),
                       Divider(
                        thickness: 1,
                        color: theme.dividerColor,
                        indent: SizeConfig.getSize(8),
                        endIndent: SizeConfig.getSize(8),
                      ),
                      Expanded(
                          child: Scrollbar(
                        controller: _modifiersScrollController,
                        thumbVisibility: true,
                        child: GridView.builder(
                          controller: _modifiersScrollController,
                          padding:  EdgeInsets.symmetric(horizontal: SizeConfig.getSize(8)),
                          itemCount: modifierDTOs.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 6,
                            mainAxisSpacing: 4,
                            crossAxisSpacing: 4,
                            childAspectRatio: 2,
                          ),
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return getModifierItem(index);
                          },
                        ),
                      )),
                       Divider(
                        thickness: 1,
                        color: theme.dividerColor,
                        indent: SizeConfig.getSize(8),
                        endIndent: SizeConfig.getSize(8),
                      ),
                      Row(
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
                                // ok pressed

                                if (validateQuantity()) {
                                  onConfirm();
                                } else {
                                  int totalQuantity = modifierDTOs.fold(0, (sum, next) => sum + next.quantity);
                                  if (currentSetDTO.maxQuantity != -1 &&
                                      totalQuantity > currentSetDTO.maxQuantity) {
                                    _notificationBar.showMessage(
                                        MessagesProvider.get('Select at most &1 for \'&2.\'',
                                            [currentSetDTO.maxQuantity, widget._productName]),
                                        const Color(0xFFFEE891));
                                  }

                                  // minQuantity
                                  if (currentSetDTO.minQuantity != -1 &&
                                      totalQuantity < currentSetDTO.minQuantity) {
                                    _notificationBar.showMessage(
                                        MessagesProvider.get('Select at least &1 for \'&2.\'',
                                            [currentSetDTO.minQuantity, widget._productName]),
                                        const Color(0xFFFEE891));
                                  }
                                }
                              },
                              child: Text(
                                "OK",
                                style: GoogleFonts.robotoCondensed(
                                    color: Colors.white, fontSize:SizeConfig.getFontSize(20), fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.green,
                child: _notificationBar,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onConfirm() {
    modifierDTOs.forEach((modifier) {
      print("-- modifier ${modifier.productName} quantity ${modifier.quantity}");
      modifier.parentModifiers.forEach((element) {
        print("-- parentModifier ${element.productName} quantity ${element.quantity}");
      });
    });
    int totalQuantity = modifierDTOs.fold(0, (sum, next) => sum + next.quantity);
    if(widget._modifierSet.modifierSetId != currentSetDTO.modifierSetId) {
      final baseList = qtyModifierDTOs.where((element) => element.quantity > 0
          && element.level == 0 && element.isModifierSet == false && element.modifierSetId == _breadcrumbs[0].modifierSetId
          && element.productId != _breadcrumbs[1].productId).toList();
      if(baseList.isNotEmpty) {
        for (var element in baseList) {
          totalQuantity += element.quantity;
        }
        if (widget._modifierSet.maxQuantity != -1 && totalQuantity > widget._modifierSet.maxQuantity) {
          if(_breadcrumbs.length > 1) {
            _breadcrumbs.removeRange(1, _breadcrumbs.length);
            breadCrumbIndex = 0;
            _setUpdatedModifiersList();
            refreshUI();
          }
          _notificationBar.showMessage(
              MessagesProvider.get(
                  'Select at most &1 for \'&2.\'', [widget._modifierSet.maxQuantity, widget._productName]),
              const Color(0xFFFEE891));
          return;
        } else if(widget._modifierSet.minQuantity != -1 && totalQuantity < widget._modifierSet.minQuantity) {
          if(_breadcrumbs.length > 1) {
            _breadcrumbs.removeRange(1, _breadcrumbs.length);
            breadCrumbIndex = 0;
            _setUpdatedModifiersList();
            refreshUI();
          }
          _notificationBar.showMessage(
              MessagesProvider.get(
                  'Select at least &1 for \'&2.\'', [widget._modifierSet.minQuantity, widget._productName]),
              const Color(0xFFFEE891));
          return;
        }
      }
      if(widget._modifierSet.minQuantity != -1 && totalQuantity < widget._modifierSet.minQuantity) {
        if(_breadcrumbs.length > 1) {
          _breadcrumbs.removeRange(1, _breadcrumbs.length);
          breadCrumbIndex = 0;
          _setUpdatedModifiersList();
          refreshUI();
        }
        _notificationBar.showMessage(
            MessagesProvider.get(
                'Select at least &1 for \'&2.\'', [widget._modifierSet.minQuantity, widget._productName]),
            const Color(0xFFFEE891));
        return;
      }
    }

    var selectedModifiers = qtyModifierDTOs.where((model) => (model.quantity > 0) && model.isModifierSet == false).toList();
    selectedModifiers.forEach((selectedModifier) {
      selectedModifier.parentModifiers =
          selectedModifier.parentModifiers.where((model) => (model.quantity > 0)).toList();
    });
    widget._onConfirm(selectedModifiers, maxLevel);
    Navigator.of(context).pop();
  }

  Widget getModifierItem(int index) {
    return GestureDetector(
      onTap: () async {
        if(modifierDTOs[index].childModifiersCount > 0) {
          addNextModifier(index);
        } else {
          // single tap to select/de-select the item

          if (modifierDTOs[index].quantity == 0) {
            onQuantityChanged(index, 1);
          } else {
            // The quantity changes to 0 after de-selecting an item. So reduce quantity method is not required.
            modifierDTOs[index].quantity = 0;
            selectedModifierIndex = 0;
            selectedItem = null;
            qtyModifierDTOs.removeWhere((element) => element.productId == modifierDTOs[index].productId && element.level == breadCrumbIndex);
            qtyModifierDTOs.removeWhere((element) => element.isModifierSet == true && element.level == breadCrumbIndex);
            final currSelected = qtyModifierDTOs.where((element) => element.level == breadCrumbIndex
                && element.quantity > 0
                && element.modifierSetId == _breadcrumbs.last.modifierSetId
                && element.isModifierSet == false).toList();

            if(currSelected.isEmpty) { // remove till root if there is no product selected in current level.
              final set = _modifierSetContainerMap?[modifierDTOs[index].modifierSetId];
              qtyModifierDTOs.removeWhere((element) => element.linkedSetId == modifierDTOs[index].modifierSetId && element.level == breadCrumbIndex);
              qtyModifierDTOs.removeWhere((element) => element.productName == set?.setName && element.level == breadCrumbIndex);
              final levelList = qtyModifierDTOs.where((element) => element.level == breadCrumbIndex
                  && element.modifierSetId == _breadcrumbs.last.modifierSetId && element.quantity > 0).toList();
              if(levelList.isEmpty) {
                removeProductRecursively(0, breadCrumbIndex);
              }
            }

            print("-- disable all");
            for (var parentModifier in modifierDTOs[selectedModifierIndex].parentModifiers) {
              parentModifier.isDisabled = true;
              parentModifier.quantity = 0;
            }
            setState(() {});
          }
        }
      },
      child: ModifierListItem(
        modifierDTOs[index],
        () {
          // quantity dialog
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return QuantityDialog("CHANGE QUANTITY", (int quantity) {
                  if (currentSetDTO.maxQuantity != -1 && quantity > currentSetDTO.maxQuantity) {
                    _notificationBar.showMessage(
                        MessagesProvider.get(
                            'Select at most &1 for \'&2.\'', [currentSetDTO.maxQuantity, widget._productName]),
                        const Color(0xFFFEE891));
                    return;
                  }
                  onQuantityChanged(index, quantity);
                }, initialQuantity: (modifierDTOs[index].quantity.toInt() == 0) ? 1 : modifierDTOs[index].quantity);
              });
        },
      ),
    );
  }

  //
  Widget getParentModifierItem(int index) {
    return GestureDetector(
      onTap: () {
        print("-- index $index");
        // single tap to select/de-select the item
        if (modifierDTOs[selectedModifierIndex].parentModifiers[index].quantity == 0 && selectedItem != null) {
          print("--selected modifiers empty");
          for (var parentModifier in modifierDTOs[selectedModifierIndex].parentModifiers) {
            parentModifier.quantity = 0;
          }
          modifierDTOs[selectedModifierIndex].parentModifiers[index].quantity = 1;
        } else {
          print("--selected modifiers not empty");
          modifierDTOs[selectedModifierIndex].parentModifiers[index].quantity = 0;
        }
        setState(() {});
      },
      child: ParentModifierListItem(modifierDTOs[selectedModifierIndex].parentModifiers[index]),
    );
  }

  void removeProductRecursively(int level,int maxLevel) {
    if(level == maxLevel) {
      qtyModifierDTOs.removeWhere((element) => element.isModifierSet == true && element.level == maxLevel);
    } else {
      if(level % 2 == 0) { // product
        qtyModifierDTOs.removeWhere((element) => element.productId == _breadcrumbs[level + 1].productId && element.level == level);
        removeProductRecursively(level + 1, maxLevel);
      } else { //set
        qtyModifierDTOs.removeWhere((element) => element.modifierSetDetailId == _breadcrumbs[level + 1].modifierSetDetailId && element.level == level);
        removeProductRecursively(level + 1, maxLevel);
      }
    }
  }

  bool validateQuantity() {
    int totalQuantity = modifierDTOs.fold(0, (sum, next) => sum + next.quantity);
    if (currentSetDTO.maxQuantity != -1) {
      if (totalQuantity == currentSetDTO.maxQuantity) {
        return true;
      } else if (totalQuantity > currentSetDTO.maxQuantity) {
        return false;
      }
    }

    // minQuantity
    if (currentSetDTO.minQuantity != -1 && totalQuantity < currentSetDTO.minQuantity) {
      return false;
    }

    return true;
  }

  void onQuantityChanged(int itemIndex, int quantity) {
    int newQuantity = quantity - modifierDTOs[itemIndex].quantity;

    int totalQuantity = modifierDTOs.fold(0, (sum, next) => sum + next.quantity);
    print("--------- onQuantityChanged");

    // maxQuantity
    if (currentSetDTO.maxQuantity != -1) {
      if (totalQuantity <= currentSetDTO.maxQuantity &&
          (totalQuantity + newQuantity) <= currentSetDTO.maxQuantity) {
        validateFlags(itemIndex, quantity, newQuantity);

        totalQuantity = modifierDTOs.fold(0, (sum, next) => sum + next.quantity);
        Log.v("total Q $totalQuantity");
        Log.v("max Q ${currentSetDTO.maxQuantity}");
        if (totalQuantity == currentSetDTO.maxQuantity &&
            currentSetDTO.maxQuantity != currentSetDTO.minQuantity) {
          onConfirm();
        }
      } else {
        _notificationBar.showMessage(
            MessagesProvider.get(
                'Select at most &1 for \'&2.\'', [currentSetDTO.maxQuantity, widget._productName]),
            const Color(0xFFFEE891));
      }
    } else {
      validateFlags(itemIndex, quantity, newQuantity);
    }

    // minQuantity
    if (currentSetDTO.minQuantity != -1) {
      if (totalQuantity == currentSetDTO.minQuantity) {
        onConfirm();
      }
    }
  }

  void validateFlags(int itemIndex, int quantity, int newQuantity) {
    bool flagFound = false;

    if (modifierDTOs[itemIndex].trxRemarksMandatory) {
      flagFound = true;
      print("-- trxRemarksMandatory ${modifierDTOs[itemIndex].trxRemarksMandatory}");
      _showRemarksMandatoryDialog(modifierDTOs[itemIndex].productName, modifierDTOs[itemIndex].productId, newQuantity,
          onRemarksInputCallback: (String remarks) {
        addQuantity(itemIndex, quantity, newQuantity, remarks);
      });
    }

    if (modifierDTOs[itemIndex].managerApprovalRequired) {
      if (_isCurrentUserManager) {
        flagFound = true;
        print("-- managerApprovalRequired addQuantity");
        addQuantity(itemIndex, quantity, newQuantity, "", execContext?.userId ?? "");
      } else {
        flagFound = true;
        print("-- managerApprovalRequired _showManagerLoginPopup");
        _showManagerLoginPopup(onAuthSuccess: (userName) {
          addQuantity(itemIndex, quantity, newQuantity, "", userName);
        });
      }
    }

    if (!flagFound) {
      addQuantity(itemIndex, quantity, newQuantity);
    }
  }

  void addQuantity(int itemIndex, int quantity, int newQuantity, [String remarks = "", String approvedBy = ""]) {
    modifierDTOs[itemIndex].quantity = quantity;
    modifierDTOs[itemIndex].remarks = remarks;
    modifierDTOs[itemIndex].approvedBy = approvedBy;

    selectedModifierIndex = itemIndex;
    setSelectedItemRecursively(itemIndex);

    if (quantity > 0) {
      for (var parentModifier in modifierDTOs[selectedModifierIndex].parentModifiers) {
        parentModifier.isDisabled = false;
        parentModifier.quantity = 0;
      }
    }

    setState(() {});
    _notificationBar.showMessage(
        MessagesProvider.get(
            'Newly added product &1, Quantity : &2', [modifierDTOs[itemIndex].productName, newQuantity]),
        Colors.lightBlueAccent);
  }

  _showRemarksMandatoryDialog(
    String productName,
    int productId,
    int quantity, {
    required Function(String remarks) onRemarksInputCallback,
    bool isCardProduct = false,
  }) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return MandatoryRemarkDialog(
            productId: productId,
            quantity: quantity,
            isCardProduct: isCardProduct,
            onComplete: () {
              String notification =
                  sprintf(MessagesProvider.get("Newly added product %s, Quantity: %d"), [productName, 1]);
              _notificationBar.showMessage(notification, const Color.fromARGB(255, 180, 236, 251));
            },
            onCancel: () {},
            onRemarksInput: (String remarks) {
              onRemarksInputCallback(remarks);
            },
          );
        });
  }

  Future<void> _checkCurrentUserPrivileges() async {
    final execContextBL = await ExecutionContextBuilder.build();
    execContext = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContext!);
    final userRoleDTO = await masterDataBL.getUserRoleById(execContext?.userRoleId ?? -1);
    _isCurrentUserManager = userRoleDTO?.selfApprovalAllowed == true;
  }

  void _showManagerLoginPopup({required Function(String userName) onAuthSuccess}) {
    showDialog(
        context: context,
        builder: (ctx) {
          return Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: SizeConfig.getSize(220)),
            child: ManagerLoginView(
              onLoginSuccess: (response) {
                FocusManager.instance.primaryFocus?.unfocus();
                onAuthSuccess(response.data?.userId ?? "");
              },
              onLoginError: (err) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
            ),
          );
        });
  }

  void addNextModifier(int horizontalIndex) {
    final item = modifierDTOs[horizontalIndex];
    _breadcrumbs.add(item);
    if(item.isModifierSet) {
      currentSetDTO = _modifierSetContainerMap?[item.modifierSetId] ?? widget._modifierSet;
    }
    modifierDTOs.clear();
    selectedModifierIndex = 0;
    if(breadCrumbIndex % 2 == 0) { // nested product selected
      final productDetails = _productListsMaps?[item.productId];
      for (var element in (productDetails?.productModifierContainerDTOList ?? <ProductModifierContainerDTO>[])) {
        final list = qtyModifierDTOs.where((e) => e.modifierSetId == element.modifierSetId);
        final qty = list.fold(0, (previousValue, element) => previousValue + element.quantity);
        modifierDTOs.add(
            ModifierDTO(
                element.modifierSetId,
                -1,
                element.modifierSetContainerDTO?.modifierSetId ?? -1,
                element.modifierSetContainerDTO?.setName ?? '',
                qty > 0 ? 1 : 0,
                false,
                false,
                false,
                element.modifierSetContainerDTO?.modifierSetDetailsContainerDTOList.length ?? 0,
                true,
                breadCrumbIndex + 1
            )
        );
      }
    } else { // modifier set selected
      final sets = _modifierSetContainerMap?[item.modifierSetId];
      for (var element in (sets?.modifierSetDetailsContainerDTOList ?? <ModifierSetDetailsContainerDTO>[])) {
        var item = _productListsMaps?[element.modifierProductId];
        if(item != null) {
          final list = qtyModifierDTOs.where((e) => e.modifierSetDetailId == element.modifierSetDetailId);
          final qty = list.fold(0, (previousValue, element) => previousValue + element.quantity);
          modifierDTOs.add(
              ModifierDTO(
                  element.modifierSetId,
                  element.modifierSetDetailId,
                  item.productId,
                  item.productName,
                  qty,
                  false,
                  item.managerApprovalRequired.toLowerCase().contains("y"),
                  item.trxRemarksMandatory.toLowerCase().contains("y"),
                  item.productModifierContainerDTOList.length,
                  false,
                  breadCrumbIndex + 1
              )
          );
        }
      }
    }
    breadCrumbIndex = _breadcrumbs.length - 1;
    refreshUI();
  }

  void _setUpdatedModifiersList() {
    modifierDTOs.clear();
    selectedModifierIndex = 0;

    if(breadCrumbIndex == 0) {
      currentSetDTO = widget._modifierSet;
      for (var element in widget._items) {
        final list = qtyModifierDTOs.where((e) => e.productId == element.productId);
        final qty = list.fold(0, (previousValue, element) => previousValue + element.quantity);
        modifierDTOs.add(element..quantity = qty);
      }

      if (widget._parentModifiers.isNotEmpty) {
        for (var modifierDTO in modifierDTOs) {
          modifierDTO.parentModifiers = ModifierDTO.cloneAll(widget._parentModifiers);
        }
      }
    } else {
      var currDTO = _breadcrumbs[breadCrumbIndex];
      if(currDTO.isModifierSet) {
        final sets = _modifierSetContainerMap?[currDTO.modifierSetId];
        currentSetDTO = sets ?? widget._modifierSet;
        for (var element in (sets?.modifierSetDetailsContainerDTOList ?? <ModifierSetDetailsContainerDTO>[])) {
          var item = _productListsMaps?[element.modifierProductId];
          if(item != null) {
            final list = qtyModifierDTOs.where((e) => e.productId == element.modifierProductId);
            final qty = list.fold(0, (previousValue, element) => previousValue + element.quantity);
            modifierDTOs.add(
                ModifierDTO(
                    element.modifierSetId,
                    element.modifierSetDetailId,
                    item.productId,
                    item.productName,
                    qty,
                    false,
                    item.managerApprovalRequired.toLowerCase().contains("y"),
                    item.trxRemarksMandatory.toLowerCase().contains("y"),
                    item.productModifierContainerDTOList.length,
                    false,
                    breadCrumbIndex + 1
                )
            );
          }
        }
      } else {
        final productDetails = _productListsMaps?[currDTO.productId];
        for (var element in (productDetails?.productModifierContainerDTOList ?? <ProductModifierContainerDTO>[])) {
          final list = qtyModifierDTOs.where((e) => e.modifierSetId == element.modifierSetId);
          final qty = list.fold(0, (previousValue, element) => previousValue + element.quantity);
          modifierDTOs.add(
              ModifierDTO(
                  element.modifierSetId,
                  -1,
                  element.modifierSetContainerDTO?.modifierSetId ?? -1,
                  element.modifierSetContainerDTO?.setName ?? '',
                  qty > 0 ? 1 : 0,
                  false,
                  false,
                  false,
                  element.modifierSetContainerDTO?.modifierSetDetailsContainerDTOList.length ?? 0,
                  true,
                  breadCrumbIndex + 1
              )
          );
        }
      }
    }
  }

  void setInitialModifiers() {
    modifierDTOs.addAll(widget._items);

    if (widget._parentModifiers.isNotEmpty) {
      for (var modifierDTO in modifierDTOs) {
        modifierDTO.parentModifiers = ModifierDTO.cloneAll(widget._parentModifiers);
      }
    }
  }

  Future<void> initProductMap() async {
    var execContextBL = await ExecutionContextBuilder.build();
    var execContextDTO = execContextBL.getExecutionContext();
    var productMenuDataBl = await ProductMenuDataBuilder.build(execContextDTO!);
    _productListsMaps = await productMenuDataBl.getMapOfProductContainerDetails();
    _modifierSetContainerMap = await productMenuDataBl.getMapOfModifierSetContainerDetails();
  }

  void refreshUI() {
    try {
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  void setSelectedItemRecursively(int itemIndex) {
    if(breadCrumbIndex == 0) {
      selectedItem = modifierDTOs[itemIndex];
      qtyModifierDTOs.removeWhere((element) => element.productId == selectedItem!.productId && element.level == 0);
      qtyModifierDTOs.add(selectedItem!);
    } else {
      final qty = modifierDTOs[itemIndex].quantity;
      selectedItem = _breadcrumbs[0];
      final list = [..._breadcrumbs];
      setUpdatedModifiers(0, list, selectedItem!, qty);
    }
  }

  void setUpdatedModifiers(int index, List<ModifierDTO> list, ModifierDTO dto, int qty) {
    if(index == (list.length - 1)) {
      dto.quantity = qty;
      dto.linkedSetId = modifierDTOs[selectedModifierIndex].productId;
      qtyModifierDTOs.removeWhere((element) => element.productId == modifierDTOs[selectedModifierIndex].productId && element.level == index);
      qtyModifierDTOs.add(modifierDTOs[selectedModifierIndex]..linkedSetId = modifierDTOs[selectedModifierIndex].modifierSetId);
    } else {
      final childDto = _breadcrumbs[index+1]
        ..quantity = 1
        ..linkedSetId = modifierDTOs[selectedModifierIndex].modifierSetId;
      dto.childModifiers = [childDto];
      dto.quantity = 1;
      dto.linkedSetId = modifierDTOs[selectedModifierIndex].modifierSetId;
      if(_breadcrumbs[index+1].isModifierSet) {
        qtyModifierDTOs.removeWhere((element) => element.productName == _breadcrumbs[index+1].productName && element.level == (index));
        qtyModifierDTOs.removeWhere((element) => element.productId == _breadcrumbs[index+1].productId && element.level == (index));
      } else {
        qtyModifierDTOs.removeWhere((element) => element.productId == _breadcrumbs[index+1].productId);
      }
      qtyModifierDTOs.add(childDto);
      setUpdatedModifiers(index + 1, list, dto.childModifiers.first, qty);
    }
  }

}
