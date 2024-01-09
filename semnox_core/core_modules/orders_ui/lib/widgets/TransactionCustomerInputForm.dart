import 'package:customer_ui/providers/SelectedCustomerProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:messages_data/builder.dart';
import 'package:provider/provider.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/number_pad/number_pad.dart';
import 'package:widgets_library/utils/size_config.dart';


ValueNotifier<String> customerName = ValueNotifier('');

class TransactionCustomerInputForm extends StatefulWidget{

  TextEditingController? controller;
  TextInputType? keyboardType;
  String? inputFormatter;
  String title;
  bool? numberPad;

  TransactionCustomerInputForm({
      this.controller, this.keyboardType, this.inputFormatter, required this.title,
  this.numberPad});

  @override
  State<TransactionCustomerInputForm> createState() => _TransactionCustomerInputFormState();
}

class _TransactionCustomerInputFormState extends State<TransactionCustomerInputForm> {
  VoidCallback? onCustomerChange;

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return ValueListenableBuilder(
      valueListenable:  customerName,
       builder: (BuildContext context, String newValue, Widget? child){
        WidgetsBinding.instance.addPostFrameCallback((_) {
            if (Provider.of<SelectedCustomer>(context, listen: false).selectedData != null) {
              widget.controller?.text = newValue;
              context.read<SelectedCustomer>().updateData(null);
            }
          });
          return  Expanded(
            child: Column(
              crossAxisAlignment:  CrossAxisAlignment.start,
              children: [
                Text(widget.title, style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(20)),textAlign: TextAlign.left,overflow: TextOverflow.ellipsis,),
                const SizedBox(height: 4.0,),
                TextFormField(
                  controller: widget.controller,
                  // expands: true,
                  readOnly: (widget.numberPad ?? false ) ? true : false,
                  showCursor: true,
                  onTap: () => (widget.numberPad ?? false ) ?
                  showDialog(
                      barrierDismissible: true,
                      context: context,
                      barrierColor: const Color(0x01000000),
                      builder: (BuildContext context) {
                        return NumberPad(
                          initialOffset: Offset(50,50),
                          title:'',
                          isInitialRequired: true,
                          initialIntValue:  int.parse(widget.controller?.text != '' ? (widget.controller?.text  ?? '0')  : '0'),
                          onOkPressed: ( value) {
                            /*if(value >= totalPage){
                         currentPageController.text = totalPage.toString();
                       }else{
                         currentPageController.text = value.toString();
                       }*/
                            widget.controller?.text = value.toString();
                          },
                        );
                      }) : null,
                  inputFormatters: widget.inputFormatter != null ? [FilteringTextInputFormatter.allow(RegExp(widget.inputFormatter!)),] : null,
                  keyboardType: widget.keyboardType ?? TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: theme.subtitle3?.copyWith(color: theme.secondaryColor, fontWeight: FontWeight.w500,fontSize: SizeConfig.getFontSize(16)),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color:theme.dividerColor!, width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color:theme.dividerColor!, width: 1.0),
                      ),
                      hintText: MessagesProvider.get("Enter"),
                      hintStyle:   theme.subtitle3?.copyWith(color: theme.dividerColor, fontWeight: FontWeight.w500,fontSize: SizeConfig.getFontSize(16)),
                      isDense: true,
                      contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                     /* suffixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: GestureDetector(
                            onTap: () {
                              showDialog(context: context, builder: (_) {
                                return const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                    child: CustomerLookUpScreen());
                              });
                            },
                            child: Image.asset('assets/ic_date.png') *//*Stack(
                              children: [
                                Image.asset('assets/ic_background.png'),
                                Image.asset('assets/ic_search_person.png')
                              ],
                            )*//* ),
                      ),
                      suffixIconConstraints: const BoxConstraints()*/
                  ),
                )
              ],
            ),
          );
      },
    );
  }

  @override
  void dispose() {
    customerName.value = '';
    super.dispose();
  }
}

