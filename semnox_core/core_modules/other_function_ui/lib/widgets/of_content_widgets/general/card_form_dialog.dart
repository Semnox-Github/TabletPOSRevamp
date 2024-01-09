import 'package:flutter/material.dart';
import 'package:other_function_ui/bloc/other_function_bloc.dart';
import 'package:other_function_ui/widgets/of_content_widgets/general/card_details_form.dart';

class CardFormDialog extends StatefulWidget {
  final bool? isAddMultiple;
  final OtherFunctionBloc otherFunctionBloc;
  final GlobalKey<FormState> formKey;
  final bool isNfcAvailable;
  const CardFormDialog(
      {super.key,
      required this.formKey,
      this.isAddMultiple,
      required this.isNfcAvailable,
      required this.otherFunctionBloc});

  @override
  State<CardFormDialog> createState() => _CardFormDialogState();
}

class _CardFormDialogState extends State<CardFormDialog> {
  final _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Scrollbar(
        radius: const Radius.circular(8),
        thumbVisibility: true,
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: SizedBox(
            width: 300,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.cancel,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
                CardDetailsForm(
                  isAddMultiple: widget.isAddMultiple,
                  isNfcAvailable: widget.isNfcAvailable,
                  formKey: widget.formKey,
                  otherFunctionBloc: widget.otherFunctionBloc,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
