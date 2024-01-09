import 'package:customer_ui/NewCustomerPage.dart';
import 'package:customer_ui/customer_lookup_screen.dart';
import 'package:customer_ui/screens/registration/NewCustomerScreen.dart';
import 'package:customer_ui/utils/size_config.dart';
import 'package:customer_ui/widgets/registration/TopBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:messages_data/builder.dart';
import 'package:orders_ui/OrdersPage.dart';
import 'package:themes_library/themes_library.dart';
import 'cubits/customer_screen/customer_screen_cubit.dart';
import 'cubits/customer_screen/customer_screen_state.dart';
import 'package:customer_ui/screens/lookup/CustomerSearchScreen.dart';

class CustomerScreen extends StatelessWidget {
  const CustomerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<CustomerScreenCubit>(
          create: (BuildContext context) => CustomerScreenCubit()),

    ], child: const CustomerPage());
  }
}

class CustomerPage extends StatefulWidget {
  const CustomerPage({Key? key}) : super(key: key);

  @override
  State<CustomerPage> createState() =>
      _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  NotificationBar? _notificationBar;
  static late SemnoxTheme _theme;

  @override
  void initState() {
    super.initState();
    _notificationBar = NotificationBar(
      showHideSideBar: true,
      onSideBarStatusUpdate: (shouldShowSidebar) {
        context.read<CustomerScreenCubit>().changeSideBar();
      },
    );
    context
        .read<CustomerScreenCubit>()
        .initState(initialSelectedTab: "New", isShowSideBar: true);
  }



  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    _theme = Theme.of(context).extension<SemnoxTheme>()!;
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Material(
          color: _theme.transparentColor,
          child: Stack(
            children: [
              Scaffold(
                  bottomNavigationBar:  ValueListenableBuilder(
                      valueListenable: setNotification,
                      builder: (BuildContext context, value, Widget? child){
                        //print("::::: "+notificationBarStatus.value.toString()+" :::::");
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          if(value.message != null || value.message == ''){
                            _notificationBar?.showMessage(value.message.toString(), value.color ?? Colors.white);
                          }
                        });
                        return
                          Container(
                            child: _notificationBar,
                          );
                      }
                  ),
                  body: Row(
                    children: [
                      BlocConsumer<CustomerScreenCubit, CustomerScreenState>(
                          listener: (context, state) {
                            visibleSideBar.value = state.showSideBar;
                          },
                          builder: (context, state) {
                            if (!state.showSideBar) {
                              return const SizedBox();
                            }
                            return Container(
                              height: double.infinity,
                              width: (SizeConfig.blockSizeHorizontal * 17.5) + 7,
                              color: Colors.black,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 21),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Row(
                                      children: [
                                        const SizedBox(
                                          width: 21,
                                        ),
                                        SizedBox(
                                          height: 24,
                                          width: 14,
                                          child: Image.asset(
                                              'assets/back_arrow_white.png'),
                                        ),
                                        Expanded(
                                          child: Center(
                                            child: Text(
                                              MessagesProvider.get('Customers')
                                                  .toUpperCase(),
                                              style: _theme.headingLight4!.copyWith(color:_theme.light1,fontSize: SizeConfig.getFontSize(22)),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 3,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: TextButton(
                                          onPressed: () {
                                            context
                                                .read<CustomerScreenCubit>()
                                                .changeTab("New");
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                              state.selectedButtonValue ==
                                                  'New'
                                                  ? _theme.button2BG1
                                                  : _theme.transparentColor,
                                              minimumSize: const Size(180, 34),
                                              maximumSize: const Size(180, 34),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(8),
                                              )),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 4.0),
                                              child: Text(
                                                MessagesProvider.get('New'),
                                                style:_theme.title3?.copyWith(
                                                    color: Colors.white,
                                                    fontSize: SizeConfig.getFontSize(25),
                                                    fontWeight: FontWeight.w500
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: TextButton(
                                            onPressed: () {
                                              context.read<CustomerScreenCubit>().changeTab("Lookup");
                                              showDialog(context: context, builder: (_) {
                                                return const Padding(
                                                    padding: EdgeInsets.only(left: 16,right:16, top: 12,bottom:60 ),
                                                    child:  CustomerLookUpScreen(
                                                      isShowHeader: true,
                                                      isNameSelect: false,
                                                    ));
                                              }, barrierDismissible: false);
                                            },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                state.selectedButtonValue ==
                                                    'Lookup'
                                                    ?_theme.button2BG1
                                                    : _theme.transparentColor,
                                                minimumSize: const Size(180, 34),
                                                maximumSize: const Size(180, 34),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(8),
                                                )),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 4.0),
                                                child: Text(
                                                    MessagesProvider.get(
                                                        'Lookup'),
                                                    style:  _theme.title3?.copyWith(
                                                        color: Colors.white,
                                                        fontSize: SizeConfig.getFontSize(25),
                                                        fontWeight: FontWeight.w500,
                                                    ),
                                                ),
                                              ),
                                            )),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          }),
                      Expanded(
                          child: BlocConsumer<CustomerScreenCubit,
                              CustomerScreenState>(
                              listener: (context, state) {},
                              builder: (context, state) {
                                if (state.selectedButtonValue == "New") {
                                  return NewCustomerScreen(isShowHeader:false,);
                                }
                                return  CustomerSearchScreen(
                                  basicView: true,
                                  isNameSelect: false,
                                  showHeader: false,
                                );
                              })),

                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

}
