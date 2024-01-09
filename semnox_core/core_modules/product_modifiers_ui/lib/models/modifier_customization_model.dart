import 'package:product_modifiers_ui/models/modifier_dto.dart';
import 'package:transaction_data/models/request/add_modifier_product/add_modifier_product_request.dart';
import 'package:transaction_data/models/request/add_modifier_product/transaction_line_request.dart';

class ModifierCustomizationModel {
  String productName;
  int quantity;
  bool isSelected;
  int productId;
  List<ModifierDTO> selectedItems = []; /// selected list (nested)
  List<ModifierDTO> qtyItemsList = []; /// flat list of modifiers (for tracking qty)

  ModifierCustomizationModel(this.productId, this.productName, this.quantity, this.isSelected);

  AddModifierProductRequest toAddModifierProductRequest(String seatName, int seatNumber) {
    List<TransactionLineDTORequest> transactionLineDTORequests = [];
    transactionLineDTORequests = selectedItems.map((e) {
      List<TransactionLineDTORequest> parentModifiersLineDTORequests = (e.parentModifiers.isEmpty)
          ? []
          : e.parentModifiers
              .map((parentModifier) => TransactionLineDTORequest(
                  modifierSetId: parentModifier.modifierSetId,
                  modifierSetDetailId: parentModifier.modifierSetDetailId,
                  productId: parentModifier.productId,
                  productName: parentModifier.productName,
                  quantity: parentModifier.quantity.toDouble(),
                  remarks: parentModifier.remarks,
                  approvedBy: parentModifier.approvedBy,
                  isParentModifier: true))
              .toList();

      List<TransactionLineDTORequest> childModifiersLineDTORequests = getChildModifiers(e.childModifiers);

      return TransactionLineDTORequest(
          modifierSetId: e.modifierSetId,
          modifierSetDetailId: e.modifierSetDetailId,
          productId: e.productId,
          productName: e.productName,
          quantity: e.quantity.toDouble(),
          remarks: e.remarks,
          approvedBy: e.approvedBy,
          transactionLineDTOList: parentModifiersLineDTORequests.isEmpty ? childModifiersLineDTORequests : parentModifiersLineDTORequests);
    }).toList();
    return AddModifierProductRequest(
        seatName: seatName,
        seatNumber: seatNumber,
        productId: productId,
        quantity: quantity.toDouble(),
        productName: productName,
        transactionLineDTOList: transactionLineDTORequests);
  }

  List<TransactionLineDTORequest> getChildModifiers(List<ModifierDTO> modifiers) {
    if(modifiers.isNotEmpty) {
      List<TransactionLineDTORequest> updateModifiers = modifiers.map((e) {
        return TransactionLineDTORequest(
            modifierSetId: e.modifierSetId,
            modifierSetDetailId: e.modifierSetDetailId,
            productId: e.productId,
            productName: e.productName,
            quantity: e.quantity.toDouble(),
            remarks: e.remarks,
            approvedBy: e.approvedBy,
            transactionLineDTOList: getChildModifiers(e.childModifiers));
      }).toList();

      return updateModifiers;
    } else {
      return <TransactionLineDTORequest>[];
    }
  }
}
