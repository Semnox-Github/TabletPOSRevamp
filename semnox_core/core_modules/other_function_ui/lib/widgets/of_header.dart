import 'package:customer_data/models/account_details/account_details_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messages_data/builder.dart';
import 'package:nfc/nfc.dart';
import 'package:other_function_ui/bloc/other_function_bloc.dart';
import 'package:other_function_ui/screens/widgets/card_details_widget.dart';
import 'package:other_function_ui/widgets/headerWidgets/header_button.dart';
import 'package:other_function_ui/widgets/text_style.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class OfHeader extends StatefulWidget {
  final String header;
  final bool isHeader;
  final bool? isConsolidate;
  final bool? isDeactivate;
  final bool shouldDisplayCardDetails;
  const OfHeader(
      {Key? key,
      required this.header,
      required this.isHeader,
      this.isConsolidate,
        this.isDeactivate,
      this.shouldDisplayCardDetails = true,
      })
      : super(key: key);

  @override
  State<OfHeader> createState() => _OfHeaderState();
}

class _OfHeaderState extends State<OfHeader> {
  AccountDetailsResponse? accounts;
  TextEditingController cardNoController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  ValueNotifier<bool> isApplied = ValueNotifier(false);
  ValueNotifier<bool> isLoading = ValueNotifier(false);
  bool _isNFCAvailable = false;

  @override
  void initState() {
    Future.microtask(() async {
      _isNFCAvailable = await NFCManager().isNfcAvailable();
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Container(
        decoration: BoxDecoration(
            color: theme.backGroundColor,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(6), topLeft: Radius.circular(6))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                height: SizeConfig.getSize(96),
                decoration: BoxDecoration(
                  color: theme.button2InnerShadow1,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(SizeConfig.getSize(8)),
                    bottomRight: Radius.circular(SizeConfig.getSize(8)),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_back_ios,
                        color: Colors.white, size: SizeConfig.getSize(30)),
                    Center(
                      child: Text(
                        widget.header,
                        style: theme.headingLight4?.copyWith(
                            color: Colors.white,
                            fontSize: SizeConfig.getFontSize(22)),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                height: SizeConfig.getSize(96),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                  color: widget.isHeader ? theme.button1BG1 : theme.button1BG1,
                ),
                child: widget.isHeader
                    ? BlocConsumer<OtherFunctionBloc, OtherFunctionState>(
                        listener: (context, state) {
                          final otherFunctionBLoc =
                              context.read<OtherFunctionBloc>();
                          if (state is CardDetailsState) {
                            Navigator.pop(context);
                            otherFunctionBLoc.isApplied = true;
                            otherFunctionBLoc.add(UpdateDisplayValue());
                            otherFunctionBLoc.ticketMode = otherFunctionBLoc
                                        .accounts?.data?.first.realTicketMode ??
                                    false
                                ? 'Real Ticket'
                                : 'E-Ticket';
                          }
                          if (state is ClearState) {
                            context.read<OtherFunctionBloc>().isApplied = false;
                            cardNoController.clear();
                            context.read<OtherFunctionBloc>().tokenCount.value =
                                0;
                          }
                        },
                        builder: (context, state) {
                          OtherFunctionBloc otherFunctionBloc =
                              context.read<OtherFunctionBloc>();
                          if (state is CardDetailsState ||
                              (otherFunctionBloc.isApplied &&
                                  widget.header ==
                                      MessagesProvider.get(
                                          'Hold Entitlements'))) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 4),
                              child: Row(
                                children: [
                                  Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    color: theme.checkboxLight,
                                    child: Column(
                                      children: [
                                        Text(
                                          MessagesProvider.get('Customer Name'),
                                          textAlign: TextAlign.start,
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          otherFunctionBloc.accounts?.data
                                                  ?.first.customerName ??
                                              '',
                                          style: KTextStyle.smallBlackText,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else if ((state is CardDetailsState ||
                              otherFunctionBloc.isApplied) && widget.shouldDisplayCardDetails) {
                            return Container(
                              height: SizeConfig.getSize(96),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: theme.button1BG1,
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: CardDetailsWidget(
                                    accounts: otherFunctionBloc.accounts),
                              ),
                            );
                          }
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 0.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                HeaderButton(
                                  isNfcAvailable: _isNFCAvailable,
                                  formKey: _formKey,
                                  cardController: cardNoController,
                                  otherFunctionBloc: otherFunctionBloc,
                                  isDeactivate: widget.isDeactivate ?? false,
                                ),
                              ],
                            ),
                          );
                        },
                      )
                    : const SizedBox.shrink(),
              ),
            ),
            BlocBuilder<OtherFunctionBloc, OtherFunctionState>(
              builder: (context, state) {
                OtherFunctionBloc otherFunctionBloc =
                    context.read<OtherFunctionBloc>();
                if (state is CardDetailsState || otherFunctionBloc.isApplied) {
                  return Visibility(
                      visible: widget.isConsolidate ?? false,
                      child: const SizedBox(width: 10));
                }
                return const SizedBox.shrink();
              },
            ),
            BlocBuilder<OtherFunctionBloc, OtherFunctionState>(
              builder: (context, state) {
                OtherFunctionBloc otherFunctionBloc =
                    context.read<OtherFunctionBloc>();
                if (state is CardDetailsState || otherFunctionBloc.isApplied) {
                  return Visibility(
                    visible: widget.isConsolidate ?? false,
                     child: InkWell(
                       onTap: () {
                         setState(() {
                           otherFunctionBloc.accounts = null;
                           otherFunctionBloc.isApplied = false;
                         });
                       },
                       child: Align(
                         alignment: Alignment.topRight,
                         child: CircleAvatar(
                           radius: SizeConfig.getSize(22),
                           backgroundColor: theme.button2InnerShadow1!,
                           child: Icon(
                             Icons.close,
                             color: theme.primaryColor,
                             size: SizeConfig.getSize(27),
                           ),
                         ),
                       ),
                     ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            const SizedBox(width: 8,),
          ],
        ),
      ),
    );
  }
}
