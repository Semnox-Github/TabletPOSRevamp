import 'package:product_menu_data/models/product_price_container/product_modifier_container_dto.dart';
import 'package:transaction_data/models/create_transaction/transaction_line_dto.dart';

class ModifierDTO {
  int modifierSetId;
  int modifierSetDetailId;
  int productId;
  String productName;
  int quantity;
  int linkedSetId = -1;
  bool isDisabled;
  List<ModifierDTO> parentModifiers = [];
  List<ModifierDTO> childModifiers = [];
  bool managerApprovalRequired = false;
  bool trxRemarksMandatory = false;
  bool isModifierSet = false;
  int childModifiersCount;
  int level;
  String remarks = "";
  String approvedBy = "";

  ModifierDTO(this.modifierSetId, this.modifierSetDetailId, this.productId, this.productName, this.quantity,
      this.isDisabled, this.managerApprovalRequired, this.trxRemarksMandatory, this.childModifiersCount, this.isModifierSet,
      this.level, [this.remarks = "", this.approvedBy = ""]);

  ModifierDTO clone() {
    return ModifierDTO(modifierSetId, modifierSetDetailId, productId, productName, quantity, isDisabled,
        managerApprovalRequired, trxRemarksMandatory, childModifiersCount, isModifierSet, level, remarks, approvedBy);
  }

  static List<ModifierDTO> cloneAll(List<ModifierDTO> modifierDTOs) {
    List<ModifierDTO> clonedList = [];
    for (var element in modifierDTOs) {
      clonedList.add(element.clone());
    }
    return clonedList;
  }
}

ModifierDTO toModifierDTO(TransactionLineDTO transactionLineDTO) {

  var modifierDTO = ModifierDTO(
      transactionLineDTO.modifierSetId,
      transactionLineDTO.modifierSetDetailId,
      transactionLineDTO.productId,
      transactionLineDTO.productName,
      transactionLineDTO.quantity.toInt(),
      false,
      false,
      false,
      transactionLineDTO.transactionLineDTOList.length,
      false,
      0,
      transactionLineDTO.remarks,
      transactionLineDTO.approvedBy?? ""
  );

  setUpdatedModifiers(0, modifierDTO, transactionLineDTO);

  return modifierDTO;
}

void findLastItemModifierSetId(ModifierDTO dto, ) {

}

void setUpdatedModifiers(int level, ModifierDTO dto, TransactionLineDTO transactionLineDTO) {
  if(transactionLineDTO.transactionLineDTOList.isEmpty) {
    dto.childModifiers = [];
  } else {
    final childModifiers = <ModifierDTO>[];
    final productQtyMap = <int, int>{};
    for (var e in transactionLineDTO.transactionLineDTOList) {
      final currQty = productQtyMap[e.productId] ?? 0;
      if(currQty > 0) {
        childModifiers.removeWhere((element) => element.productId == e.productId);
        productQtyMap[e.productId] = currQty + 1;
        childModifiers.add(ModifierDTO(
            e.modifierSetId,
            e.modifierSetDetailId,
            e.productId,
            e.productName,
            productQtyMap[e.productId] ?? e.quantity.toInt(),
            false,
            false,
            false,
            e.transactionLineDTOList.length,
            false,
            level + 2,
            e.remarks,
            e.approvedBy?? ""
        )..linkedSetId =   e.modifierSetId);
      } else {
        productQtyMap[e.productId] = 1;
        childModifiers.add(ModifierDTO(
            e.modifierSetId,
            e.modifierSetDetailId,
            e.productId,
            e.productName,
            productQtyMap[e.productId] ?? e.quantity.toInt(),
            false,
            false,
            false,
            e.transactionLineDTOList.length,
            false,
            level + 2,
            e.remarks,
            e.approvedBy?? ""
        )..linkedSetId =   e.modifierSetId);
      }
    }
    dto.childModifiers = childModifiers;
    for(int i = 0; i < childModifiers.length; i++) {
      setUpdatedModifiers(level + 2, childModifiers[i], transactionLineDTO.transactionLineDTOList[i]);
    }
  }
}


