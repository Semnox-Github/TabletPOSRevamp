import 'package:customer_ui/customer_lookup_screen.dart';
import 'package:customer_ui/utils/AppStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:themes_library/themes_library.dart';

class CustomerNamePicker extends StatefulWidget{
  String title;
  String hint;
  TextEditingController controller ;

  CustomerNamePicker(this.title, this.hint,this.controller);

  @override
  State<CustomerNamePicker> createState() => _CustomerNamePickerState();
}

class _CustomerNamePickerState extends State<CustomerNamePicker> {
  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: theme.heading5?.copyWith(
            fontSize: 16.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700
        ),),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: TextFormField(
                controller: widget.controller,
                textAlign: TextAlign.start,
                readOnly: true,
                style: theme.heading5?.copyWith(
                    fontSize: 14.0,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500
                ),
                decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: widget.hint,
                    hintStyle: theme.heading5?.copyWith(
                        fontSize: 14.0,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Container(
                          decoration: BoxDecoration(color: theme.secondaryColor,borderRadius: BorderRadius.circular(2)),
                          child: InkWell(
                            child:Image.asset('assets/customer_search.png',color: theme.primaryColor,) ,
                            onTap: (){
                              showDialog(context: context, builder: (_) {
                                return const Padding(
                                    padding: EdgeInsets.only(left: 16,right:16, top: 12,bottom:60 ),
                                    child: CustomerLookUpScreen(isNameSelect:true, isShowHeader:true));
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    suffixIconConstraints: const BoxConstraints()
                ),
                onTap: ()  {

                },),
            ),
          ],
        ),
        const SizedBox(height: 8.0,),
      ],
    );
  }
}