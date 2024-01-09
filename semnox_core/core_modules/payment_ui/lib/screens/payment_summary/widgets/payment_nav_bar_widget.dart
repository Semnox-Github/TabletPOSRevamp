import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_data/models/payment_modes_container/payment_mode_container_dto.dart';
import 'package:payment_ui/cubits/payment_summary/payment_screen_cubit.dart';
import 'package:payment_ui/cubits/payment_summary/payment_screen_state.dart';
import 'package:payment_ui/utils/colors.dart';
import 'package:payment_ui/utils/common_widgets.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'package:messages_data/builder.dart';
import 'package:payment_ui/utils/styles.dart';

typedef OnNavItemClicked = Function(PaymentModeContainerDTO);

class PaymentNavBarWidget extends StatefulWidget {
  final OnNavItemClicked onPaymentNavItemClicked;
  final List<PaymentModeContainerDTO>? paymentModes;

  const PaymentNavBarWidget({
    Key? key,
    required this.paymentModes,
    required this.onPaymentNavItemClicked,
  }) : super(key: key);

  @override
  State<PaymentNavBarWidget> createState() => _PaymentNavBarWidgetState();
}

class _PaymentNavBarWidgetState extends State<PaymentNavBarWidget> {

  final searchPayModesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Container(
      color: theme.darkTextColor ?? Colors.black,
      child: BlocBuilder<PaymentScreenCubit, PaymentScreenState>(
        builder: (context, state) => Padding(
          padding: EdgeInsets.only(
              left: SizeConfig.getWidth(16),right: SizeConfig.getWidth(16),bottom: SizeConfig.getWidth(4),
              top: SizeConfig.getHeight(16)),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    padding: const EdgeInsets.only(
                        left: 0, top: 8, right: 8, bottom: 8),
                    constraints: const BoxConstraints(),
                    icon: Image.asset('assets/back_arrow_white.png'),
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                  ),
                  SizedBox(width: SizeConfig.getWidth(4)),
                  Expanded(child: Text(MessagesProvider.get('PAYMENT'), style: theme.headingLight5?.copyWith(fontSize: SizeConfig.getFontSize(26), color: Colors.white) ?? tsS20W700FF, maxLines: 1, overflow: TextOverflow.ellipsis))
                ],
              ),
              SizedBox(height: SizeConfig.getHeight(24)),
              whiteTextField(
                  controller: searchPayModesController,
                  hint: MessagesProvider.get('Find'),
                  textStyle: tsS14W400FF.copyWith(fontSize: SizeConfig.getFontSize(22)),
                  onClear: () {
                    searchPayModesController.text = '';
                    context.read<PaymentScreenCubit>().filterPaymentModes('');
                    FocusManager.instance.primaryFocus?.unfocus();
                    if(context.read<PaymentScreenCubit>().state.selectedPayMode != null) {
                      int pos = 0;
                      pos = context.read<PaymentScreenCubit>().paymentModes.indexOf(context.read<PaymentScreenCubit>().state.selectedPayMode!);
                      context.read<PaymentScreenCubit>().setSelectedPayModeIndex(pos);
                    }
                  },
                  onTextEntered: (text) {
                    context.read<PaymentScreenCubit>().filterPaymentModes(text);
                    if(text.isNotEmpty) {
                      context.read<PaymentScreenCubit>().setSelectedPayModeIndex(-1);
                    } else {
                      int pos = 0;
                      pos = context.read<PaymentScreenCubit>().paymentModes.indexOf(context.read<PaymentScreenCubit>().state.selectedPayMode!);
                      context.read<PaymentScreenCubit>().setSelectedPayModeIndex(pos);
                    }
                  },
                  height: SizeConfig.getHeight(36), borderColor: theme.sideNavListBGSelectedState ?? colorBlack3D),
              SizedBox(height: SizeConfig.getHeight(24)),
              Expanded(
                child: Scrollbar(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget.paymentModes?.length ?? 0,
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return NavigationItem(
                            title: widget.paymentModes![index].paymentMode,
                            isSelected: state.selectedPayModeIndex == index,
                            onTapped: () {
                              context.read<PaymentScreenCubit>().setSelectedPayModeIndex(index);
                              widget.onPaymentNavItemClicked(widget.paymentModes![index]);
                            });
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavigationItem extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTapped;

  const NavigationItem(
      {Key? key,
      required this.title,
      required this.isSelected,
      required this.onTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    return InkWell(
      onTap: () {
        onTapped();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.getWidth(12),
            vertical: SizeConfig.getHeight(8)),
        decoration: BoxDecoration(
            color: isSelected ? (theme.sideNavListBGSelectedState  ?? colorBlack3D) : (theme.darkTextColor ?? colorBlack),
            borderRadius: BorderRadius.circular(8)),
        child: Text(title,
            style: isSelected ? (theme.headingLight5?.copyWith(fontSize: SizeConfig.getFontSize(24), color: Colors.white) ?? tsS14W700FF) : (theme.headingLight5?.copyWith(fontSize: SizeConfig.getFontSize(24), fontWeight: FontWeight.w400, color: Colors.white) ?? tsS14W400FF),
            overflow: TextOverflow.ellipsis,
            maxLines: 1),
      ),
    );
  }
}
