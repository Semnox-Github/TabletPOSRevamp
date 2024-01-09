import 'package:customer_ui/CustomerDetailsPage.dart';
import 'package:customer_ui/CustomerSearchListDialog.dart';
import 'package:customer_ui/providers/SelectedCustomerProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:messages_data/builder.dart';
import 'package:other_function_ui/bloc/other_function_bloc.dart';
import 'package:other_function_ui/widgets/text_style.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                MessagesProvider.get('Search by Customer Name'),
                style: KTextStyle.regularBlackText.copyWith(
                    fontSize: SizeConfig.getFontSize(22),
                    color: theme.primaryOpposite),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: SizeConfig.getSize(60),
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: TextField(
                        autofocus: false,
                        controller: context
                            .read<OtherFunctionBloc>()
                            .customerSearchController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 10),
                          isDense: false,
                          border: const OutlineInputBorder(),
                          hintStyle:
                              TextStyle(fontSize: SizeConfig.getFontSize(22)),
                          hintText: MessagesProvider.get('Customer Name'),
                          suffixIconConstraints:  BoxConstraints(minWidth: SizeConfig.isBigDevice() ?SizeConfig.getSize(70):SizeConfig.getSize(60),maxWidth: SizeConfig.isBigDevice() ?SizeConfig.getSize(70):SizeConfig.getSize(60)),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              if (context
                                  .read<OtherFunctionBloc>()
                                  .customerSearchController
                                  .text
                                  .isNotEmpty) {
                                showDialog(
                                  context: context,
                                  builder: (_) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16, right: 16.0, top: 12, bottom: 60),
                                      child: CustomerSearchListDialog(
                                        firstName: context
                                            .read<OtherFunctionBloc>()
                                            .customerSearchController
                                            .text,
                                        onCustomerSelected: (customer) {
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                          context.read<OtherFunctionBloc>().add(
                                            TransferFromCardDetails(
                                                customer?.cardNumber == ''
                                                    ? MessagesProvider.get(
                                                    'no card linked')
                                                    : customer?.id.toString() ??
                                                    '',
                                                tagNo: customer?.cardNumber),
                                          );
                                          context
                                              .read<OtherFunctionBloc>()
                                              .updateCustomerData(customer);
                                          context
                                              .read<SelectedCustomer>()
                                              .selectSearchData(customer);
                                        },
                                        onCancelTapped: () {},
                                        basicView: true,
                                        isNameSelect: true,
                                      ),
                                    );
                                  },
                                );
                              }
                            },
                            child: Container(
                              height: SizeConfig.getSize(60),
                              width: SizeConfig.isBigDevice()?SizeConfig.getSize(70):SizeConfig.getSize(60),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Image.asset(
                                'assets/2x/customer_search.png',
                                scale: SizeConfig.isBigDevice()?2:3,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    BlocBuilder<OtherFunctionBloc, OtherFunctionState>(
                      builder: (context, state) {
                        final otherFunctionBloc =
                            context.read<OtherFunctionBloc>();
                        if (state is CardDetailsState) {
                          if (otherFunctionBloc.customerDetails?.data?.length ==
                              2) {
                            return GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return CustomerDetailsPage(
                                      selectIndex: (index) {
                                        otherFunctionBloc.add(
                                          CardChangeEvent(
                                            index ?? '',
                                          ),
                                        );
                                      },
                                      isFromSearch: true,
                                      source: 8,
                                    );
                                  },
                                );
                              },
                              child: Container(
                                width: 150,
                                height:
                                    MediaQuery.of(context).size.height * 0.08,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.black,
                                ),
                                child: Flexible(
                                  child: Center(
                                    child: Text(
                                      MessagesProvider.get(
                                          'Select another card'),
                                      style: KTextStyle.smallWhiteBoldtext,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        } else {
                          if (otherFunctionBloc.customerDetails?.data?.length ==
                              2) {
                            return GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return CustomerDetailsPage(
                                      selectIndex: (index) {
                                        otherFunctionBloc.add(
                                          CardChangeEvent(
                                            index ?? '',
                                          ),
                                        );
                                      },
                                      isFromSearch: true,
                                      source: 8,
                                    );
                                  },
                                );
                              },
                              child: Container(
                                width: 150,
                                height:
                                    MediaQuery.of(context).size.height * 0.08,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.black,
                                ),
                                child: Flexible(
                                  child: Text(
                                    MessagesProvider.get('Select another card'),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: KTextStyle.smallWhiteBoldtext,
                                  ),
                                ),
                              ),
                            );
                          }
                        }
                        return const SizedBox.shrink();
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
