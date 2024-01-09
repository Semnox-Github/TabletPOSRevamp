import 'package:dio/dio.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:master_data/builder.dart';
import 'package:master_data/models/user_role_container/user_role_container_dto.dart';
import 'package:messages_data/builder.dart';
import 'package:nfc/nfc.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:product_config_ui/change_staff_dialog/loader_widget_extension.dart';
import 'package:themes_library/themes_library.dart';
import 'package:transaction_data/builder.dart';
import 'package:transaction_data/models/create_transaction/transaction_response.dart';
import 'package:transaction_data/models/get_clocked_in_users/get_clocked_in_users_response.dart';
import 'package:transaction_data/models/user_container/user_container_response.dart';
import 'package:transaction_data/models/user_role_container/user_role_container_response.dart';
import 'package:transaction_data/transaction_data_bl.dart';
import 'package:widgets_library/utils/size_config.dart';
import '../widgets/primaryLargeButton.dart';
import '../widgets/secondaryLargeButton.dart';

class ChangeStaffDialog extends StatefulWidget {
  final Function(TransactionResponse value) onChangeStaffCallback;
  final bool isNFCAvailable;
  final int? userId;
  final int? approverID;

  const ChangeStaffDialog({
    Key? key,
    required this.onChangeStaffCallback,
    required this.isNFCAvailable,
    required this.userId,
    required this.approverID
  }) : super(key: key);

  @override
  State<ChangeStaffDialog> createState() => _ChangeStaffDialogState();
}

class _ChangeStaffDialogState extends State<ChangeStaffDialog> {
  NotificationBar? _notificationBar;
  final ScrollController _verticalCtr = ScrollController();
  final tapStatus = ValueNotifier<String?>(null);
  bool shouldShowClockedInUsers = false;
  bool _isUserRoleSelected = false;
  bool _isUserNameSelected = false;
  bool _isLoading = false;
  String? _userRoleDropDownValue;
  String? _userNameDropDownValue;
  String _loadingMessage = "";
  List<String> _usersIDDropDownValue = [];
  late TransactionDataBLContract _transactionDataBl;
  List<UserRoleContainerDTO>? _userRoleList;
  UserContainerResponse? _userContainerResponse;
  GetClockedInUsersResponse? _clockedInUsersResponse;
  List<String> _userRoles = [];
  List<String> _userNames = [];
  List<String> _userID = [];
  List<String>? _clockedInUserRoles = [];
  late NFCManager? nfcManager;
  String? preSelectedUserName;
  late SemnoxTheme theme;

  @override
  void initState() {
    super.initState();
    _getUserRoles();
    _notificationBar = NotificationBar(showHideSideBar: false);
    tapStatus.value = widget.isNFCAvailable ? MessagesProvider.get('TAP YOUR CARD') : '';
    nfcManager = NFCManager();
    if (widget.isNFCAvailable) {
      _startListeningForCardTaps();
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.isNFCAvailable) {
      nfcManager?.stop();
    }
    nfcManager = null;
    _notificationBar = null;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    theme = Theme.of(context).extension<SemnoxTheme>()!;
    return WillPopScope(
      onWillPop: () async => false,
      child: Material(
        color: theme.transparentColor,
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: theme.transparentColor,
              resizeToAvoidBottomInset: false,
              bottomNavigationBar: Container(
                child: _notificationBar,
              ),
              body: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(SizeConfig.getSize(8.0)),
                ),
                child: SizedBox(
                  height: SizeConfig.getHeight(483),
                  width: SizeConfig.getWidth(572),
                  child: Column(
                    children: [
                      Container(
                        height: SizeConfig.getHeight(90),
                        padding: EdgeInsets.only(
                            left: SizeConfig.getWidth(10),
                            top: SizeConfig.getHeight(3),
                            right: SizeConfig.getWidth(10),
                            bottom: SizeConfig.getHeight(3)),
                        child: Center(
                          child: Text(
                              MessagesProvider.get("Change staff from: &1", [preSelectedUserName ?? ""]).toUpperCase(),
                              overflow: TextOverflow.ellipsis,
                              style: theme.heading2?.copyWith(fontSize: SizeConfig.getFontSize(24))),
                        ),
                      ),
                      Divider(
                        thickness: SizeConfig.getSize(1),
                        color: theme.dialogFooterInnerShadow,
                        height: SizeConfig.getHeight(1),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: SizeConfig.getHeight(10),
                            right: SizeConfig.getWidth(10),
                            bottom: SizeConfig.getHeight(10),
                          ),
                          child: RawScrollbar(
                            thumbVisibility: true,
                            trackVisibility: true,
                            thickness: SizeConfig.getWidth(5),
                            trackRadius: Radius.circular(SizeConfig.getWidth(2)),
                            child: SingleChildScrollView(
                              controller: _verticalCtr,
                              child: Column(
                                children: [
                                  Container(
                                    color: theme.cartItemCardBG,
                                    padding: EdgeInsets.only(
                                        left: SizeConfig.getWidth(20),
                                        right: SizeConfig.getWidth(20),
                                        bottom: SizeConfig.getHeight(10)),
                                    child: Row(
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              _setShowClockedInUsersSelection(!shouldShowClockedInUsers);
                                            },
                                            child: Container(
                                                height: SizeConfig.getHeight(34),
                                                width: SizeConfig.getWidth(34),
                                                margin: EdgeInsets.all(SizeConfig.getSize(4)),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.all(Radius.circular(SizeConfig.getSize(6))),
                                                  border: Border.all(width: SizeConfig.getWidth(1), color: theme.secondaryColor!),
                                                ),
                                                child: shouldShowClockedInUsers
                                                    ? Center(child: Image.asset("assets/ic_check.png", color: theme.secondaryColor),)
                                                    : const SizedBox())),
                                        SizedBox(width: SizeConfig.getWidth(8)),
                                        Text(
                                          MessagesProvider.get("Show Clocked In Users"),
                                          style: theme.subtitle2?.copyWith(fontSize: SizeConfig.getFontSize(19)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    color: theme.cartItemCardBG,
                                    padding: EdgeInsets.only(left: SizeConfig.getWidth(20), right: SizeConfig.getWidth(20)),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          MessagesProvider.get("User Roles"),
                                          style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(16)),
                                          textAlign: TextAlign.left,
                                        ),
                                        SizedBox(height: SizeConfig.getHeight(5)),
                                        FractionallySizedBox(
                                          widthFactor: 1.0,
                                          child: SizedBox(
                                            height: SizeConfig.getSize(50),
                                            child: InputDecorator(
                                                decoration: InputDecoration(
                                                    focusColor: theme.cartItemCardBG,
                                                    border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(SizeConfig.getSize(8))),
                                                      borderSide: BorderSide(color: theme.secondaryColor!, width: SizeConfig.getWidth(1)),
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                                                      borderSide: BorderSide(color: theme.secondaryColor!, width: SizeConfig.getWidth(1)),
                                                    ),
                                                    filled: true,
                                                    fillColor: theme.cartItemCardBG,
                                                    contentPadding: EdgeInsets.all(SizeConfig.getSize(10))),
                                                child: DropdownButtonHideUnderline(
                                                  child: DropdownButton(
                                                    isExpanded: true,
                                                    icon: const Icon(Icons.keyboard_arrow_down),
                                                    value: _userRoleDropDownValue,
                                                    iconSize: SizeConfig.getSize(24),
                                                    isDense: true,
                                                    hint: Text(
                                                      MessagesProvider.get("Select"),
                                                      style: theme.subtitle2?.copyWith(fontSize: SizeConfig.getFontSize(14)),
                                                    ),
                                                    style: theme.subtitle2?.copyWith(fontSize: SizeConfig.getFontSize(14)),
                                                    items: shouldShowClockedInUsers
                                                        ? (_clockedInUserRoles != null && _clockedInUserRoles?.isNotEmpty == true)
                                                            ? _clockedInUserRoles?.map<DropdownMenuItem<String>>((String value) {
                                                                return DropdownMenuItem<String>(
                                                                  value: value,
                                                                  child: Text(
                                                                    value,
                                                                    style: theme.subtitle2?.copyWith(fontSize: SizeConfig.getFontSize(14)),
                                                                  ),
                                                                );
                                                              }).toList()
                                                            : <String>[MessagesProvider.get("Select")].map((String value) {
                                                                return DropdownMenuItem<String>(
                                                                  value: value,
                                                                  child: Text(
                                                                    value,
                                                                    style: theme.subtitle2?.copyWith(fontSize: SizeConfig.getFontSize(14)),
                                                                  ),
                                                                );
                                                              }).toList()
                                                        : (_userRoleList != null)
                                                            ? _userRoles.map<DropdownMenuItem<String>>((String value) {
                                                                return DropdownMenuItem<String>(
                                                                  value: value,
                                                                  child: Text(
                                                                    value,
                                                                    style: theme.subtitle2?.copyWith(fontSize: SizeConfig.getFontSize(14)),
                                                                  ),
                                                                );
                                                              }).toList()
                                                            : <String>[MessagesProvider.get("Select")].map((String value) {
                                                                return DropdownMenuItem<String>(
                                                                  value: value,
                                                                  child: Text(
                                                                    value,
                                                                    style: theme.subtitle2?.copyWith(fontSize: SizeConfig.getFontSize(14)),
                                                                  ),
                                                                );
                                                              }).toList(),
                                                    onChanged: (String? newValue) {
                                                      _userRoleSelected(newValue!);
                                                    },
                                                    dropdownColor: theme.cartItemCardBG,
                                                  ),
                                                )),
                                          ),
                                        ),
                                        SizedBox(height: SizeConfig.getHeight(15)),
                                        Text(
                                          MessagesProvider.get("Users"),
                                          style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(16)),
                                        ),
                                        SizedBox(height: SizeConfig.getHeight(5)),
                                        FractionallySizedBox(
                                          widthFactor: 1.0,
                                          child: SizedBox(
                                            height: SizeConfig.getSize(50),
                                            child: InputDecorator(
                                              decoration: InputDecoration(
                                                  focusColor: theme.cartItemCardBG,
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                                                    borderSide: BorderSide(color: theme.secondaryColor!, width: SizeConfig.getWidth(1)),
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                                                    borderSide: BorderSide(color: theme.secondaryColor!, width: SizeConfig.getWidth(1)),
                                                  ),
                                                  filled: true,
                                                  fillColor: theme.cartItemCardBG,
                                                  contentPadding: EdgeInsets.all(SizeConfig.getSize(10))),
                                              child: DropdownButtonHideUnderline(
                                                child: DropdownButton(
                                                  isExpanded: true,
                                                  icon: const Icon(Icons.keyboard_arrow_down),
                                                  value: _userNameDropDownValue,
                                                  iconSize: SizeConfig.getSize(24),
                                                  isDense: true,
                                                  hint: Text(
                                                    MessagesProvider.get("Select"),
                                                    style: theme.subtitle2?.copyWith(fontSize: SizeConfig.getFontSize(14)),
                                                  ),
                                                  style: theme.subtitle2?.copyWith(fontSize: SizeConfig.getFontSize(14)),
                                                  items: (_userNames.isNotEmpty)
                                                      ? _userNames.map<DropdownMenuItem<String>>((String value) {
                                                          return DropdownMenuItem<String>(
                                                            value: value.isNotEmpty ? value : null,
                                                            child: Text(
                                                              value,
                                                              style: theme.subtitle2?.copyWith(fontSize: SizeConfig.getFontSize(14)),
                                                            ),
                                                          );
                                                        }).toList()
                                                      : <String>[MessagesProvider.get("Select")].map((String value) {
                                                          return DropdownMenuItem<String>(
                                                            value: value,
                                                            child: Text(
                                                              value,
                                                              style: theme.subtitle2?.copyWith(fontSize: SizeConfig.getFontSize(14)),
                                                            ),
                                                          );
                                                        }).toList(),
                                                  onChanged: (String? newValue) {
                                                    setState(() {
                                                      _userNameDropDownValue = newValue!;
                                                      _isUserNameSelected = true;
                                                    });
                                                  },
                                                  dropdownColor: theme.cartItemCardBG,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: SizeConfig.getHeight(15)),
                                        Visibility(
                                            visible: widget.isNFCAvailable,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  'assets/ic_customer card.png',
                                                  color: theme.secondaryColor,
                                                  height: SizeConfig.getHeight(19),
                                                  width: SizeConfig.getWidth(24),
                                                ),
                                                SizedBox(width: SizeConfig.getWidth(15)),
                                                Text(
                                                  tapStatus.value ?? '',
                                                  style: theme.heading4?.copyWith(fontSize: SizeConfig.getFontSize(20)),
                                                ),
                                              ],
                                            )),
                                        SizedBox(height: SizeConfig.getHeight(5)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SecondaryLargeButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              text: MessagesProvider.get("CANCEL"),
                            ),
                            const SizedBox(width: 10),
                            PrimaryLargeButton(
                              onPressed: () async {
                                if (_isUserRoleSelected == true && _isUserNameSelected == true) {
                                  _changeStaff(approverID:widget.approverID);
                                } else if (_isUserRoleSelected == false) {
                                  _notificationBar?.showMessage(
                                      MessagesProvider.get("Please select a valid user and user role."),
                                      theme.footerBG5!);
                                } else {
                                  _notificationBar?.showMessage(
                                      MessagesProvider.get("Please select a valid user and user role."),
                                      theme.footerBG5!);
                                }
                              },
                              text: MessagesProvider.get("OK"),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ).withLoader(
        isLoading: _isLoading,
        message: _loadingMessage,
        theme: theme
      ),
    );
  }

  void _setLoadingStatus(bool status) {
    setState(() {
      _isLoading = status;
    });
  }

  void _setShowClockedInUsersSelection(bool isSelected) {
    setState(() {
      shouldShowClockedInUsers = isSelected;
      isSelected ? _getClockedInUsers() : _getUserRoles();
    });
  }

  Future<void> _getUserRoles() async {
    try {
      _loadingMessage = MessagesProvider.get("Please wait while we load the user roles...");
      _setLoadingStatus(true);
      _userRoleDropDownValue = null;
      _userNameDropDownValue = null;
      _userNames.clear();
      _clockedInUserRoles?.clear();

      var execContextBL = await ExecutionContextBuilder.build();
      var sysExecContext = execContextBL.getExecutionContext();
      _transactionDataBl = await TransactionDataBuilder.build(sysExecContext!);
      final masterDataBL = await MasterDataBuilder.build(sysExecContext);

      if (_userRoleList == null && _userContainerResponse == null) {
        _userRoleList = await masterDataBL.getUserRoles();
        _userContainerResponse = await _transactionDataBl.getUserContainerList();
      }

      _userNames = _userContainerResponse != null
          ? _userContainerResponse!.data!.userContainerDtoList.map((e) => e.userName.toString()).toList()
          : [];

      _userRoles = _userRoleList != null
          ? _userRoleList!.map((e) => e.role.toString()).toList()
          : [];

      _userID = _userContainerResponse != null
          ? _userContainerResponse!.data!.userContainerDtoList.map((e) => e.userId.toString()).toList()
          : [];

      int? preSelectedUserRoleId = -1;
      _userContainerResponse?.data?.userContainerDtoList.forEach((users) {
        if (users.userId == widget.userId) {
          preSelectedUserRoleId = users.roleId;
          preSelectedUserName = users.userName ?? null;
        }
      });

      if (preSelectedUserRoleId != -1 || preSelectedUserRoleId != null) {
        String? preSelectedUserRole = _userRoleList?.where((element) => element.roleId == preSelectedUserRoleId)
                .toList()[0]
                .role ?? null;

        _userRoleSelected(preSelectedUserRole!);
      }

      _setLoadingStatus(false);
    } on DioError catch (error) {
      _setLoadingStatus(false);
      var errorString = error.response?.data['data'] as String?;
      _notificationBar?.showMessage(errorString!, theme.footerBG3!);
    } catch (error) {
      _setLoadingStatus(false);
      _notificationBar?.showMessage(error.toString(), theme.footerBG3!);
    }
  }

  Future<void> _getClockedInUsers() async {
    try {
      _loadingMessage = MessagesProvider.get("Please wait while we fetch Clocked In Users...");
      _setLoadingStatus(true);
      _userRoleDropDownValue = null;
      _userNameDropDownValue = null;
      _userNames.clear();
      _clockedInUserRoles?.clear();
      var executionContextBL = await ExecutionContextBuilder.build();
      var executionContext = executionContextBL.getExecutionContext();
      _transactionDataBl = await TransactionDataBuilder.build(executionContext!);

      _clockedInUsersResponse = null;
      _clockedInUsersResponse ??= await _transactionDataBl.getClockedInUsers();

      var clockedInUserRolesIds = _clockedInUsersResponse?.data?.map((e) => e.roleId).toList();

      _userID = _userContainerResponse != null
          ? _userContainerResponse!.data!.userContainerDtoList
              .where((element) => element.userId == clockedInUserRolesIds![0])
              .toList()
              .map((e) => e.userId.toString())
              .toList()
          : [];

      _usersIDDropDownValue = _userID;

      clockedInUserRolesIds?.forEach((roleId) {
        _userRoleList?.forEach((userRoleContainer) {
          if (roleId == userRoleContainer.roleId) {
            _clockedInUserRoles?.add((userRoleContainer.role)!);
          }
        });
      });

      _userNames = _userContainerResponse != null
          ? _userContainerResponse!.data!.userContainerDtoList
              .where((element) => element.roleId == clockedInUserRolesIds![0])
              .toList()
              .map((e) => e.userName!)
              .toList()
          : [];

      int? preSelectedUserRoleId = clockedInUserRolesIds![0];
      _userContainerResponse?.data?.userContainerDtoList.forEach((users) {
        if (users.userId == widget.userId) {
          preSelectedUserRoleId = users.roleId;
        }
      });

      clockedInUserRolesIds.forEach((roleId) {
        if (roleId == preSelectedUserRoleId) {
          String? preSelectedUserRole = _userRoleList != null
              ? _userRoleList?.where((element) => element.roleId == preSelectedUserRoleId)
                  .toList()[0]
                  .role
              : null;

          if (preSelectedUserRole != null) {
            _userRoleSelected(preSelectedUserRole);
          }
        }
      });

      _setLoadingStatus(false);
    } on DioError catch (error) {
      _setLoadingStatus(false);
      var errorString = error.response?.data['data'] as String?;
      _notificationBar?.showMessage(errorString!, theme.footerBG3!);
    } catch (error) {
      _setLoadingStatus(false);
      _notificationBar?.showMessage(error.toString(), theme.footerBG3!);
    }
  }

  _userRoleSelected(String selectedUserRole) {
    setState(() {
      _userNameDropDownValue = null;
      _userNames.clear();
      int? selectedUserRoleID = _userRoleList?.where((element) => element.role.toString() == selectedUserRole.toString())
              .toList()[0]
              .roleId ?? 0;
      _isUserRoleSelected = true;
      _isUserNameSelected = false;
      _userID = _userContainerResponse!.data!.userContainerDtoList
          .where((element) => element.userId == selectedUserRoleID)
          .toList()
          .map((e) => e.userId.toString())
          .toList();
      _usersIDDropDownValue = _userID;
      _userNames = _userContainerResponse!.data!.userContainerDtoList
          .where((element) => element.roleId == selectedUserRoleID)
          .toList()
          .map((e) => e.userName!)
          .toList();
      _userRoleDropDownValue = selectedUserRole.toString();
      _userNameDropDownValue = null;
    });
  }

  Future<void> _changeStaff({int? userId, int?approverID}) async {
    try {
      int? userID;
      _loadingMessage = MessagesProvider.get("Changing Staff...");
      _setLoadingStatus(true);
      var executionContextBL = await ExecutionContextBuilder.build();
      var executionContext = executionContextBL.getExecutionContext();
      _transactionDataBl = await TransactionDataBuilder.build(executionContext!);

      if (userId == null) {
        userID = _userContainerResponse!.data!.userContainerDtoList
                .where((element) => element.userName.toString() == _userNameDropDownValue.toString())
                .toList()
                .isNotEmpty
            ? _userContainerResponse!.data!.userContainerDtoList
                .where((element) => element.userName.toString() == _userNameDropDownValue.toString())
                .toList()[0]
                .userId
            : 0;
      } else {
        userID = userId;
      }

      final response = await _transactionDataBl.changeTransactionStaff(userId: userID!,approverID:approverID);
      _setLoadingStatus(false);
      if (response.exception == null) {
        Navigator.pop(context);
        widget.onChangeStaffCallback(response);
      } else {
        _notificationBar?.showMessage(response.exception!, theme.footerBG3!);
      }
    } on DioError catch (error) {
      _setLoadingStatus(false);
      var errorString = error.response?.data['data'] as String?;
      _notificationBar?.showMessage(errorString!, theme.footerBG3!);
    } catch (error) {
      _setLoadingStatus(false);
      _notificationBar?.showMessage(error.toString(), theme.footerBG3!);
    }
  }

  _startListeningForCardTaps() async {
    Stream<NFCReadData>? nfcReadDataStream = nfcManager?.startScan();
    nfcReadDataStream?.listen((data) {
      String cardId = data.readableData;
      if (!_isLoading) {
        setState(() {
          tapStatus.value = MessagesProvider.get("CARD READ SUCCESSFULLY");
        });
        if (cardId.isNotEmpty && !cardId.contains(RegExp(r'[A-Z]'), 1)) {
          setState(() {
            tapStatus.value = MessagesProvider.get("CARD IDENTIFIED. AUTHENTICATING...");
          });
          _changeStaff(userId: int.parse(cardId));
        } else {
          _notificationBar?.showMessage(
              MessagesProvider.get("Unable to verify the user."), theme.footerBG3!);
        }
      }
    });
  }
}
