import 'package:attendance_data/model/attendanceForDay/attendance_for_day.dart';
import 'package:attendance_ui/bloc/bloc/attendance_bloc.dart';
import 'package:attendance_ui/utilities/colors.dart';
import 'package:attendance_ui/widgets/action_btns.dart';
import 'package:attendance_ui/widgets/add_tip.dart';
import 'package:attendance_ui/widgets/attendance_drop_down.dart';
import 'package:attendance_ui/widgets/attendance_row.dart';
import 'package:attendance_ui/widgets/attendance_text_field.dart';
import 'package:attendance_ui/widgets/text_field_column.dart';
import 'package:flutter/material.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class AttendanceForm extends StatelessWidget {
  final AttendanceBloc attendanceBloc;
  final String user;
  final TextEditingController tipController;
  final double width;
  final AttendanceForDay data;
  final String action;
  final Function(String) handleCLockIn;
  final List<String> dropDown;
  final VoidCallback onCancelClicked;
  const AttendanceForm(
      {super.key,
      required this.tipController,
      required this.width,
      required this.data,
      required this.handleCLockIn,
      required this.action,
      required this.dropDown,
      required this.onCancelClicked,
      required this.user,
      required this.attendanceBloc});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.getHeight(25)),
                AttendanceRow(
                  firstColumn: TextFieldColumn(
                    header: MessagesProvider.get('User'),
                    widget: AttendanceTextField(
                      width: width,
                      initalValue: user,
                    ),
                  ),
                  secondColumn: TextFieldColumn(
                    header: MessagesProvider.get('Action'),
                    widget: AttendanceTextField(
                      width: width,
                      initalValue: action,
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.getHeight(25)),
                AttendanceRow(
                  firstColumn: TextFieldColumn(
                    header: MessagesProvider.get('Role'),
                    widget: IgnorePointer(
                      ignoring: action != 'Clock In',
                      child: AttendanceDropDown(
                        width: width,
                        dropDown: dropDown,
                      ),
                    ),
                  ),
                  secondColumn: TextFieldColumn(
                    header: MessagesProvider.get('Attendance Hours'),
                    widget: AttendanceTextField(
                      initalValue: attendanceBloc.attendnaceHours,
                      width: width,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(
          thickness: SizeConfig.getSize(1),
          color: theme.dialogFooterInnerShadow,
          height: SizeConfig.getHeight(1),
        ),
        SizedBox(
          height: SizeConfig.getHeight(90),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OfActionBtns(
                    onClick: () {
                      Navigator.of(context).pop();
                      onCancelClicked();
                    },
                    text: MessagesProvider.get("CANCEL"),
                    btnColor: theme.button1BG1!,
                    textColor: theme.primaryOpposite!),
                SizedBox(width: SizeConfig.getWidth(8),),
                OfActionBtns(
                  onClick: action == 'Clock In'
                      ? () => handleCLockIn('Clock In')
                      : () {},
                  text: MessagesProvider.get('CLOCK IN'),
                  btnColor:
                      action == 'Clock In' ? Colors.black : theme.button1BG1!,
                  textColor: action == 'Clock In'
                      ? KColor.primaryBtnColor
                      : theme.dividerColor!,
                ),
                SizedBox(width: SizeConfig.getWidth(8),),
                OfActionBtns(
                  onClick: action == 'Clock Out'
                      ? () {
                          showDialog(
                            context: context,
                            builder: (context) => AddTipPopUp(
                              onTap: () {
                                Navigator.pop(context);
                                handleCLockIn('Clock Out');
                              },
                              tipController: tipController,
                            ),
                          );
                        }
                      : () {},
                  text: MessagesProvider.get('CLOCK OUT'),
                  btnColor: action == 'Clock Out'
                      ? theme.button2InnerShadow1!
                      : theme.button1BG1!,
                  textColor: action == 'Clock Out'
                      ? theme.light1!
                      : theme.dividerColor!,
                ),
                SizedBox(width: SizeConfig.getWidth(8),),
                OfActionBtns(
                  text: MessagesProvider.get('ON BREAK'),
                  onClick: action == 'Clock Out'
                      ? () {
                          handleCLockIn('On Break');
                        }
                      : () {},
                  btnColor: action == 'Clock Out'
                      ? theme.button2InnerShadow1!
                      : theme.button1BG1!,
                  textColor: action == 'Clock Out'
                      ? theme.light1!
                      : theme.dividerColor!,
                ),
                SizedBox(width: SizeConfig.getWidth(8),),
                OfActionBtns(
                  onClick: data.data?.attendanceLogDTOList?.last.status ==
                          'On Break'
                      ? () => handleCLockIn('Back from Break')
                      : () {},
                  text: MessagesProvider.get('BACK FROM BREAK'),
                  btnColor: data.data?.attendanceLogDTOList?.last.status ==
                          'On Break'
                      ? theme.button2InnerShadow1!
                      : theme.button1BG1!,
                  textColor: data.data?.attendanceLogDTOList?.last.status ==
                          'On Break'
                      ? theme.light1!
                      : theme.dividerColor!,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
