import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_data/models/payment_modes_container/payment_mode_container_dto.dart';
import 'package:payment_ui/cubits/payment_settlement/settle_screen_cubit.dart';
import 'package:payment_ui/cubits/payment_settlement/settle_screen_state.dart';
import 'package:payment_ui/cubits/payment_summary/payment_screen_cubit.dart';
import 'package:payment_ui/cubits/payment_summary/payment_screen_state.dart';
import 'package:payment_ui/utils/colors.dart';
import 'package:payment_ui/utils/common_widgets.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';
import 'package:messages_data/builder.dart';
import 'package:payment_ui/utils/styles.dart';

class SettlementNavBarWidget extends StatefulWidget {

  final Function(String) onPageSwitched;
  final List<String> settleModes;

  const SettlementNavBarWidget({
    Key? key,
    required this.onPageSwitched,
    required this.settleModes
  }) : super(key: key);

  @override
  State<SettlementNavBarWidget> createState() => _SettlementNavBarWidgetState();
}

class _SettlementNavBarWidgetState extends State<SettlementNavBarWidget> {

  final searchModesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Container(
      color: theme.darkTextColor ?? Colors.black,
      child: BlocBuilder<SettleScreenCubit, SettleScreenState>(
        builder: (context, state) => Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.getWidth(16),
              vertical: SizeConfig.getHeight(16)),
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
                  Expanded(child: Text(MessagesProvider.get('Payment Settlements').toUpperCase(), style: theme.headingLight5?.copyWith(fontSize: SizeConfig.getFontSize(24), color: Colors.white) ?? tsS20W700FF, maxLines: 2, overflow: TextOverflow.ellipsis))
                ],
              ),
              SizedBox(height: SizeConfig.getHeight(24)),
              whiteTextField(
                  controller: searchModesController,
                  hint: MessagesProvider.get('Find'),
                  textStyle: theme.headingLight3?.copyWith(fontSize: SizeConfig.getFontSize(22), color: Colors.white) ?? tsS14W400FF,
                  onClear: () {
                    searchModesController.text = '';
                    context.read<SettleScreenCubit>().filterSettlementModes('');
                    FocusManager.instance.primaryFocus?.unfocus();
                    if(context.read<SettleScreenCubit>().state.selectedSettleMode != null) {
                      int pos = 0;
                      pos = context.read<SettleScreenCubit>().settlementModes.indexOf(context.read<SettleScreenCubit>().state.selectedSettleMode!);
                      context.read<SettleScreenCubit>().setSettleScreenIndex(pos, selectedMode: context.read<SettleScreenCubit>().state.selectedSettleMode!);
                    }
                  },
                  onTextEntered: (text) {
                    context.read<SettleScreenCubit>().filterSettlementModes(text);
                    if(text.isNotEmpty) {
                      context.read<SettleScreenCubit>().setSettleScreenIndex(-1);
                    } else {
                      int pos = 0;
                      pos = context.read<SettleScreenCubit>().settlementModes.indexOf(context.read<SettleScreenCubit>().state.selectedSettleMode!);
                      context.read<SettleScreenCubit>().setSettleScreenIndex(pos, selectedMode: context.read<SettleScreenCubit>().state.selectedSettleMode!);
                    }
                  },
                  height: SizeConfig.getHeight(36), borderColor: theme.sideNavListBGSelectedState ?? colorBlack3D),
              SizedBox(height: SizeConfig.getHeight(24)),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.settleModes.length,
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return NavigationItem(
                          title: widget.settleModes[index],
                          isSelected: state.settleScreenIndex == index,
                          onTapped: () {
                            context.read<SettleScreenCubit>().setSettleScreenIndex(index, selectedMode: widget.settleModes[index]);
                            context.read<SettleScreenCubit>().clearSwitchStatuses();
                            context.read<SettleScreenCubit>().setFilterSectionStatus(true);
                            widget.onPageSwitched(widget.settleModes[index]);
                          });
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _setSettleModes() {
    final list = [];
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
            color: isSelected ? (theme.sideNavListBGSelectedState ?? colorBlack3D) : (theme.darkTextColor ?? colorBlack),
            borderRadius: BorderRadius.circular(8)),
        child: Text(title,
            style: isSelected ? (theme.headingLight5?.copyWith(fontSize: SizeConfig.getFontSize(24), color: Colors.white) ?? tsS14W700FF) :
            (theme.headingLight3?.copyWith(fontSize: SizeConfig.getFontSize(24), color: Colors.white) ?? tsS14W400FF),
            overflow: TextOverflow.ellipsis,
            maxLines: 1),
      ),
    );
  }
}
