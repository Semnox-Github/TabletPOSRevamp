import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_ui/loader_dialog.dart' as loader;
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:other_function_ui/bloc/other_function_bloc.dart';
import 'package:other_function_ui/widgets/of_content_widgets/holdEntitlements/card_details_container.dart';

class TapCardView extends StatefulWidget {
  final NotificationBar notificationBar;
  const TapCardView({super.key, required this.notificationBar});

  @override
  State<TapCardView> createState() => _TapCardViewState();
}

class _TapCardViewState extends State<TapCardView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OtherFunctionBloc, OtherFunctionState>(
      listener: (context, state) {
        OtherFunctionBloc otherFunctionBloc = context.read<OtherFunctionBloc>();
        if (state is DeactivateCardListState) {
          // widget.notificationBar.showMessage(
          //     MessagesProvider.get('Cards Added Successfully'),
          //     KColor.notificationBGLightBlueColor);
          loader.hideLoaderDialog(context);
        } else if (state is SuccessState) {
          loader.hideLoaderDialog(context);
          widget.notificationBar.showMessage("", Colors.white);
        } else if (state is ClearState) {
          otherFunctionBloc.selectedAccounts.clear();
          otherFunctionBloc.deactivatedCardList?.clear();
          otherFunctionBloc.isAdded = false;
          otherFunctionBloc.showChildCards = false;
        }
      },
      builder: (context, state) {
        OtherFunctionBloc otherFunctionBloc = context.read<OtherFunctionBloc>();
        if (state is DeactivateCardListState ||
            otherFunctionBloc.showChildCards) {
          return Scrollbar(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ...otherFunctionBloc.deactivatedCardList!.map(
                    (e) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: CardDetailsContainer(
                        isAdded: otherFunctionBloc.isAdded,
                        itemIndex:
                            otherFunctionBloc.deactivatedCardList?.indexOf(e),
                        isRefund: true,
                        itemLength:
                            otherFunctionBloc.deactivatedCardList?.length,
                        data: e.data?.first,
                        onDelete: () {
                          setState(() {
                            otherFunctionBloc.deactivatedCardList?.removeWhere(
                                (element) =>
                                    element.data?.first.accountId ==
                                    e.data?.first.accountId);
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
