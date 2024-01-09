import 'dart:io';
import 'package:execution_context/builder.dart';
import 'package:execution_context/execution_context_bl.dart';
import 'package:execution_context/models/execution_context_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:master_data/builder.dart';
import 'package:other_function_data/model/menu_panel/menu_panels_data.dart';
import 'package:other_function_data/model/menu_panel/product_menu_panel_content_dto.dart';
import 'package:other_function_ui/bloc/cubits/panels/edit_panels/edit_panels_cubit.dart';
import 'package:other_function_ui/bloc/cubits/panels/edit_panels/edit_panels_state.dart';
import 'package:other_function_ui/screens/widgets/primary_dark_button.dart';
import 'package:other_function_ui/utils/constants.dart';
import 'package:other_function_ui/widgets/colors.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/number_pad/number_pad.dart';
import 'package:widgets_library/scroller.dart';
import '../../../widgets/primary_light_button.dart';
import '../color_picker_dialog.dart';
import '../setup_font_dialog.dart';
import 'package:widgets_library/utils/size_config.dart';


class EditPanelConfigWidget extends StatefulWidget {
  const EditPanelConfigWidget(
      {Key? key, required this.isEdit, required this.isGridViewMode})
      : super(key: key);
  final bool isEdit;
  final bool isGridViewMode;

  @override
  State<EditPanelConfigWidget> createState() => _EditPanelConfigWidgetState();
}

class _EditPanelConfigWidgetState extends State<EditPanelConfigWidget> {
  final _verticalScrollController = ScrollController();
  final List<String> _buttonsDropDownList = ['Half', 'Normal', 'Large'];
  final ImagePicker _picker = ImagePicker();
  XFile? _panelImage;
  XFile? _productImage;
  ExecutionContextBLContract? _execContextBL;
  ExecutionContextDTO? _execContext;
  var _masterDataBl;
  MenuPanelsDto? _modifiedMenuPanelsDto;
  List<ProductMenuPanelContentDto> _productMenuPanelContentDtoList = [];
  late SemnoxTheme _theme;

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return IntrinsicHeight(
      child: BlocConsumer<EditPanelsCubit, EditPanelsState>(
          listener: (context, state) {},
          builder: (context, panelsState) {
            return Padding(
              padding:  EdgeInsets.fromLTRB(SizeConfig.getSize(8), 0, 0, 0),
              child: Column(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: SizeConfig.screenWidth,
                      height: SizeConfig.screenHeight,
                      child: Scroller(
                          controller: _verticalScrollController,
                          child: panelsState.isButtonTappedMode
                              ? _onButtonTappedModeList(panelsState)
                              : _gridViewModeList(panelsState)),
                    ),
                  ),
                   SizedBox(
                    height: SizeConfig.getSize(8),
                  ),
                ],
              ),
            );
          }),
    );
  }

  Widget _gridViewModeList(
    EditPanelsState editPanelsState,
  ) {
    return Padding(
      padding: const EdgeInsets.only(right: 28.0),
      child: ListView(
        controller: _verticalScrollController,
        children: [
           SizedBox(
            height: SizeConfig.getSize(8),
          ),
          Text(
            MessagesProvider.get("Name"),
            style: _theme.heading5!.copyWith(fontSize:SizeConfig.getFontSize(18)),
          ),
           SizedBox(
            height: SizeConfig.getSize(8),
          ),
          SizedBox(
            height: SizeConfig.getSize(42),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              style:  _theme.subtitle1!.copyWith(fontSize:SizeConfig.getFontSize(18)),
              autofocus: false,
              controller: editPanelsState.nameTextController,
              decoration: AppDecorations.textFieldInputDecoration
                  .copyWith(hintText: MessagesProvider.get('Enter Text'), filled: true,
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
           SizedBox(
            height:  SizeConfig.getSize(16),
          ),
          Text(
            MessagesProvider.get("Rows"),
            style: _theme.heading5!.copyWith(fontSize:SizeConfig.getFontSize(18)),
          ),
           SizedBox(
            height:  SizeConfig.getSize(8),
          ),
          InkWell(
            onTap: () {
              showDialog(
                  barrierDismissible: true,
                  context: context,
                  barrierColor: _theme.transparentColor,
                  builder: (BuildContext newContext) {
                    return NumberPad(
                      initialOffset: Offset(SizeConfig.screenWidth / 2,
                          SizeConfig.screenHeight / 10),
                      isInitialRequired: true,
                      initialIntValue: 0,
                      // double.tryParse(controller.text.toString()) ?? 0.0,
                      title: '',
                      onOkPressed: (intValue) {
                        context
                            .read<EditPanelsCubit>()
                            .updateRowsTextFieldState(intValue);
                      },
                    );
                  });
            },
            child: Container(
              height:  SizeConfig.getSize(42),
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                  borderRadius:  BorderRadius.all(Radius.circular( SizeConfig.getSize(8))),
                  border: Border.all(color: _theme.dialogFooterInnerShadow!)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      context.read<EditPanelsCubit>().decrementRowsCount();
                    },
                    child: Padding(
                      padding:  EdgeInsets.only(left:  SizeConfig.getSize(4)),
                      child: Container(
                        width:  SizeConfig.getSize(32),
                        height:  SizeConfig.getSize(32),
                        decoration: BoxDecoration(
                            color: _theme.dialogFooterInnerShadow!,
                            borderRadius: BorderRadius.circular( SizeConfig.getSize(8))),
                        child:  Center(
                          child: Icon(Icons.remove,size:  SizeConfig.getSize(30),color: _theme.secondaryColor,),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    editPanelsState.rowsCount.toString(),
                    style:  _theme.subtitle1!.copyWith(fontSize:SizeConfig.getFontSize(18))!,
                  ),
                  InkWell(
                    onTap: () {
                      context.read<EditPanelsCubit>().incrementRowsCount();
                    },
                    child: Padding(
                      padding:  EdgeInsets.only(right:  SizeConfig.getSize(4)),
                      child: Container(
                        width:  SizeConfig.getSize(32),
                        height:  SizeConfig.getSize(32),
                        decoration: BoxDecoration(
                            color: _theme.dialogFooterInnerShadow!,
                            borderRadius: BorderRadius.circular( SizeConfig.getSize(8))),
                        child:  Center(
                          child: Icon(Icons.add, size:  SizeConfig.getSize(30),color: _theme.secondaryColor,),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
           SizedBox(
            height: SizeConfig.getSize(16),
          ),
          Text(
            MessagesProvider.get("Columns"),
            style: _theme.heading5!.copyWith(fontSize:SizeConfig.getFontSize(18)),
          ),
           SizedBox(
            height: SizeConfig.getSize(8),
          ),
          InkWell(
            onTap: () {
              showDialog(
                  barrierDismissible: true,
                  context: context,
                  barrierColor: const Color(0x01000000),
                  builder: (BuildContext newContext) {
                    return NumberPad(
                      initialOffset: Offset(SizeConfig.screenWidth / 2,
                          SizeConfig.screenHeight / 10),
                      isInitialRequired: true,
                      initialIntValue: 0,
                      // double.tryParse(controller.text.toString()) ?? 0.0,
                      title: '',
                      onOkPressed: (intValue) {
                        context
                            .read<EditPanelsCubit>()
                            .updateColumnsTextFieldState(intValue);
                      },
                    );
                  });
            },
            child: Container(
              height: SizeConfig.getSize(42),
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                  borderRadius:  BorderRadius.all(Radius.circular(SizeConfig.getSize(8))),
                  border: Border.all(color: _theme.dialogFooterInnerShadow!)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      context.read<EditPanelsCubit>().decrementColumnsCount();
                    },
                    child: Padding(
                      padding:  EdgeInsets.only(left: SizeConfig.getSize(4)),
                      child: Container(
                        width: SizeConfig.getSize(32),
                        height: SizeConfig.getSize(32),
                        decoration: BoxDecoration(
                            color: _theme.dialogFooterInnerShadow!,
                            borderRadius: BorderRadius.circular(SizeConfig.getSize(8))),
                        child:  Center(
                          child: Icon(Icons.remove,size:  SizeConfig.getSize(30),color: _theme.secondaryColor,),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    editPanelsState.columnsCount.toString(),
                    style:  _theme.subtitle1!.copyWith(fontSize:SizeConfig.getFontSize(18))!,
                  ),
                  InkWell(
                    onTap: () {
                      context.read<EditPanelsCubit>().incrementColumnsCount();
                    },
                    child: Padding(
                      padding:  EdgeInsets.only(right: SizeConfig.getSize(4)),
                      child: Container(
                        width: SizeConfig.getSize(32),
                        height: SizeConfig.getSize(32),
                        decoration: BoxDecoration(
                            color: _theme.dialogFooterInnerShadow!,
                            borderRadius: BorderRadius.circular(SizeConfig.getSize(8))),
                        child:  Center(
                          child: Icon(Icons.add,size:  SizeConfig.getSize(30),color: _theme.secondaryColor,),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
           SizedBox(
            height: SizeConfig.getSize(16),
          ),
          Text(
            MessagesProvider.get("Display Order"),
            style: _theme.heading5!.copyWith(fontSize:SizeConfig.getFontSize(18)),
          ),
           SizedBox(
            height: SizeConfig.getSize(8),
          ),
          InkWell(
            onTap: () {
              showDialog(
                  barrierDismissible: true,
                  context: context,
                  barrierColor: const Color(0x01000000),
                  builder: (BuildContext newContext) {
                    return NumberPad(
                      initialOffset: Offset(SizeConfig.screenWidth / 2,
                          SizeConfig.screenHeight / 10),
                      isInitialRequired: true,
                      initialIntValue: 0,
                      isZeroRequired: true,
                      // double.tryParse(controller.text.toString()) ?? 0.0,
                      title: '',
                      onOkPressed: (intValue) {
                        context
                            .read<EditPanelsCubit>()
                            .updateDisplayOrderTextFieldState(intValue);
                      },
                    );
                  });
            },
            child: Container(
              height: SizeConfig.getSize(42),
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                  borderRadius:  BorderRadius.all(Radius.circular(SizeConfig.getSize(8))),
                  border: Border.all(color: _theme.dialogFooterInnerShadow!)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    editPanelsState.displayOrder.toString(),
                    style:  _theme.subtitle1!.copyWith(fontSize:SizeConfig.getFontSize(18))!,
                  ),
                ],
              ),
            ),
          ),
           SizedBox(
            height: SizeConfig.getSize(16),
          ),
          Text(
            MessagesProvider.get("Cell Margin Left"),
            style: _theme.heading5!.copyWith(fontSize:SizeConfig.getFontSize(18)),
          ),
           SizedBox(
            height: SizeConfig.getSize(8),
          ),
          InkWell(
            onTap: () {
              showDialog(
                  barrierDismissible: true,
                  context: context,
                  barrierColor: const Color(0x01000000),
                  builder: (BuildContext newContext) {
                    return NumberPad(
                      initialOffset: Offset(SizeConfig.screenWidth / 2,
                          SizeConfig.screenHeight / 10),
                      isInitialRequired: true,
                      initialIntValue: 0,
                      isZeroRequired: true,
                      // double.tryParse(controller.text.toString()) ?? 0.0,
                      title: '',
                      onOkPressed: (intValue) {
                        context
                            .read<EditPanelsCubit>()
                            .updateCellMarginLeftTextFieldState(intValue);
                      },
                    );
                  });
            },
            child: Container(
              height: SizeConfig.getSize(42),
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                  borderRadius:  BorderRadius.all(Radius.circular(SizeConfig.getSize(8))),
                  border: Border.all(color: _theme.dialogFooterInnerShadow!)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      context
                          .read<EditPanelsCubit>()
                          .decrementCellMarginLeftCount();
                    },
                    child: Padding(
                      padding:  EdgeInsets.only(left: SizeConfig.getSize(4)),
                      child: Container(
                        width: SizeConfig.getSize(32),
                        height: SizeConfig.getSize(32),
                        decoration: BoxDecoration(
                            color: _theme.dialogFooterInnerShadow!,
                            borderRadius: BorderRadius.circular(SizeConfig.getSize(8))),
                        child:  Center(
                          child: Icon(Icons.remove,size:  SizeConfig.getSize(30),color: _theme.secondaryColor,),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    editPanelsState.cellMarginLeft.toString(),
                    style:  _theme.subtitle1!.copyWith(fontSize:SizeConfig.getFontSize(18))!,
                  ),
                  InkWell(
                    onTap: () {
                      context
                          .read<EditPanelsCubit>()
                          .incrementCellMarginLeftCount();
                    },
                    child: Padding(
                      padding:  EdgeInsets.only(right: SizeConfig.getSize(4)),
                      child: Container(
                        width: SizeConfig.getSize(32),
                        height: SizeConfig.getSize(32),
                        decoration: BoxDecoration(
                            color: _theme.dialogFooterInnerShadow!,
                            borderRadius: BorderRadius.circular(SizeConfig.getSize(8))),
                        child:  Center(
                          child: Icon(Icons.add,size:  SizeConfig.getSize(30),color: _theme.secondaryColor,),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
           SizedBox(
            height: SizeConfig.getSize(16),
          ),
          Text(
            MessagesProvider.get("Cell Margin Right"),
            style: _theme.heading5!.copyWith(fontSize:SizeConfig.getFontSize(18)),
          ),
           SizedBox(
            height: SizeConfig.getSize(8),
          ),
          InkWell(
            onTap: () {
              showDialog(
                  barrierDismissible: true,
                  context: context,
                  barrierColor: const Color(0x01000000),
                  builder: (BuildContext newContext) {
                    return NumberPad(
                      initialOffset: Offset(SizeConfig.screenWidth / 2,
                          SizeConfig.screenHeight / 10),
                      isInitialRequired: true,
                      initialIntValue: 0,
                      isZeroRequired: true,
                      // double.tryParse(controller.text.toString()) ?? 0.0,
                      title: '',
                      onOkPressed: (intValue) {
                        context
                            .read<EditPanelsCubit>()
                            .updateCellMarginRightTextFieldState(intValue);
                      },
                    );
                  });
            },
            child: Container(
              height: SizeConfig.getSize(42),
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                  borderRadius:  BorderRadius.all(Radius.circular(SizeConfig.getSize(8))),
                  border: Border.all(color: _theme.dialogFooterInnerShadow!)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      context
                          .read<EditPanelsCubit>()
                          .decrementCellMarginRightCount();
                    },
                    child: Padding(
                      padding:  EdgeInsets.only(left: SizeConfig.getSize(4)),
                      child: Container(
                        width: SizeConfig.getSize(32),
                        height: SizeConfig.getSize(32),
                        decoration: BoxDecoration(
                            color: _theme.dialogFooterInnerShadow!,
                            borderRadius: BorderRadius.circular(SizeConfig.getSize(8))),
                        child:  Center(
                          child: Icon(Icons.remove, size:  SizeConfig.getSize(30),color: _theme.secondaryColor,),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    editPanelsState.cellMarginRight.toString(),
                    style:  _theme.subtitle1!.copyWith(fontSize:SizeConfig.getFontSize(18))!,
                  ),
                  InkWell(
                    onTap: () {
                      context
                          .read<EditPanelsCubit>()
                          .incrementCellMarginRightCount();
                    },
                    child: Padding(
                      padding:  EdgeInsets.only(right: SizeConfig.getSize(4)),
                      child: Container(
                        width: SizeConfig.getSize(32),
                        height: SizeConfig.getSize(32),
                        decoration: BoxDecoration(
                            color: _theme.dialogFooterInnerShadow!,
                            borderRadius: BorderRadius.circular(SizeConfig.getSize(8))),
                        child:  Center(
                          child: Icon(Icons.add ,size:  SizeConfig.getSize(30),color: _theme.secondaryColor,),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
           SizedBox(
            height: SizeConfig.getSize(16),
          ),
          Text(
            MessagesProvider.get("Cell Margin Top"),
            style: _theme.heading5!.copyWith(fontSize:SizeConfig.getFontSize(18)),
          ),
           SizedBox(
            height: SizeConfig.getSize(8),
          ),
          InkWell(
            onTap: () {
              showDialog(
                  barrierDismissible: true,
                  context: context,
                  barrierColor: const Color(0x01000000),
                  builder: (BuildContext newContext) {
                    return NumberPad(
                      initialOffset: Offset(SizeConfig.screenWidth / 2,
                          SizeConfig.screenHeight / 10),
                      isInitialRequired: true,
                      initialIntValue: 0,
                      isZeroRequired: true,
                      // double.tryParse(controller.text.toString()) ?? 0.0,
                      title: '',
                      onOkPressed: (intValue) {
                        context
                            .read<EditPanelsCubit>()
                            .updateCellMarginTopTextFieldState(intValue);
                      },
                    );
                  });
            },
            child: Container(
              height: SizeConfig.getSize(42),
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                  borderRadius:  BorderRadius.all(Radius.circular(SizeConfig.getSize(8))),
                  border: Border.all(color: _theme.dialogFooterInnerShadow!)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      context
                          .read<EditPanelsCubit>()
                          .decrementCellMarginTopCount();
                    },
                    child: Padding(
                      padding:  EdgeInsets.only(left: SizeConfig.getSize(4)),
                      child: Container(
                        width: SizeConfig.getSize(32),
                        height: SizeConfig.getSize(32),
                        decoration: BoxDecoration(
                            color: _theme.dialogFooterInnerShadow!,
                            borderRadius: BorderRadius.circular(SizeConfig.getSize(8))),
                        child:  Center(
                          child: Icon(Icons.remove ,size:  SizeConfig.getSize(30),color: _theme.secondaryColor,),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    editPanelsState.cellMarginTop.toString(),
                    style:  _theme.subtitle1!.copyWith(fontSize:SizeConfig.getFontSize(18))!,
                  ),
                  InkWell(
                    onTap: () {
                      context
                          .read<EditPanelsCubit>()
                          .incrementCellMarginTopCount();
                    },
                    child: Padding(
                      padding:  EdgeInsets.only(right: SizeConfig.getSize(4)),
                      child: Container(
                        width: SizeConfig.getSize(32),
                        height: SizeConfig.getSize(32),
                        decoration: BoxDecoration(
                            color: _theme.dialogFooterInnerShadow!,
                            borderRadius: BorderRadius.circular(SizeConfig.getSize(8))),
                        child:  Center(
                          child: Icon(Icons.add,size:  SizeConfig.getSize(30),color: _theme.secondaryColor,),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
           SizedBox(
            height: SizeConfig.getSize(16),
          ),
          Text(
            MessagesProvider.get("Cell Margin Bottom"),
            style: _theme.heading5!.copyWith(fontSize:SizeConfig.getFontSize(18)),
          ),
           SizedBox(
            height: SizeConfig.getSize(8),
          ),
          InkWell(
            onTap: () {
              showDialog(
                  barrierDismissible: true,
                  context: context,
                  barrierColor: const Color(0x01000000),
                  builder: (BuildContext newContext) {
                    return NumberPad(
                      initialOffset: Offset(SizeConfig.screenWidth / 2,
                          SizeConfig.screenHeight / 10),
                      isInitialRequired: true,
                      initialIntValue: 0,
                      isZeroRequired: true,
                      // double.tryParse(controller.text.toString()) ?? 0.0,
                      title: '',
                      onOkPressed: (intValue) {
                        context
                            .read<EditPanelsCubit>()
                            .updateCellMarginBottomTextFieldState(intValue);
                      },
                    );
                  });
            },
            child: Container(
              height: SizeConfig.getSize(40),
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                  borderRadius:  BorderRadius.all(Radius.circular(SizeConfig.getSize(8))),
                  border: Border.all(color: _theme.dialogFooterInnerShadow!)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      context
                          .read<EditPanelsCubit>()
                          .decrementCellMarginBottomCount();
                    },
                    child: Padding(
                      padding:  EdgeInsets.only(left: SizeConfig.getSize(4)),
                      child: Container(
                        width: SizeConfig.getSize(32),
                        height: SizeConfig.getSize(32),
                        decoration: BoxDecoration(
                            color: _theme.dialogFooterInnerShadow!,
                            borderRadius: BorderRadius.circular(SizeConfig.getSize(8))),
                        child:  Center(
                          child: Icon(Icons.remove,size:  SizeConfig.getSize(30),color: _theme.secondaryColor,),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    editPanelsState.cellMarginBottom.toString(),
                    style:  _theme.subtitle1!.copyWith(fontSize:SizeConfig.getFontSize(18))!,
                  ),
                  InkWell(
                    onTap: () {
                      context
                          .read<EditPanelsCubit>()
                          .incrementCellMarginBottomCount();
                    },
                    child: Padding(
                      padding:  EdgeInsets.only(right: SizeConfig.getSize(4)),
                      child: Container(
                        width: SizeConfig.getSize(32),
                        height: SizeConfig.getSize(32),
                        decoration: BoxDecoration(
                            color: _theme.dialogFooterInnerShadow!,
                            borderRadius: BorderRadius.circular(SizeConfig.getSize(8))),
                        child:  Center(
                          child: Icon(Icons.add,size:  SizeConfig.getSize(30),color: _theme.secondaryColor,),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
           SizedBox(
            height: SizeConfig.getSize(16),
          ),

          Row(
            children: [
              Expanded(
                child: Padding(
                  padding:  EdgeInsets.all(SizeConfig.getSize(4)),
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height * .2,
                      child: editPanelsState.panelImage != null
                          ? Image.file(
                              File(editPanelsState.panelImage?.path ?? ''),
                              fit: BoxFit.contain,
                            )
                          : (editPanelsState.menuPanelsDto?.imageURL ?? '')
                                  .isNotEmpty
                              ? _getImage(
                                  editPanelsState.menuPanelsDto?.imageURL ?? '')
                              : const SizedBox()),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Column(
                  children: [
                    PrimaryDarkButton(
                      onPressed: () async {
                        try {
                          // Pick an image
                          _panelImage = await _picker.pickImage(
                              source: ImageSource.gallery);
                          _execContextBL =
                              await ExecutionContextBuilder.build();
                          _execContext = _execContextBL!.getExecutionContext();
                          _masterDataBl =
                              await MasterDataBuilder.build(
                                  _execContext!);
                          final uploadimg = await _masterDataBl.uploadImage(
                            binaryImage:
                                File(_panelImage?.path ?? '').readAsBytesSync(),
                            fileName:
                                '${editPanelsState.menuPanelsDto?.name ?? ' '}${editPanelsState.menuPanelsDto?.guid}.png',
                          );
                          context.read<EditPanelsCubit>().onPanelImageSelect(
                              panelImage: _panelImage!,
                              fileName:
                                  '${editPanelsState.menuPanelsDto?.name ?? ' '}${editPanelsState.menuPanelsDto?.guid}.png');
                          // ...
                        } catch (er) {}
                      },
                      title: MessagesProvider.get('Browse'),
                    ),
                     SizedBox(
                      height: SizeConfig.getSize(16),
                    ),
                    PrimaryLightButton(
                      onPressed: () {
                        context.read<EditPanelsCubit>().onPanelImageClear();
                      },
                      title: MessagesProvider.get('Clear'),
                    ),
                  ],
                ),
              ),
            ],
          ),

           SizedBox(
            height: SizeConfig.getSize(16),
          ),
          Text(
            '${MessagesProvider.get('Active')}?',
            style: _theme.heading5!.copyWith(fontSize:SizeConfig.getFontSize(18)),
          ),
           SizedBox(
            height: SizeConfig.getSize(8),
          ),
          SizedBox(
            width: SizeConfig.getSize(34),
            height: SizeConfig.getSize(34),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      context.read<EditPanelsCubit>().onClickActive();
                    },
                    child: Container(
                      width: SizeConfig.getSize(34),
                      height: SizeConfig.getSize(34),
                      decoration: BoxDecoration(
                          borderRadius:
                               BorderRadius.all(Radius.circular(SizeConfig.getSize(8))),
                          border: Border.all(color:_theme.secondaryColor!)),
                      child: Center(
                        child:
                            (editPanelsState.modifiedMenuPanelsDto?.isActive ??
                                    false)
                                ? Icon(
                                    Icons.check,
                                    size: SizeConfig.getSize(30),
                                    color: _theme.secondaryColor!,
                                  )
                                : const SizedBox(),
                      ),
                    ),
                  ),
                  Expanded(child: Container())
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _getImage(imgUrl) {
    try {
      return FutureBuilder(
        future: _getImgData(imgUrl),
        builder: (BuildContext context, AsyncSnapshot<Uint8List> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data!.isNotEmpty) {
              return Image.memory(snapshot.data!);
            } else {
              return const SizedBox();
            }

          } else {
            return const SizedBox();
          }
        },
      );
    } catch (err) {
      return const SizedBox();
    }
  }

  Future<Uint8List> _getImgData(imgUrl) async {
    _execContextBL = await ExecutionContextBuilder.build();
    _execContext = _execContextBL!.getExecutionContext();
    _masterDataBl = await MasterDataBuilder.build(_execContext!);
    Uint8List imageData = await _masterDataBl.getImageData(fileName: imgUrl);
    return imageData;
  }

  Widget _onButtonTappedModeList(EditPanelsState editPanelsState) {
    return Padding(
      padding:  EdgeInsets.only(top:SizeConfig.getSize(4),left:SizeConfig.getSize(4),right:28,bottom:SizeConfig.getSize(4)),
      child: ListView(
        controller: _verticalScrollController,
        children: [
          SizedBox(height:          SizeConfig.getSize(10)
          ),
          Container(
            height:SizeConfig.getSize(80),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: _theme.secondaryColor!.withOpacity(0.3),
                    spreadRadius: 0.1,
                    blurRadius: .1,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                color: _theme.button1BG1),
            child: DropdownButtonFormField<String>(
              value: editPanelsState.selectedDropDownButtonSize,
              icon: const Icon(Icons.arrow_drop_down),
              iconSize: SizeConfig.getSize(25),
              elevation: 8,
              style: _theme.heading5!.copyWith(fontSize:SizeConfig.getFontSize(18)),
              hint: Text(MessagesProvider.get('Button Type')),
              decoration: InputDecoration(
                isDense: true,
                label: Padding(
                  padding:  EdgeInsets.only(left: SizeConfig.getSize(8)),
                  child: Text(MessagesProvider.get('Button Type')),
                ),
                labelStyle: _theme.heading5!.copyWith(fontSize:SizeConfig.getFontSize(18)),
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
              onChanged: (String? newValue) {
                // _buttonDropdownValue = newValue ?? 'Half';
                context
                    .read<EditPanelsCubit>()
                    .onSelectButtonType(buttonString: newValue ?? 'Half');
              },
              items: _buttonsDropDownList
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding:  EdgeInsets.only(left: SizeConfig.getSize(8)),
                    child: Text(value, style:_theme.title1!.copyWith(fontSize:SizeConfig.getSize(16))),
                  ),
                );
              }).toList(),
            ),
          ),
           SizedBox(
            height: SizeConfig.getSize(16),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding:  EdgeInsets.all(SizeConfig.getSize(4)),
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height * .2,
                      child: editPanelsState.productImage != null
                          ? Image.file(
                              File(editPanelsState.productImage?.path ?? ''),
                              fit: BoxFit.contain,
                            )
                          : (getProductImgUrl(
                                          menuPanelDto: editPanelsState
                                              .modifiedMenuPanelsDto!,
                                          state: editPanelsState) ??
                                      '')
                                  .isNotEmpty
                              ? _getImage(getProductImgUrl(
                                      menuPanelDto: editPanelsState
                                          .modifiedMenuPanelsDto!,
                                      state: editPanelsState) ??
                                  '')
                              : const SizedBox()),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Column(
                  children: [
                    PrimaryDarkButton(
                      onPressed: () async {
                        try {
                          // Pick an image
                          _productImage = await _picker.pickImage(
                              source: ImageSource.gallery);

                          context.read<EditPanelsCubit>().onProductImageSelect(
                                productImage: _productImage!,
                              );

                          // ...
                        } catch (er) {}
                      },
                      title: MessagesProvider.get('Browse'),
                    ),
                     SizedBox(
                      height: SizeConfig.getSize(16),
                    ),
                    PrimaryLightButton(
                      onPressed: () {
                        context.read<EditPanelsCubit>().onProductImageClear();
                      },
                      title: MessagesProvider.get('Clear'),
                    ),
                  ],
                ),
              ),
            ],
          ),
           SizedBox(
            height: SizeConfig.getSize(16),
          ),
          Text(
            MessagesProvider.get("Back Color"),
            style: _theme.heading5!.copyWith(fontSize:SizeConfig.getFontSize(18)),
          ),
           SizedBox(
            height: SizeConfig.getSize(8),
          ),
          InkWell(
            onTap: () {
              showDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (BuildContext newContext) {
                    return CustomColorPicker(onConfirm: (color) {
                      context.read<EditPanelsCubit>().onUpdateBackColor(color);
                    });
                  });
            },
            child: Container(
              height: SizeConfig.getSize(42),
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                  borderRadius:  BorderRadius.all(Radius.circular(SizeConfig.getSize(8))),
                  border: Border.all(color: _theme.dialogFooterInnerShadow!)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(left: SizeConfig.getSize(4)),
                        child: Container(
                          width: SizeConfig.getSize(32),
                          height: SizeConfig.getSize(32),
                          decoration: BoxDecoration(
                              color: editPanelsState.backColor != null
                                  ? Color.fromRGBO(
                                          getRGB(editPanelsState.backColor ??
                                              '0,0,0')[0],
                                          getRGB(editPanelsState.backColor ??
                                              '0,0,0')[1],
                                          getRGB(editPanelsState.backColor ??
                                              '0,0,0')[2],
                                          1) ??
                                      KColor.primaryBlack
                                  : _theme.secondaryColor,
                              borderRadius: BorderRadius.circular(SizeConfig.getSize(8))),
                        ),
                      ),
                       SizedBox(
                        width: SizeConfig.getSize(10),
                      ),
                      Text(
                        editPanelsState.backColor != null &&
                                (editPanelsState.backColor ?? '').isNotEmpty
                            ? editPanelsState.backColor ??
                            MessagesProvider.get('Pick Color')
                            : MessagesProvider.get('Pick Color'),
                        style: _theme.subtitle2!.copyWith(fontSize: SizeConfig.getSize(18)),
                      ),
                    ],
                  ),
                  Padding(
                    padding:  EdgeInsets.only(right: SizeConfig.getSize(4)),
                    child: Container(
                      width: SizeConfig.getSize(32),
                      height: SizeConfig.getSize(32),
                      decoration: BoxDecoration(
                          color: _theme.secondaryColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Image.asset(
                          "assets/ic_pick_color.png",
                          height: SizeConfig.getSize(25),
                          width: SizeConfig.getSize(25),
                          color: _theme.primaryColor
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
           SizedBox(
            height: SizeConfig.getSize(16),
          ),
          Text(
            MessagesProvider.get("Text Color"),
            style: _theme.heading5!.copyWith(fontSize:SizeConfig.getFontSize(18)),
          ),
           SizedBox(
            height: SizeConfig.getSize(8),
          ),
          InkWell(
            onTap: () {
              showDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (BuildContext newContext) {
                    return CustomColorPicker(onConfirm: (color) {
                      context.read<EditPanelsCubit>().onUpdateTextColor(color);
                    });
                  });
            },
            child: Container(
              height: SizeConfig.getSize(42),
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                  borderRadius:  BorderRadius.all(Radius.circular(SizeConfig.getSize(8))),
                  border: Border.all(color: _theme.dialogFooterInnerShadow!)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(left: SizeConfig.getSize(4)),
                        child: Container(
                          width: SizeConfig.getSize(32),
                          height: SizeConfig.getSize(32),
                          decoration: BoxDecoration(
                              color: editPanelsState.textColor != null
                                  ? Color.fromRGBO(
                                          getRGB(editPanelsState.textColor ??
                                              '0,0,0')[0],
                                          getRGB(editPanelsState.textColor ??
                                              '0,0,0')[1],
                                          getRGB(editPanelsState.textColor ??
                                              '0,0,0')[2],
                                          1) ??
                                      KColor.primaryBlack
                                  :  _theme.secondaryColor,
                              borderRadius: BorderRadius.circular(SizeConfig.getSize(8))),
                        ),
                      ),
                       SizedBox(
                        width: SizeConfig.getSize(10),
                      ),
                      Text(
                        editPanelsState.textColor != null &&
                                (editPanelsState.textColor ?? '').isNotEmpty
                            ? editPanelsState.textColor ??
                            MessagesProvider.get('Pick Color')
                            : MessagesProvider.get('Pick Color'),
                        style: _theme.subtitle2!.copyWith(fontSize: SizeConfig.getSize(18)),
                      ),
                    ],
                  ),
                  Padding(
                    padding:  EdgeInsets.only(right:  SizeConfig.getSize(4)),
                    child: Container(
                      width:  SizeConfig.getSize(32),
                      height:  SizeConfig.getSize(32),
                      decoration: BoxDecoration(
                          color: _theme.secondaryColor,
                          borderRadius: BorderRadius.circular( SizeConfig.getSize(8))),
                      child: Center(
                        child: Image.asset(
                          "assets/ic_pick_color.png",
                          height:  SizeConfig.getSize(25),
                          width:  SizeConfig.getSize(25),
                          color:  _theme.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
           SizedBox(
            height:  SizeConfig.getSize(16),
          ),
          Text(
            MessagesProvider.get("Font"),
            style: _theme.heading5!.copyWith(fontSize:SizeConfig.getFontSize(18)),
          ),
           SizedBox(
            height:  SizeConfig.getSize(8),
          ),
          InkWell(
            onTap: () {
              showDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (BuildContext newContext) {
                    return SetUpFontDialog(onConfirm: (value) {
                      context
                          .read<EditPanelsCubit>()
                          .onFontDataStringUpdate(value);
                    });
                  });
            },
            child: Container(
              height:  SizeConfig.getSize(42),
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                  borderRadius:  BorderRadius.all(Radius.circular( SizeConfig.getSize(8))),
                  border: Border.all(color: _theme.dialogFooterInnerShadow!)),
              child: Center(
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding:  EdgeInsets.only(right:  SizeConfig.getSize(4), left:  SizeConfig.getSize(4)),
                          child: Text(
                            editPanelsState.fontDataInString ?? '',
                            style:  _theme.subtitle1!.copyWith(fontSize:SizeConfig.getFontSize(18))!,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(right:  SizeConfig.getSize(4)),
                        child: Container(
                          width:  SizeConfig.getSize(32),
                          height:  SizeConfig.getSize(32),
                          decoration: BoxDecoration(
                              color:  _theme.secondaryColor,
                              borderRadius: BorderRadius.circular( SizeConfig.getSize(7))),
                          child: Center(
                            child: Text(
                              "Aa|",
                              style:_theme.headingLight3!.copyWith(fontSize:SizeConfig.getFontSize(22)),

                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String? getProductImgUrl(
      {required MenuPanelsDto menuPanelDto, required EditPanelsState state}) {
    _modifiedMenuPanelsDto = state.modifiedMenuPanelsDto;
    _productMenuPanelContentDtoList =
        (_modifiedMenuPanelsDto?.productMenuPanelContentDTOList ?? [])
            .toList(growable: true);
    int indexOfSelected = _productMenuPanelContentDtoList.indexWhere(
        (element) =>
            element.rowIndex == state.selectedRowIndex &&
            element.columnIndex == state.selectedColumnIndex);
    if (indexOfSelected != -1) {
      return _productMenuPanelContentDtoList[indexOfSelected].imageURL;
    } else {
      return '';
    }
  }

  List<int> getRGB(String? color) {
    try {
      if (color != null || (color ?? '').isNotEmpty) {
        return [
          int.parse(color?.split(",")[0] ?? "0"),
          int.parse(color?.split(",")[1] ?? "0"),
          int.parse(color?.split(",")[2] ?? "0")
        ];
      } else {
        return [0, 0, 0];
      }
    } catch (err) {
      return [0, 0, 0];
    }
  }
}
