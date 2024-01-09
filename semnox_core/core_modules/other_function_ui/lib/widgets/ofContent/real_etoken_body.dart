import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:other_function_ui/bloc/other_function_bloc.dart';
import 'package:other_function_ui/widgets/colors.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class RealeToken extends StatefulWidget {
  const RealeToken({super.key});

  @override
  State<RealeToken> createState() => _RealeTokenState();
}

class _RealeTokenState extends State<RealeToken> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    return BlocConsumer<OtherFunctionBloc, OtherFunctionState>(
      listener: (context, state) {
        if (state is TokenSetMode) {
          if (state.tokenMode == 'Real Ticket') {
            context.read<OtherFunctionBloc>().ticketMode = state.tokenMode;
          } else {
            context.read<OtherFunctionBloc>().ticketMode = state.tokenMode;
          }
        }
      },
      builder: (context, state) {
        final otherFunctionBloc = context.read<OtherFunctionBloc>();
        if (otherFunctionBloc.isApplied) {
          return Center(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.isBigDevice()? 160 : 10),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: SizeConfig.isBigDevice()? MediaQuery.of(context).size.height * 0.2 : MediaQuery.of(context).size.height * 0.36,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: KColor.borderGrey,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'CHANGE TICKET MODE',
                          style: theme.heading5?.copyWith(fontSize: SizeConfig.getFontSize(22)),
                        ),
                      ),
                      Divider(
                        color: KColor.borderGrey,
                      ),
                      Padding(
                        padding: SizeConfig.isBigDevice() ? const EdgeInsets.all(10) : EdgeInsets.zero,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height:SizeConfig.isBigDevice() ? 40 : 30,
                              width: SizeConfig.isBigDevice() ? 160 : 120,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Transform.scale(
                                    scale:SizeConfig.isBigDevice() ? 1 : 0.8,
                                    child: Radio(
                                      value: 'Real Ticket',
                                      groupValue: otherFunctionBloc.ticketMode,
                                      onChanged: (value) {
                                        otherFunctionBloc.add(TokenMode());
                                      },
                                      activeColor: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    'Real Ticket',
                                    style: GoogleFonts.robotoCondensed(
                                      color: theme.secondaryColor,
                                      fontSize: SizeConfig.getFontSize(22),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.isBigDevice() ? 40 : 30,
                              width: SizeConfig.isBigDevice() ? 160 : 120,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Transform.scale(
                                    scale:SizeConfig.isBigDevice() ? 1 : 0.8,
                                    child: Radio(
                                      value: 'E-Ticket',
                                      groupValue: otherFunctionBloc.ticketMode,
                                      onChanged: (value) {
                                        otherFunctionBloc.add(ETokenMode());
                                      },
                                      activeColor: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    'E-Ticket',
                                    style: GoogleFonts.robotoCondensed(
                                      color: theme.secondaryColor,
                                      fontSize: SizeConfig.getFontSize(22),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
