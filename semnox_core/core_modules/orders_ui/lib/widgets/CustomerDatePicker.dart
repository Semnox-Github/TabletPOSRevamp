import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:themes_library/themes_library.dart';


class CustomerDatePicker extends StatefulWidget{
  String title;
  String hint;
  TextEditingController controller ;

  CustomerDatePicker(this.title, this.hint,this.controller);

  @override
  State<CustomerDatePicker> createState() => _CustomerDatePickerState();
}

class _CustomerDatePickerState extends State<CustomerDatePicker> {
  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: theme.heading5,),
        const SizedBox(height: 4.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: TextFormField(
                controller: widget.controller,
                textAlign: TextAlign.start,
                readOnly: true,
                style: theme.subtitle3?.copyWith(fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: widget.hint,
                    hintStyle: theme.subtitle3?.copyWith(fontWeight: FontWeight.w500),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Image.asset('assets/ic_date.png', color: theme.secondaryColor),
                    ),
                    suffixIconConstraints: const BoxConstraints()
                ),
               onTap: () async {

                 widget.controller.clear();

                 var birthDate = widget.controller.text;
                 DateTime? selectedDate;
                 String hour, minute, time;
                 TextEditingController timeController = TextEditingController();
                 TimeOfDay? selectedTime = TimeOfDay(hour: 00, minute: 00);
                 if(birthDate != '') {
                   DateFormat dateFormat = DateFormat('dd-MM-yyyy');
                   selectedDate = dateFormat.parse(birthDate);
                 }
                  DateTime? pickedDate = await showDatePicker(context: context,
                      builder: (BuildContext context, Widget? child) {
                        return Theme(data: ThemeData?.light().copyWith(
                          colorScheme: const ColorScheme.light(
                            primary: Colors.black,
                            onPrimary: Colors.white,
                            surface: Colors.white,
                            onSurface: Colors.black,
                          )
                        ),
                        child: child!);
                      },
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      lastDate: DateTime(2033)).whenComplete(() async {
                    final TimeOfDay? picked = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (picked != null) {
                      setState(() {
                        selectedTime = picked;
                        hour = selectedTime!.hour.toString();
                        minute = selectedTime!.minute.toString();

                        if(int.parse(hour) > 12){
                          time = (int.parse(hour)-12).toString() + ":" + minute + " PM";
                        }else{
                          time = hour + ':' + minute + " AM";
                        }

                        timeController.text = time;
                      });
                    }
                  });

                  if(pickedDate != null){
                    String formattedDate = DateFormat('dd-MMM-yyyy').format(pickedDate);
                    setState(() {
                      widget.controller.text = formattedDate + " " + timeController.text; //set output date to TextField value.
                    });
                  }
                  },),
            ),
          ],
        ),
        const SizedBox(height: 8.0,),
      ],
    );
  }
}