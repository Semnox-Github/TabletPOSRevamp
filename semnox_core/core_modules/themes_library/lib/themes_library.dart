library themes_library;

import 'package:flutter/material.dart';
import 'package:themes_library/builder.dart';

@immutable
class SemnoxTheme extends ThemeExtension<SemnoxTheme> {
  final Color? backGroundColor;
  final Color? dividerColor;
  final Color? primaryColor;
  final Color? secondaryColor;
  final Color? errorTextColor;
  final Color? containerBgColor;
  final Color? primaryButtonColor;
  final Color? cardStateSelectedLight;
  final Color? cardStateUnselectedLight;
  final Color? shadowColor;
  final Color? darkTextColor;
  final Color? sideNavBackground;
  final Color? sideNavListLabel;
  final Color? pageHeader;
  final Color? sideNavListBGSelectedState;
  final Color? sideNavListBGDefaultState;
  final Color? sideNavListInnerShadow1;
  final Color? sideNavListInnerShadow2;
  final Color? scrollBarHandle;
  final Color? scrollArea;
  final Color? scrollDownInnerShadow1;
  final Color? scrollDownInnerShadow2;
  final Color? scrollDisabled;
  final Color? customerDetailBG;
  final Color? customerDetailInnerShadow1;
  final Color? customerDetailInnerShadow2;
  final Color? cartBG;
  final Color? cartItemCardBG;
  final Color? cartItemCardInnerShadow1;
  final Color? cartItemCardInnerShadow2;
  final Color? totalBackground;
  final Color? totalInnerShadow1;
  final Color? listTileBG;
  final Color? footerBG1;
  final Color? footerBG2;
  final Color? footerBG3;
  final Color? footerBG4;
  final Color? footerBG5;
  final Color? dialogBG;
  final Color? dialogHeaderBG;
  final Color? dialogHeaderInnerShadow;
  final Color? dialogFooterInnerShadow;
  final Color? tableRow1;
  final Color? tableRowSelectedState1;
  final Color? tableRowSelectedState2;
  final Color? tableRow2;
  final Color? tableRowSelectState2;
  final Color? textField1;
  final Color? textField1active;
  final Color? textField1disabled;
  final Color? textField1Error;
  final Color? textbox2;
  final Color? textField3;
  final Color? textField4;
  final Color? textField3Active;
  final Color? checkboxLight;
  final Color? checkboxDark;
  final Color? button1BG1;
  final Color? button1InnerShadow1;
  final Color? button1InnerShadow2;
  final Color? button2BG1;
  final Color? button2InnerShadow1;
  final Color? button2InnerShadow2;
  final Color? darkIcon;
  final Color? lightIcon;
  final Color? disabledIcon;
  final Color? primaryTextColor1;
  final Color? primaryTextColor2;
  final Color? secondaryTextColor;
  final Color? light1;
  final Color? light2;
  final Color? transparentColor;
  final Color? primaryColor2;
  final Color? primaryOpposite;

  final TextStyle? cardTextSelectedLight;
  final TextStyle? cardTextUnselectedLight;
  final TextStyle? heading1;
  final TextStyle? heading2;
  final TextStyle? heading3;
  final TextStyle? heading4;
  final TextStyle? heading5;
  final TextStyle? heading6;
  final TextStyle? headingLight1;
  final TextStyle? headingLight2;
  final TextStyle? headingLight3;
  final TextStyle? headingLight4;
  final TextStyle? headingLight5;
  final TextStyle? headingLight6;
  final TextStyle? title1;
  final TextStyle? title2;
  final TextStyle? title3;
  final TextStyle? titleLight1;
  final TextStyle? titleLight2;
  final TextStyle? titleLight3;
  final TextStyle? subtitle1;
  final TextStyle? subtitle2;
  final TextStyle? subtitle3;
  final TextStyle? subtitleLight1;
  final TextStyle? subtitleLight2;
  final TextStyle? subtitleLight3;
  final TextStyle? description1;
  final TextStyle? description2;
  final TextStyle? description3;
  final TextStyle? descriptionLight1;
  final TextStyle? descriptionLight2;
  final TextStyle? descriptionLight3;
  final TextStyle? descriptionLight4;
  final TextStyle? textFieldStyle;
  final TextStyle? primaryButtonTextStyle;
  final TextStyle? textFieldErrorStyle;
  final TextStyle? textFieldHintStyle;

  @override
  ThemeExtension<SemnoxTheme> copyWith({
    Color? backGroundColor,
    Color? dividerColor,
    Color? primaryColor,
    Color? secondaryColor,
    Color? errorTextColor,
    Color? containerBgColor,
    Color? primaryButtonColor,
    Color? cardStateSelectedLight,
    Color? cardStateUnselectedLight,
    Color? shadowColor,
    Color? darkTextColor,
    Color? sideNavBackground,
    Color? sideNavListLabel,
    Color? pageHeader,
    Color? sideNavListBGSelectedState,
    Color? sideNavListBGDefaultState,
    Color? sideNavListInnerShadow1,
    Color? sideNavListInnerShadow2,
    Color? scrollBarHandle,
    Color? scrollArea,
    Color? scrollDownInnerShadow1,
    Color? scrollDownInnerShadow2,
    Color? scrollDisabled,
    Color? customerDetailBG,
    Color? customerDetailInnerShadow1,
    Color? customerDetailInnerShadow2,
    Color? cartBG,
    Color? cartItemCardBG,
    Color? cartItemCardInnerShadow1,
    Color? cartItemCardInnerShadow2,
    Color? totalBackground,
    Color? totalInnerShadow1,
    Color? footerBG1,
    Color? footerBG2,
    Color? footerBG3,
    Color? footerBG4,
    Color? footerBG5,
    Color? dialogBG,
    Color? dialogHeaderBG,
    Color? dialogHeaderInnerShadow,
    Color? dialogFooterInnerShadow,
    Color? tableRow1,
    Color? tableRowSelectedState1,
    Color? tableRowSelectedState2,
    Color? tableRow2,
    Color? tableRowSelectState2,
    Color? textField1,
    Color? textField1active,
    Color? textField1disabled,
    Color? textField1Error,
    Color? textbox2,
    Color? textField3,
    Color? textField4,
    Color? textField3Active,
    Color? checkboxLight,
    Color? checkboxDark,
    Color? button1BG1,
    Color? button1InnerShadow1,
    Color? button1InnerShadow2,
    Color? button2BG1,
    Color?  listTileBG,
    Color? button2InnerShadow1,
    Color? button2InnerShadow2,
    Color? darkIcon,
    Color? lightIcon,
    Color? disabledIcon,
    Color? primaryTextColor1,
    Color? primaryTextColor2,
    Color? secondaryTextColor,
    Color? light1,
    Color? light2,
    Color? transparentColor,
    Color? primaryColor2,
    Color? primaryOpposite,
    TextStyle? heading1,
    TextStyle? heading2,
    TextStyle? heading3,
    TextStyle? heading4,
    TextStyle? heading5,
    TextStyle? heading6,
    TextStyle? headingLight1,
    TextStyle? headingLight2,
    TextStyle? headingLight3,
    TextStyle? headingLight4,
    TextStyle? headingLight5,
    TextStyle? headingLight6,
    TextStyle? title1,
    TextStyle? title2,
    TextStyle? title3,
    TextStyle? titleLight1,
    TextStyle? titleLight2,
    TextStyle? titleLight3,
    TextStyle? subtitle1,
    TextStyle? subtitle2,
    TextStyle? subtitle3,
    TextStyle? subtitleLight1,
    TextStyle? subtitleLight2,
    TextStyle? subtitleLight3,
    TextStyle? description1,
    TextStyle? description2,
    TextStyle? description3,
    TextStyle? descriptionLight1,
    TextStyle? descriptionLight2,
    TextStyle? descriptionLight3,
    TextStyle? descriptionLight4,
    TextStyle? textFieldStyle,
    TextStyle? primaryButtonTextStyle,
    TextStyle? textFieldErrorStyle,
    TextStyle? textFieldHintStyle,
  }) {
    return SemnoxTheme(
        backGroundColor: backGroundColor ?? this.backGroundColor,
        dividerColor: dividerColor ?? this.dividerColor,
        primaryColor: primaryColor ?? this.primaryColor,
        secondaryColor: secondaryColor ?? this.secondaryColor,
        errorTextColor: errorTextColor ?? this.errorTextColor,
        containerBgColor: containerBgColor ?? this.containerBgColor,
        primaryButtonColor: primaryButtonColor ?? this.primaryButtonColor,
        cardStateSelectedLight: cardStateSelectedLight ?? this.cardStateSelectedLight,
        cardStateUnselectedLight: cardStateUnselectedLight ?? this.cardStateUnselectedLight,
        shadowColor: shadowColor ?? this.shadowColor,
        cardTextSelectedLight: cardTextSelectedLight ?? this.cardTextSelectedLight,
        cardTextUnselectedLight: cardTextUnselectedLight ?? this.cardTextUnselectedLight,
        darkTextColor: darkTextColor ?? this.darkTextColor,
        sideNavBackground: sideNavBackground ?? this.sideNavBackground,
        sideNavListLabel: sideNavBackground ?? this.sideNavBackground,
        pageHeader: pageHeader ?? this.pageHeader,
        sideNavListBGSelectedState: sideNavListBGSelectedState ?? this.sideNavListBGSelectedState,
        sideNavListBGDefaultState: sideNavListBGDefaultState ?? this.sideNavListBGDefaultState,
        sideNavListInnerShadow1: sideNavListInnerShadow1 ?? this.sideNavListInnerShadow1,
        sideNavListInnerShadow2: sideNavListInnerShadow2 ?? this.sideNavListInnerShadow2,
        scrollBarHandle: scrollBarHandle ?? this.scrollBarHandle,
        scrollArea: scrollArea ?? this.scrollArea,
        scrollDownInnerShadow1: scrollDownInnerShadow1 ?? scrollDownInnerShadow1,
        scrollDownInnerShadow2: scrollDownInnerShadow2 ?? scrollDownInnerShadow2,
        scrollDisabled: scrollDisabled ?? this.scrollDisabled,
        customerDetailBG: customerDetailBG ?? this.customerDetailBG,
        customerDetailInnerShadow1: customerDetailInnerShadow1 ?? this.customerDetailInnerShadow1,
        customerDetailInnerShadow2: customerDetailInnerShadow2 ?? this.customerDetailInnerShadow2,
        cartBG: cartBG ?? this.cartBG,
        cartItemCardBG: cartItemCardBG ?? this.cartItemCardBG,
        cartItemCardInnerShadow1: cartItemCardInnerShadow1 ?? this.cartItemCardInnerShadow1,
        cartItemCardInnerShadow2: cartItemCardInnerShadow2 ?? this.cartItemCardInnerShadow2,
        totalBackground: totalBackground ?? this.totalBackground,
        totalInnerShadow1: totalInnerShadow1 ?? this.totalInnerShadow1,
        footerBG1: footerBG1 ?? this.footerBG1,
        footerBG2: footerBG2 ?? this.footerBG2,
        footerBG3: footerBG3 ?? this.footerBG3,
        footerBG4: footerBG4 ?? this.footerBG4,
        footerBG5: footerBG5 ?? this.footerBG5,
        dialogBG: dialogBG ?? this.dialogBG,
        listTileBG:listTileBG ?? this.listTileBG,
        dialogHeaderBG: dialogHeaderBG ?? this.dialogHeaderBG,
        dialogHeaderInnerShadow: dialogHeaderInnerShadow ?? this.dialogHeaderInnerShadow,
        dialogFooterInnerShadow: dialogFooterInnerShadow ?? this.dialogFooterInnerShadow,
        tableRow1: tableRow1 ?? this.tableRow1,
        tableRowSelectedState1: tableRowSelectedState1 ?? this.tableRowSelectedState1,
        tableRowSelectedState2: tableRowSelectedState2 ?? this.tableRowSelectedState2,
        tableRow2: tableRow2 ?? this.tableRow2,
        tableRowSelectState2: tableRowSelectState2 ?? this.tableRowSelectState2,
        textField1: textField1 ?? this.textField1,
        textField1active: textField1active ?? this.textField1active,
        textField1disabled: textField1disabled ?? this.textField1disabled,
        textField1Error: textField1Error ?? this.textField1Error,
        textbox2: textbox2 ?? this.textbox2,
        textField3: textField3 ?? this.textField3,
        textField4: textField4 ?? this.textField4,
        textField3Active: textField3Active ?? this.textField3Active,
        checkboxLight: checkboxLight ?? this.checkboxLight,
        checkboxDark: checkboxDark ?? this.checkboxDark,
        button1BG1: button1BG1 ?? this.button1BG1,
        button1InnerShadow1: button1InnerShadow1 ?? this.button1InnerShadow1,
        button1InnerShadow2: button1InnerShadow2 ?? this.button1InnerShadow2,
        button2BG1: button2BG1 ?? this.button2BG1,
        button2InnerShadow1: button2InnerShadow1 ?? this.button2InnerShadow1,
        button2InnerShadow2: button2InnerShadow2 ?? this.button2InnerShadow2,
        darkIcon: darkIcon ?? this.darkIcon,
        lightIcon: lightIcon ?? this.lightIcon,
        disabledIcon: disabledIcon ?? this.disabledIcon,
        primaryTextColor1: primaryTextColor1 ?? this.primaryTextColor1,
        primaryTextColor2: primaryTextColor2 ?? this.primaryTextColor2,
        secondaryTextColor: secondaryTextColor ?? this.secondaryTextColor,
        light1: light1 ?? this.light1,
        light2: light2 ?? this.light2,
        transparentColor: transparentColor ?? this.transparentColor,
        primaryColor2: primaryColor2 ?? this.primaryColor2,
        primaryOpposite: primaryOpposite ?? this.primaryOpposite,
        heading1: heading1 ?? this.heading1,
        heading2: heading2 ?? this.heading2,
        heading3: heading3 ?? this.heading3,
        heading4: heading4 ?? this.heading4,
        heading5: heading5 ?? this.heading5,
        heading6: heading6 ?? this.heading6,
        headingLight1: headingLight1 ?? this.headingLight1,
        headingLight2: headingLight2 ?? this.headingLight2,
        headingLight3: headingLight3 ?? this.headingLight3,
        headingLight4: headingLight4 ?? this.headingLight4,
        headingLight5: headingLight5 ?? this.headingLight5,
        headingLight6: headingLight6 ?? this.headingLight6,
        title1: title1 ?? this.title1,
        title2: title2 ?? this.title2,
        title3: title3 ?? this.title3,
        titleLight1: titleLight1 ?? this.titleLight1,
        titleLight2: titleLight2 ?? this.titleLight2,
        titleLight3: titleLight3 ?? this.titleLight3,
        subtitle1: subtitle1 ?? this.subtitle1,
        subtitle2: subtitle2 ?? this.subtitle2,
        subtitle3: subtitle3 ?? this.subtitle3,
        subtitleLight1: subtitleLight1 ?? this.subtitleLight1,
        subtitleLight2: subtitleLight2 ?? this.subtitleLight2,
        subtitleLight3: subtitleLight3 ?? this.subtitleLight3,
        description1: description1 ?? this.description1,
        description2: description2 ?? this.description2,
        description3: description3 ?? this.description3,
        descriptionLight1: descriptionLight1 ?? this.descriptionLight1,
        descriptionLight2: descriptionLight2 ?? this.descriptionLight2,
        descriptionLight3: descriptionLight3 ?? this.descriptionLight3,
        descriptionLight4: descriptionLight4 ?? this.descriptionLight4,
        textFieldStyle: textFieldStyle ?? this.textFieldStyle,
        primaryButtonTextStyle: primaryButtonTextStyle ?? this.primaryButtonTextStyle,
        textFieldErrorStyle: textFieldErrorStyle ?? this.textFieldErrorStyle,
        textFieldHintStyle: textFieldHintStyle ?? this.textFieldHintStyle);
  }

  @override
  ThemeExtension<SemnoxTheme> lerp(covariant ThemeExtension<SemnoxTheme>? other, double t) {
    if (other is! SemnoxTheme) {
      return this;
    }
    return SemnoxTheme(
        backGroundColor: Color.lerp(backGroundColor, other.backGroundColor, t),
        dividerColor: Colors.grey,
        primaryColor: Colors.white,
        secondaryColor: Colors.black,
        errorTextColor: Colors.deepOrange,
        containerBgColor: Colors.white,
        primaryButtonColor: Colors.grey,
        cardStateSelectedLight: Color.lerp(cardStateSelectedLight, other.cardStateSelectedLight, t),
        cardStateUnselectedLight: Color.lerp(cardStateUnselectedLight, other.cardStateUnselectedLight, t),
        shadowColor: Color.lerp(shadowColor, other.shadowColor, t),
        cardTextSelectedLight: TextStyle.lerp(cardTextSelectedLight, other.cardTextSelectedLight, t),
        cardTextUnselectedLight: TextStyle.lerp(cardTextUnselectedLight, other.cardTextUnselectedLight, t),
        darkTextColor: Color.lerp(darkTextColor, other.darkTextColor, t),
        sideNavBackground: Color.lerp(sideNavBackground, other.sideNavBackground, t),
        listTileBG: Color.lerp(listTileBG, other.listTileBG, t),
        sideNavListLabel: Color.lerp(sideNavListLabel, other.sideNavListLabel, t),
        pageHeader: Color.lerp(pageHeader, other.pageHeader, t),
        sideNavListBGSelectedState: Color.lerp(sideNavListBGSelectedState, other.sideNavListBGSelectedState, t),
        sideNavListBGDefaultState: Color.lerp(sideNavListBGDefaultState, other.sideNavListBGDefaultState, t),
        sideNavListInnerShadow1: Color.lerp(sideNavListInnerShadow1, other.sideNavListInnerShadow1, t),
        sideNavListInnerShadow2: Color.lerp(sideNavListInnerShadow2, other.sideNavListInnerShadow2, t),
        scrollBarHandle: Color.lerp(scrollBarHandle, other.scrollBarHandle, t),
        scrollArea: Color.lerp(scrollArea, other.scrollArea, t),
        scrollDownInnerShadow1: Color.lerp(scrollDownInnerShadow1, other.scrollDownInnerShadow1, t),
        scrollDownInnerShadow2: Color.lerp(scrollDownInnerShadow2, other.scrollDownInnerShadow2, t),
        scrollDisabled: Color.lerp(scrollDisabled, other.scrollDisabled, t),
        customerDetailBG: Color.lerp(customerDetailBG, other.customerDetailBG, t),
        customerDetailInnerShadow1: Color.lerp(customerDetailInnerShadow1, other.customerDetailInnerShadow1, t),
        customerDetailInnerShadow2: Color.lerp(customerDetailInnerShadow2, other.customerDetailInnerShadow2, t),
        cartBG: Color.lerp(cartBG, other.cartBG, t),
        cartItemCardBG: Color.lerp(cartItemCardBG, other.cartItemCardBG, t),
        cartItemCardInnerShadow1: Color.lerp(cartItemCardInnerShadow1, other.cartItemCardInnerShadow1, t),
        cartItemCardInnerShadow2: Color.lerp(cartItemCardInnerShadow2, other.cartItemCardInnerShadow2, t),
        totalBackground: Color.lerp(totalBackground, other.totalBackground, t),
        totalInnerShadow1: Color.lerp(totalInnerShadow1, other.totalInnerShadow1, t),
        footerBG1: Color.lerp(footerBG1, other.footerBG1, t),
        footerBG2: Color.lerp(footerBG2, other.footerBG2, t),
        footerBG3: Color.lerp(footerBG3, other.footerBG3, t),
        footerBG4: Color.lerp(footerBG4, other.footerBG4, t),
        footerBG5: Color.lerp(footerBG5, other.footerBG5, t),
        dialogBG: Color.lerp(dialogBG, other.dialogBG, t),
        dialogHeaderBG: Color.lerp(dialogHeaderBG, other.dialogHeaderBG, t),
        dialogHeaderInnerShadow: Color.lerp(dialogHeaderInnerShadow, other.dialogHeaderInnerShadow, t),
        dialogFooterInnerShadow: Color.lerp(dialogFooterInnerShadow, other.dialogFooterInnerShadow, t),
        tableRow1: Color.lerp(tableRow1, other.tableRow1, t),
        tableRowSelectedState1: Color.lerp(tableRowSelectedState1, other.tableRowSelectedState1, t),
        tableRowSelectedState2: Color.lerp(tableRowSelectedState2, other.tableRowSelectedState2, t),
        tableRow2: Color.lerp(tableRow2, other.tableRow2, t),
        tableRowSelectState2: Color.lerp(tableRowSelectState2, other.tableRowSelectState2, t),
        textField1: Color.lerp(textField1, other.textField1, t),
        textField1active: Color.lerp(textField1active, other.textField1active, t),
        textField1disabled: Color.lerp(textField1disabled, other.textField1disabled, t),
        textField1Error: Color.lerp(textField1Error, other.textField1Error, t),
        textbox2: Color.lerp(textbox2, other.textbox2, t),
        textField3: Color.lerp(textField3, other.textField3, t),
        textField4: Color.lerp(textField4, other.textField4, t),
        textField3Active: Color.lerp(textField3Active, other.textField3Active, t),
        checkboxLight: Color.lerp(checkboxLight, other.checkboxLight, t),
        checkboxDark: Color.lerp(checkboxDark, other.checkboxDark, t),
        button1BG1: Color.lerp(button1BG1, other.button1BG1, t),
        button1InnerShadow1: Color.lerp(button1InnerShadow1, other.button1InnerShadow1, t),
        button1InnerShadow2: Color.lerp(button1InnerShadow2, other.button1InnerShadow2, t),
        button2BG1: Color.lerp(button2BG1, other.button2BG1, t),
        button2InnerShadow1: Color.lerp(button2InnerShadow1, other.button2InnerShadow1, t),
        button2InnerShadow2: Color.lerp(button2InnerShadow2, other.button2InnerShadow2, t),
        darkIcon: Color.lerp(darkIcon, other.darkIcon, t),
        lightIcon: Color.lerp(lightIcon, other.lightIcon, t),
        disabledIcon: Color.lerp(disabledIcon, other.disabledIcon, t),
        primaryTextColor1: Color.lerp(primaryTextColor1, other.primaryTextColor1, t),
        primaryTextColor2: Color.lerp(primaryTextColor2, other.primaryTextColor2, t),
        secondaryTextColor: Color.lerp(secondaryTextColor, other.secondaryTextColor, t),
        light1: Color.lerp(light1, other.light1, t),
        light2: Color.lerp(light2, other.light2, t),
        transparentColor: Color.lerp(transparentColor, other.transparentColor, t),
        primaryColor2: Color.lerp(primaryColor2, other.primaryColor2, t),
        primaryOpposite: Color.lerp(primaryOpposite, other.primaryOpposite, t),
        heading1: TextStyle.lerp(heading1, other.heading1, t),
        heading2: TextStyle.lerp(heading2, other.heading2, t),
        heading3: TextStyle.lerp(heading3, other.heading3, t),
        heading4: TextStyle.lerp(heading4, other.heading4, t),
        heading5: TextStyle.lerp(heading5, other.heading5, t),
        heading6: TextStyle.lerp(heading6, other.heading6, t),
        headingLight1: TextStyle.lerp(headingLight1, other.headingLight1, t),
        headingLight2: TextStyle.lerp(headingLight2, other.headingLight2, t),
        headingLight3: TextStyle.lerp(headingLight3, other.headingLight3, t),
        headingLight4: TextStyle.lerp(headingLight4, other.headingLight4, t),
        headingLight5: TextStyle.lerp(headingLight5, other.headingLight5, t),
        headingLight6: TextStyle.lerp(headingLight6, other.headingLight6, t),
        title1: TextStyle.lerp(title1, other.title1, t),
        title2: TextStyle.lerp(title2, other.title2, t),
        title3: TextStyle.lerp(title3, other.title3, t),
        titleLight1: TextStyle.lerp(titleLight1, other.titleLight1, t),
        titleLight2: TextStyle.lerp(titleLight2, other.titleLight2, t),
        titleLight3: TextStyle.lerp(titleLight3, other.titleLight3, t),
        subtitle1: TextStyle.lerp(subtitle1, other.subtitle1, t),
        subtitle2: TextStyle.lerp(subtitle2, other.subtitle2, t),
        subtitle3: TextStyle.lerp(subtitle3, other.subtitle3, t),
        subtitleLight1: TextStyle.lerp(subtitleLight1, other.subtitleLight1, t),
        subtitleLight2: TextStyle.lerp(subtitleLight2, other.subtitleLight2, t),
        subtitleLight3: TextStyle.lerp(subtitleLight3, other.subtitleLight3, t),
        description1: TextStyle.lerp(description1, other.description1, t),
        description2: TextStyle.lerp(description2, other.description2, t),
        description3: TextStyle.lerp(description3, other.description3, t),
        descriptionLight1: TextStyle.lerp(descriptionLight1, other.descriptionLight1, t),
        descriptionLight2: TextStyle.lerp(descriptionLight2, other.descriptionLight2, t),
        descriptionLight3: TextStyle.lerp(descriptionLight3, other.descriptionLight3, t),
        descriptionLight4: TextStyle.lerp(descriptionLight4, other.descriptionLight4, t),
        textFieldStyle: TextStyle.lerp(textFieldStyle, other.textFieldStyle, t),
        primaryButtonTextStyle: TextStyle.lerp(primaryButtonTextStyle, other.primaryButtonTextStyle, t),
        textFieldErrorStyle: TextStyle.lerp(textFieldErrorStyle, other.textFieldErrorStyle, t),
        textFieldHintStyle: TextStyle.lerp(textFieldHintStyle, other.textFieldHintStyle, t));
  }

  SemnoxTheme(
      {required this.backGroundColor,
        required this.dividerColor,
        required this.primaryColor,
        required this.secondaryColor,
        required this.errorTextColor,
        required this.containerBgColor,
        required this.primaryButtonColor,
        required this.cardStateSelectedLight,
        required this.cardStateUnselectedLight,
        required this.shadowColor,
        required this.darkTextColor,
        required this.sideNavBackground,
        required this.sideNavListLabel,
        required this.pageHeader,
        required this.sideNavListBGSelectedState,
        required this.sideNavListBGDefaultState,
        required this.sideNavListInnerShadow1,
        required this.sideNavListInnerShadow2,
        required this.scrollBarHandle,
        required this.scrollArea,
        required this.scrollDownInnerShadow1,
        required this.scrollDownInnerShadow2,
        required this.scrollDisabled,
        required this.customerDetailBG,
        required this.customerDetailInnerShadow1,
        required this.customerDetailInnerShadow2,
        required this.cartBG,
        required this.cartItemCardBG,
        required this.cartItemCardInnerShadow1,
        required this.cartItemCardInnerShadow2,
        required this.totalBackground,
        required this.totalInnerShadow1,
        required this.listTileBG,
        required this.footerBG1,
        required this.footerBG2,
        required this.footerBG3,
        required this.footerBG4,
        required this.footerBG5,
        required this.dialogBG,
        required this.dialogHeaderBG,
        required this.dialogHeaderInnerShadow,
        required this.dialogFooterInnerShadow,
        required this.tableRow1,
        required this.tableRowSelectedState1,
        required this.tableRowSelectedState2,
        required this.tableRow2,
        required this.tableRowSelectState2,
        required this.textField1,
        required this.textField1active,
        required this.textField1disabled,
        required this.textField1Error,
        required this.textbox2,
        required this.textField3,
        required this.textField4,
        required this.textField3Active,
        required this.checkboxLight,
        required this.checkboxDark,
        required this.button1BG1,
        required this.button1InnerShadow1,
        required this.button1InnerShadow2,
        required this.button2BG1,
        required this.button2InnerShadow1,
        required this.button2InnerShadow2,
        required this.darkIcon,
        required this.lightIcon,
        required this.disabledIcon,
        required this.primaryTextColor1,
        required this.primaryTextColor2,
        required this.secondaryTextColor,
        required this.light1,
        required this.light2,
        required this.transparentColor,
        required this.primaryColor2,
        required this.primaryOpposite,
        required this.cardTextSelectedLight,
        required this.cardTextUnselectedLight,
        required this.heading1,
        required this.heading2,
        required this.heading3,
        required this.heading4,
        required this.heading5,
        required this.heading6,
        required this.headingLight1,
        required this.headingLight2,
        required this.headingLight3,
        required this.headingLight4,
        required this.headingLight5,
        required this.headingLight6,
        required this.title1,
        required this.title2,
        required this.title3,
        required this.titleLight1,
        required this.titleLight2,
        required this.titleLight3,
        required this.subtitle1,
        required this.subtitle2,
        required this.subtitle3,
        required this.subtitleLight1,
        required this.subtitleLight2,
        required this.subtitleLight3,
        required this.description1,
        required this.description2,
        required this.description3,
        required this.descriptionLight1,
        required this.descriptionLight2,
        required this.descriptionLight3,
        required this.descriptionLight4,
        required this.textFieldStyle,
        required this.primaryButtonTextStyle,
        required this.textFieldErrorStyle,
        required this.textFieldHintStyle});
}

ThemeData semnoxThemeData(BuildContext context, bool isDarkMode) {
  return isDarkMode ? ThemeData.dark().copyWith(
    // add up theme customizations if required
    extensions: <ThemeExtension<dynamic>>[
      semnoxDarkTheme,
    ],
  ): ThemeData.light().copyWith(
    // add up theme customizations if required
    extensions: <ThemeExtension<dynamic>>[
      semnoxTheme,
    ],
  );
}

SemnoxTheme semnoxTheme = SemnoxTheme(
    backGroundColor: ThemesProvider.getColor("backgroundColor"),
    dividerColor: Colors.grey,
    primaryColor: Colors.white,
    secondaryColor: Colors.black,
    errorTextColor: Colors.deepOrange,
    containerBgColor: Colors.white,
    primaryButtonColor: Colors.grey,
    cardStateSelectedLight: ThemesProvider.getColor("cardStateSelectedLight"),
    cardStateUnselectedLight: ThemesProvider.getColor("cardStateUnselectedLight"),
    shadowColor: ThemesProvider.getColor("shadowColor"),
    darkTextColor: ThemesProvider.getColor("darkTextColor"),
    sideNavBackground: ThemesProvider.getColor("secondaryColor"),
    sideNavListLabel: ThemesProvider.getColor("sideNavListLabel"),
    pageHeader: ThemesProvider.getColor("pageHeader"),
    sideNavListBGSelectedState: ThemesProvider.getColor("sideNavListBGSelectedState"),
    sideNavListBGDefaultState: ThemesProvider.getColor("secondaryColor"),
    sideNavListInnerShadow1: ThemesProvider.getColor("sideNavListInnerShadow1"),
    sideNavListInnerShadow2: ThemesProvider.getColor("sideNavListInnerShadow2"),
    scrollBarHandle: ThemesProvider.getColor("scrollBarHandle"),
    scrollArea: ThemesProvider.getColor("scrollArea"),
    scrollDownInnerShadow1: ThemesProvider.getColor("scrollDownInnerShadow1"),
    scrollDownInnerShadow2: ThemesProvider.getColor("scrollDownInnerShadow2"),
    scrollDisabled: ThemesProvider.getColor("scrollDisabled"),
    customerDetailBG: ThemesProvider.getColor("customerDetailBG"),
    customerDetailInnerShadow1: ThemesProvider.getColor("customerDetailInnerShadow1"),
    customerDetailInnerShadow2: ThemesProvider.getColor("customerDetailInnerShadow2"),
    cartBG: ThemesProvider.getColor("cartBG"),
    cartItemCardBG: ThemesProvider.getColor("cartItemCardBG"),
    cartItemCardInnerShadow1: ThemesProvider.getColor("cartItemCardInnerShadow1"),
    cartItemCardInnerShadow2: ThemesProvider.getColor("cartItemCardInnerShadow2"),
    totalBackground: ThemesProvider.getColor("totalBackground"),
    totalInnerShadow1: ThemesProvider.getColor("totalInnerShadow1"),
    listTileBG: ThemesProvider.getColor("cardBGPrimary"),
    footerBG1: ThemesProvider.getColor("footerBG1"),
    footerBG2: ThemesProvider.getColor("footerBG2"),
    footerBG3: ThemesProvider.getColor("footerBG3"),
    footerBG4: ThemesProvider.getColor("footerBG4"),
    footerBG5: ThemesProvider.getColor("footerBG5"),
    dialogBG: ThemesProvider.getColor("dialogBG"),
    dialogHeaderBG: ThemesProvider.getColor("dialogHeaderBG"),
    dialogHeaderInnerShadow: ThemesProvider.getColor("dialogHeaderInnerShadow"),
    dialogFooterInnerShadow: ThemesProvider.getColor("dialogFooterInnerShadow"),
    tableRow1: ThemesProvider.getColor("tableRow1"),
    tableRowSelectedState1: ThemesProvider.getColor("tableRowSelectedState1"),
    tableRowSelectedState2: ThemesProvider.getColor("tableRowSelectedState2"),
    tableRow2: ThemesProvider.getColor("tableRow2"),
    tableRowSelectState2: ThemesProvider.getColor("tableRowSelectState2"),
    textField1: ThemesProvider.getColor("textField1"),
    textField1active: ThemesProvider.getColor("secondaryColor"),
    textField1disabled: ThemesProvider.getColor("textField1disabled"),
    textField1Error: ThemesProvider.getColor("textField1Error"),
    textbox2: ThemesProvider.getColor("textbox2"),
    textField3: ThemesProvider.getColor("textField3"),
    textField4: ThemesProvider.getColor("textField4"),
    textField3Active: ThemesProvider.getColor("secondaryColor"),
    checkboxLight: ThemesProvider.getColor("checkboxLight"),
    checkboxDark: ThemesProvider.getColor("secondaryColor"),
    button1BG1: ThemesProvider.getColor("button1BG1"),
    button1InnerShadow1: ThemesProvider.getColor("button1InnerShadow1"),
    button1InnerShadow2: ThemesProvider.getColor("button1InnerShadow2"),
    button2BG1: ThemesProvider.getColor("button2BG1"),
    button2InnerShadow1: ThemesProvider.getColor("button2InnerShadow1"),
    button2InnerShadow2: ThemesProvider.getColor("button2InnerShadow2"),
    darkIcon: ThemesProvider.getColor("secondaryColor"),
    lightIcon: ThemesProvider.getColor("lightIcon"),
    disabledIcon: ThemesProvider.getColor("disabledIcon"),
    primaryTextColor1: ThemesProvider.getColor("primaryTextColor1"),
    primaryTextColor2: ThemesProvider.getColor("secondaryColor"),
    secondaryTextColor: ThemesProvider.getColor("secondaryTextColor"),
    light1: ThemesProvider.getColor("light1"),
    light2: ThemesProvider.getColor("light2"),
    transparentColor: ThemesProvider.getColor("transparentColor"),
    primaryColor2: ThemesProvider.getColor("primaryColor2"),
    primaryOpposite: ThemesProvider.getColor("primaryOpposite"),
    cardTextSelectedLight: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    cardTextUnselectedLight: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    heading1: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("secondaryColor"),
      fontSize: 32.0,
      fontWeight: FontWeight.w700,
    ),
    heading2: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, fontFamily: 'RobotoCondensed', color:ThemesProvider.getColor("secondaryColor")),
    heading3: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, fontFamily: 'RobotoCondensed', color:ThemesProvider.getColor("secondaryColor")),
    heading4: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, fontFamily: 'RobotoCondensed', color:ThemesProvider.getColor("secondaryColor")),
    heading5: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, fontFamily: 'RobotoCondensed', color:ThemesProvider.getColor("secondaryColor")),
    heading6: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, fontFamily: 'RobotoCondensed', color:ThemesProvider.getColor("secondaryColor")),
    headingLight1:
    TextStyle(fontSize:32, fontWeight: FontWeight.w700, fontFamily: 'RobotoCondensed', color: Colors.white),
    headingLight2:
    TextStyle(fontSize: 24, fontWeight: FontWeight.w700, fontFamily: 'RobotoCondensed', color: Colors.white),
    headingLight3:
    TextStyle(fontSize: 22, fontWeight: FontWeight.w700, fontFamily: 'RobotoCondensed', color: Colors.white),
    headingLight4:
    TextStyle(fontSize: 20, fontWeight: FontWeight.w700, fontFamily: 'RobotoCondensed', color: Colors.white),
    headingLight5:
    TextStyle(fontSize: 18, fontWeight: FontWeight.w700, fontFamily: 'RobotoCondensed', color: Colors.white),
    headingLight6:
    TextStyle(fontSize: 16, fontWeight: FontWeight.w700, fontFamily: 'RobotoCondensed', color: Colors.white),
    title1: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, fontFamily: 'RobotoCondensed', color: ThemesProvider.getColor("secondaryColor")),
    title2: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, fontFamily: 'RobotoCondensed', color: ThemesProvider.getColor("secondaryColor")),
    title3: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, fontFamily: 'RobotoCondensed', color: ThemesProvider.getColor("secondaryColor")),
    titleLight1: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("primaryColor"),
      fontSize: 22.0,
      fontWeight: FontWeight.w400,
    ),
    titleLight2: TextStyle(
      color: ThemesProvider.getColor("primaryColor"),
      fontWeight: FontWeight.w400,
      fontSize: 20,
      fontFamily: 'RobotoCondensed',
    ),
    titleLight3: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("primaryColor"),
      fontSize: 18.0,
      fontWeight: FontWeight.w400,
    ),
    subtitle1: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("secondaryColor"),
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
    ),
    subtitle2: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("secondaryColor"),
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
    ),
    subtitle3: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("secondaryColor"),
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
    ),
    subtitleLight1: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("primaryColor"),
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
    ),
    subtitleLight2: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("primaryColor"),
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
    ),
    subtitleLight3: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("primaryColor"),
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
    ),
    description1: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("secondaryColor"),
      fontSize: 12.0,
      fontWeight: FontWeight.w700,
    ),
    description2: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("secondaryColor"),
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
    ),
    description3: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("secondaryColor"),
      fontSize: 10.0,
      fontWeight: FontWeight.w400,
    ),
    descriptionLight1: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("primaryColor"),
      fontSize: 12.0,
      fontWeight: FontWeight.w700,
    ),
    descriptionLight2: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("primaryColor"),
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
    ),
    descriptionLight3: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("primaryColor"),
      fontSize: 10.0,
      fontWeight: FontWeight.w600,
    ),
    descriptionLight4: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("primaryColor"),
      fontSize: 8.0,
      fontWeight: FontWeight.w600,
    ),
    textFieldStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: 'RobotoCondensed',
        color: ThemesProvider.getColor("secondaryColor")),
    primaryButtonTextStyle:
    TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'RobotoCondensed', color: Colors.black),
    textFieldErrorStyle:
    TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'RobotoCondensed', color: Colors.black),
    textFieldHintStyle: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("darkGrey2"),
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
    ));

SemnoxTheme semnoxDarkTheme = SemnoxTheme(
    backGroundColor: DarkThemeProvider.getColor("backgroundColor"),
    dividerColor: Colors.grey,
    primaryColor: Colors.black,
    secondaryColor: Colors.white,
    errorTextColor: Colors.deepOrange,
    containerBgColor: Colors.white,
    primaryButtonColor: Colors.grey,
    cardStateSelectedLight: DarkThemeProvider.getColor("cardStateSelectedLight"),
    cardStateUnselectedLight: DarkThemeProvider.getColor("cardStateUnselectedLight"),
    shadowColor: DarkThemeProvider.getColor("shadowColor"),
    darkTextColor: DarkThemeProvider.getColor("darkTextColor"),
    sideNavBackground: DarkThemeProvider.getColor("secondaryColor"),
    sideNavListLabel: DarkThemeProvider.getColor("sideNavListLabel"),
    pageHeader: DarkThemeProvider.getColor("pageHeader"),
    listTileBG: DarkThemeProvider.getColor("cardBGPrimary"),
    sideNavListBGSelectedState: DarkThemeProvider.getColor("sideNavListBGSelectedState"),
    sideNavListBGDefaultState: DarkThemeProvider.getColor("secondaryColor"),
    sideNavListInnerShadow1: DarkThemeProvider.getColor("sideNavListInnerShadow1"),
    sideNavListInnerShadow2: DarkThemeProvider.getColor("sideNavListInnerShadow2"),
    scrollBarHandle: DarkThemeProvider.getColor("scrollBarHandle"),
    scrollArea: DarkThemeProvider.getColor("scrollArea"),
    scrollDownInnerShadow1: DarkThemeProvider.getColor("scrollDownInnerShadow1"),
    scrollDownInnerShadow2: DarkThemeProvider.getColor("scrollDownInnerShadow2"),
    scrollDisabled: DarkThemeProvider.getColor("scrollDisabled"),
    customerDetailBG: DarkThemeProvider.getColor("customerDetailBG"),
    customerDetailInnerShadow1: DarkThemeProvider.getColor("customerDetailInnerShadow1"),
    customerDetailInnerShadow2: DarkThemeProvider.getColor("customerDetailInnerShadow2"),
    cartBG: DarkThemeProvider.getColor("cartBG"),
    cartItemCardBG: DarkThemeProvider.getColor("cartItemCardBG"),
    cartItemCardInnerShadow1: DarkThemeProvider.getColor("cartItemCardInnerShadow1"),
    cartItemCardInnerShadow2: DarkThemeProvider.getColor("cartItemCardInnerShadow2"),
    totalBackground: DarkThemeProvider.getColor("totalBackground"),
    totalInnerShadow1: DarkThemeProvider.getColor("totalInnerShadow1"),
    footerBG1: DarkThemeProvider.getColor("footerBG1"),
    footerBG2: DarkThemeProvider.getColor("footerBG2"),
    footerBG3: DarkThemeProvider.getColor("footerBG3"),
    footerBG4: DarkThemeProvider.getColor("footerBG4"),
    footerBG5: DarkThemeProvider.getColor("footerBG5"),
    dialogBG: DarkThemeProvider.getColor("dialogBG"),
    dialogHeaderBG: DarkThemeProvider.getColor("dialogHeaderBG"),
    dialogHeaderInnerShadow: DarkThemeProvider.getColor("dialogHeaderInnerShadow"),
    dialogFooterInnerShadow: DarkThemeProvider.getColor("dialogFooterInnerShadow"),
    tableRow1: DarkThemeProvider.getColor("tableRow1"),
    tableRowSelectedState1: DarkThemeProvider.getColor("tableRowSelectedState1"),
    tableRowSelectedState2: DarkThemeProvider.getColor("tableRowSelectedState2"),
    tableRow2: DarkThemeProvider.getColor("tableRow2"),
    tableRowSelectState2: DarkThemeProvider.getColor("tableRowSelectState2"),
    textField1: DarkThemeProvider.getColor("textField1"),
    textField1active: DarkThemeProvider.getColor("secondaryColor"),
    textField1disabled: DarkThemeProvider.getColor("textField1disabled"),
    textField1Error: DarkThemeProvider.getColor("textField1Error"),
    textbox2: DarkThemeProvider.getColor("textbox2"),
    textField3: DarkThemeProvider.getColor("textField3"),
    textField4: DarkThemeProvider.getColor("textField4"),
    textField3Active: DarkThemeProvider.getColor("secondaryColor"),
    checkboxLight: DarkThemeProvider.getColor("checkboxLight"),
    checkboxDark: DarkThemeProvider.getColor("secondaryColor"),
    button1BG1: DarkThemeProvider.getColor("button1BG1"),
    button1InnerShadow1: DarkThemeProvider.getColor("button1InnerShadow1"),
    button1InnerShadow2: DarkThemeProvider.getColor("button1InnerShadow2"),
    button2BG1: DarkThemeProvider.getColor("button2BG1"),
    button2InnerShadow1: DarkThemeProvider.getColor("button2InnerShadow1"),
    button2InnerShadow2: DarkThemeProvider.getColor("button2InnerShadow2"),
    darkIcon: DarkThemeProvider.getColor("secondaryColor"),
    lightIcon: DarkThemeProvider.getColor("lightIcon"),
    disabledIcon: DarkThemeProvider.getColor("disabledIcon"),
    primaryTextColor1: DarkThemeProvider.getColor("primaryTextColor1"),
    primaryTextColor2: DarkThemeProvider.getColor("secondaryColor"),
    secondaryTextColor: DarkThemeProvider.getColor("secondaryTextColor"),
    light1: DarkThemeProvider.getColor("light1"),
    light2: DarkThemeProvider.getColor("light2"),
    transparentColor: DarkThemeProvider.getColor("transparentColor"),
    primaryColor2: DarkThemeProvider.getColor("primaryColor2"),
    primaryOpposite: DarkThemeProvider.getColor("primaryOpposite"),
    cardTextSelectedLight: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    cardTextUnselectedLight: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    heading1: TextStyle(
      fontFamily: 'RobotoCondensed',
      color:  Colors.white,
      fontSize: 32.0,
      fontWeight: FontWeight.w700,
    ),
    heading2: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, fontFamily: 'RobotoCondensed', color: Colors.white),
    heading3: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, fontFamily: 'RobotoCondensed', color: Colors.white),
    heading4: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, fontFamily: 'RobotoCondensed', color: Colors.white),
    heading5: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, fontFamily: 'RobotoCondensed', color: Colors.white),
    heading6: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, fontFamily: 'RobotoCondensed', color: Colors.white),
    headingLight1:
    TextStyle(fontSize: 32, fontWeight: FontWeight.w700, fontFamily: 'RobotoCondensed', color: Colors.black),
    headingLight2:
    TextStyle(fontSize: 24, fontWeight: FontWeight.w700, fontFamily: 'RobotoCondensed', color: Colors.black),
    headingLight3:
    TextStyle(fontSize: 22, fontWeight: FontWeight.w700, fontFamily: 'RobotoCondensed', color: Colors.black),
    headingLight4:
    TextStyle(fontSize: 20, fontWeight: FontWeight.w700, fontFamily: 'RobotoCondensed', color: Colors.black),
    headingLight5:
    TextStyle(fontSize: 18, fontWeight: FontWeight.w700, fontFamily: 'RobotoCondensed', color: Colors.black),
    headingLight6:
    TextStyle(fontSize: 16, fontWeight: FontWeight.w700, fontFamily: 'RobotoCondensed', color: Colors.black),
    title1: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, fontFamily: 'RobotoCondensed', color: Colors.white),
    title2: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, fontFamily: 'RobotoCondensed', color: Colors.white),
    title3: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, fontFamily: 'RobotoCondensed', color: Colors.white),
    titleLight1: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: Colors.black,
      fontSize: 22.0,
      fontWeight: FontWeight.w400,
    ),
    titleLight2: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: 20,
      fontFamily: 'RobotoCondensed',
    ),
    titleLight3: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: Colors.black,
      fontSize: 18.0,
      fontWeight: FontWeight.w400,
    ),
    subtitle1: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: Colors.white,
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
    ),
    subtitle2: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: Colors.white,
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
    ),
    subtitle3: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: Colors.white,
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
    ),
    subtitleLight1: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: Colors.black,
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
    ),
    subtitleLight2: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: Colors.black,
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
    ),
    subtitleLight3: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: Colors.black,
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
    ),
    description1: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: Colors.white,
      fontSize: 12.0,
      fontWeight: FontWeight.w700,
    ),
    description2: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: Colors.white,
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
    ),
    description3: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: Colors.white,
      fontSize: 10.0,
      fontWeight: FontWeight.w400,
    ),
    descriptionLight1: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: Colors.black,
      fontSize: 12.0,
      fontWeight: FontWeight.w700,
    ),
    descriptionLight2: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: Colors.black,
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
    ),
    descriptionLight3: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: Colors.black,
      fontSize: 10.0,
      fontWeight: FontWeight.w400,
    ),
    descriptionLight4: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: Colors.black,
      fontSize: 8.0,
      fontWeight: FontWeight.w600,
    ),
    textFieldStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: 'RobotoCondensed',
        color: Colors.white),
    primaryButtonTextStyle:
    TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'RobotoCondensed', color: Colors.black),
    textFieldErrorStyle:
    TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'RobotoCondensed', color: Colors.black),
    textFieldHintStyle: TextStyle(
      fontFamily: 'RobotoCondensed',
      color:  DarkThemeProvider.getColor("light2"),
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
    ));


/*
library themes_library;

import 'package:flutter/material.dart';
import 'package:themes_library/builder.dart';

@immutable
class SemnoxTheme extends ThemeExtension<SemnoxTheme> {
  final Color? backGroundColor;
  final Color? dividerColor;
  final Color? primaryColor;
  final Color? secondaryColor;
  final Color? errorTextColor;
  final Color? containerBgColor;
  final Color? primaryButtonColor;
  final Color? cardStateSelectedLight;
  final Color? cardStateUnselectedLight;
  final Color? shadowColor;
  final Color? darkTextColor;
  final Color? sideNavBackground;
  final Color? sideNavListLabel;
  final Color? pageHeader;
  final Color? sideNavListBGSelectedState;
  final Color? sideNavListBGDefaultState;
  final Color? sideNavListInnerShadow1;
  final Color? sideNavListInnerShadow2;
  final Color? scrollBarHandle;
  final Color? scrollArea;
  final Color? scrollDownInnerShadow1;
  final Color? scrollDownInnerShadow2;
  final Color? scrollDisabled;
  final Color? customerDetailBG;
  final Color? customerDetailInnerShadow1;
  final Color? customerDetailInnerShadow2;
  final Color? cartBG;
  final Color? cartItemCardBG;
  final Color? cartItemCardInnerShadow1;
  final Color? cartItemCardInnerShadow2;
  final Color? totalBackground;
  final Color? totalInnerShadow1;
  final Color? footerBG1;
  final Color? footerBG2;
  final Color? footerBG3;
  final Color? footerBG4;
  final Color? footerBG5;
  final Color? dialogBG;
  final Color? dialogHeaderBG;
  final Color? dialogHeaderInnerShadow;
  final Color? dialogFooterInnerShadow;
  final Color? tableRow1;
  final Color? tableRowSelectedState1;
  final Color? tableRowSelectedState2;
  final Color? tableRow2;
  final Color? tableRowSelectState2;
  final Color? textField1;
  final Color? textField1active;
  final Color? textField1disabled;
  final Color? textField1Error;
  final Color? textbox2;
  final Color? textField3;
  final Color? textField4;
  final Color? textField3Active;
  final Color? checkboxLight;
  final Color? checkboxDark;
  final Color? button1BG1;
  final Color? button1InnerShadow1;
  final Color? button1InnerShadow2;
  final Color? button2BG1;
  final Color? button2InnerShadow1;
  final Color? button2InnerShadow2;
  final Color? darkIcon;
  final Color? lightIcon;
  final Color? disabledIcon;
  final Color? primaryTextColor1;
  final Color? primaryTextColor2;
  final Color? secondaryTextColor;
  final Color? light1;
  final Color? light2;
  final TextStyle? cardTextSelectedLight;
  final TextStyle? cardTextUnselectedLight;
  final TextStyle? heading1;
  final TextStyle? heading2;
  final TextStyle? heading3;
  final TextStyle? heading4;
  final TextStyle? heading5;
  final TextStyle? heading6;
  final TextStyle? headingLight1;
  final TextStyle? headingLight2;
  final TextStyle? headingLight3;
  final TextStyle? headingLight4;
  final TextStyle? headingLight5;
  final TextStyle? headingLight6;
  final TextStyle? title1;
  final TextStyle? title2;
  final TextStyle? title3;
  final TextStyle? titleLight1;
  final TextStyle? titleLight2;
  final TextStyle? titleLight3;
  final TextStyle? subtitle1;
  final TextStyle? subtitle2;
  final TextStyle? subtitle3;
  final TextStyle? subtitleLight1;
  final TextStyle? subtitleLight2;
  final TextStyle? subtitleLight3;
  final TextStyle? description1;
  final TextStyle? description2;
  final TextStyle? description3;
  final TextStyle? descriptionLight1;
  final TextStyle? descriptionLight2;
  final TextStyle? descriptionLight3;
  final TextStyle? descriptionLight4;
  final TextStyle? textFieldStyle;
  final TextStyle? primaryButtonTextStyle;
  final TextStyle? textFieldErrorStyle;
  final TextStyle? textFieldHintStyle;

  @override
  ThemeExtension<SemnoxTheme> copyWith({
    Color? backGroundColor,
    Color? dividerColor,
    Color? primaryColor,
    Color? secondaryColor,
    Color? errorTextColor,
    Color? containerBgColor,
    Color? primaryButtonColor,
    Color? cardStateSelectedLight,
    Color? cardStateUnselectedLight,
    Color? shadowColor,
    Color? darkTextColor,
    Color? sideNavBackground,
    Color? sideNavListLabel,
    Color? pageHeader,
    Color? sideNavListBGSelectedState,
    Color? sideNavListBGDefaultState,
    Color? sideNavListInnerShadow1,
    Color? sideNavListInnerShadow2,
    Color? scrollBarHandle,
    Color? scrollArea,
    Color? scrollDownInnerShadow1,
    Color? scrollDownInnerShadow2,
    Color? scrollDisabled,
    Color? customerDetailBG,
    Color? customerDetailInnerShadow1,
    Color? customerDetailInnerShadow2,
    Color? cartBG,
    Color? cartItemCardBG,
    Color? cartItemCardInnerShadow1,
    Color? cartItemCardInnerShadow2,
    Color? totalBackground,
    Color? totalInnerShadow1,
    Color? footerBG1,
    Color? footerBG2,
    Color? footerBG3,
    Color? footerBG4,
    Color? footerBG5,
    Color? dialogBG,
    Color? dialogHeaderBG,
    Color? dialogHeaderInnerShadow,
    Color? dialogFooterInnerShadow,
    Color? tableRow1,
    Color? tableRowSelectedState1,
    Color? tableRowSelectedState2,
    Color? tableRow2,
    Color? tableRowSelectState2,
    Color? textField1,
    Color? textField1active,
    Color? textField1disabled,
    Color? textField1Error,
    Color? textbox2,
    Color? textField3,
    Color? textField4,
    Color? textField3Active,
    Color? checkboxLight,
    Color? checkboxDark,
    Color? button1BG1,
    Color? button1InnerShadow1,
    Color? button1InnerShadow2,
    Color? button2BG1,
    Color? button2InnerShadow1,
    Color? button2InnerShadow2,
    Color? darkIcon,
    Color? lightIcon,
    Color? disabledIcon,
    Color? primaryTextColor1,
    Color? primaryTextColor2,
    Color? secondaryTextColor,
    Color? light1,
    Color? light2,
    TextStyle? heading1,
    TextStyle? heading2,
    TextStyle? heading3,
    TextStyle? heading4,
    TextStyle? heading5,
    TextStyle? heading6,
    TextStyle? headingLight1,
    TextStyle? headingLight2,
    TextStyle? headingLight3,
    TextStyle? headingLight4,
    TextStyle? headingLight5,
    TextStyle? headingLight6,
    TextStyle? title1,
    TextStyle? title2,
    TextStyle? title3,
    TextStyle? titleLight1,
    TextStyle? titleLight2,
    TextStyle? titleLight3,
    TextStyle? subtitle1,
    TextStyle? subtitle2,
    TextStyle? subtitle3,
    TextStyle? subtitleLight1,
    TextStyle? subtitleLight2,
    TextStyle? subtitleLight3,
    TextStyle? description1,
    TextStyle? description2,
    TextStyle? description3,
    TextStyle? descriptionLight1,
    TextStyle? descriptionLight2,
    TextStyle? descriptionLight3,
    TextStyle? descriptionLight4,
    TextStyle? textFieldStyle,
    TextStyle? primaryButtonTextStyle,
    TextStyle? textFieldErrorStyle,
    TextStyle? textFieldHintStyle,
  }) {
    return SemnoxTheme(
        backGroundColor: backGroundColor ?? this.backGroundColor,
        dividerColor: dividerColor ?? this.dividerColor,
        primaryColor: primaryColor ?? this.primaryColor,
        secondaryColor: secondaryColor ?? this.secondaryColor,
        errorTextColor: errorTextColor ?? this.errorTextColor,
        containerBgColor: containerBgColor ?? this.containerBgColor,
        primaryButtonColor: primaryButtonColor ?? this.primaryButtonColor,
        cardStateSelectedLight: cardStateSelectedLight ?? this.cardStateSelectedLight,
        cardStateUnselectedLight: cardStateUnselectedLight ?? this.cardStateUnselectedLight,
        shadowColor: shadowColor ?? this.shadowColor,
        cardTextSelectedLight: cardTextSelectedLight ?? this.cardTextSelectedLight,
        cardTextUnselectedLight: cardTextUnselectedLight ?? this.cardTextUnselectedLight,
        darkTextColor: darkTextColor ?? this.darkTextColor,
        sideNavBackground: sideNavBackground ?? this.sideNavBackground,
        sideNavListLabel: sideNavBackground ?? this.sideNavBackground,
        pageHeader: pageHeader ?? this.pageHeader,
        sideNavListBGSelectedState: sideNavListBGSelectedState ?? this.sideNavListBGSelectedState,
        sideNavListBGDefaultState: sideNavListBGDefaultState ?? this.sideNavListBGDefaultState,
        sideNavListInnerShadow1: sideNavListInnerShadow1 ?? this.sideNavListInnerShadow1,
        sideNavListInnerShadow2: sideNavListInnerShadow2 ?? this.sideNavListInnerShadow2,
        scrollBarHandle: scrollBarHandle ?? this.scrollBarHandle,
        scrollArea: scrollArea ?? this.scrollArea,
        scrollDownInnerShadow1: scrollDownInnerShadow1 ?? scrollDownInnerShadow1,
        scrollDownInnerShadow2: scrollDownInnerShadow2 ?? scrollDownInnerShadow2,
        scrollDisabled: scrollDisabled ?? this.scrollDisabled,
        customerDetailBG: customerDetailBG ?? this.customerDetailBG,
        customerDetailInnerShadow1: customerDetailInnerShadow1 ?? this.customerDetailInnerShadow1,
        customerDetailInnerShadow2: customerDetailInnerShadow2 ?? this.customerDetailInnerShadow2,
        cartBG: cartBG ?? this.cartBG,
        cartItemCardBG: cartItemCardBG ?? this.cartItemCardBG,
        cartItemCardInnerShadow1: cartItemCardInnerShadow1 ?? this.cartItemCardInnerShadow1,
        cartItemCardInnerShadow2: cartItemCardInnerShadow2 ?? this.cartItemCardInnerShadow2,
        totalBackground: totalBackground ?? this.totalBackground,
        totalInnerShadow1: totalInnerShadow1 ?? this.totalInnerShadow1,
        footerBG1: footerBG1 ?? this.footerBG1,
        footerBG2: footerBG2 ?? this.footerBG2,
        footerBG3: footerBG3 ?? this.footerBG3,
        footerBG4: footerBG4 ?? this.footerBG4,
        footerBG5: footerBG5 ?? this.footerBG5,
        dialogBG: dialogBG ?? this.dialogBG,
        dialogHeaderBG: dialogHeaderBG ?? this.dialogHeaderBG,
        dialogHeaderInnerShadow: dialogHeaderInnerShadow ?? this.dialogHeaderInnerShadow,
        dialogFooterInnerShadow: dialogFooterInnerShadow ?? this.dialogFooterInnerShadow,
        tableRow1: tableRow1 ?? this.tableRow1,
        tableRowSelectedState1: tableRowSelectedState1 ?? this.tableRowSelectedState1,
        tableRowSelectedState2: tableRowSelectedState2 ?? this.tableRowSelectedState2,
        tableRow2: tableRow2 ?? this.tableRow2,
        tableRowSelectState2: tableRowSelectState2 ?? this.tableRowSelectState2,
        textField1: textField1 ?? this.textField1,
        textField1active: textField1active ?? this.textField1active,
        textField1disabled: textField1disabled ?? this.textField1disabled,
        textField1Error: textField1Error ?? this.textField1Error,
        textbox2: textbox2 ?? this.textbox2,
        textField3: textField3 ?? this.textField3,
        textField4: textField4 ?? this.textField4,
        textField3Active: textField3Active ?? this.textField3Active,
        checkboxLight: checkboxLight ?? this.checkboxLight,
        checkboxDark: checkboxDark ?? this.checkboxDark,
        button1BG1: button1BG1 ?? this.button1BG1,
        button1InnerShadow1: button1InnerShadow1 ?? this.button1InnerShadow1,
        button1InnerShadow2: button1InnerShadow2 ?? this.button1InnerShadow2,
        button2BG1: button2BG1 ?? this.button2BG1,
        button2InnerShadow1: button2InnerShadow1 ?? this.button2InnerShadow1,
        button2InnerShadow2: button2InnerShadow2 ?? this.button2InnerShadow2,
        darkIcon: darkIcon ?? this.darkIcon,
        lightIcon: lightIcon ?? this.lightIcon,
        disabledIcon: disabledIcon ?? this.disabledIcon,
        primaryTextColor1: primaryTextColor1 ?? this.primaryTextColor1,
        primaryTextColor2: primaryTextColor2 ?? this.primaryTextColor2,
        secondaryTextColor: secondaryTextColor ?? this.secondaryTextColor,
        light1: light1 ?? this.light1,
        light2: light2 ?? this.light2,
        heading1: heading1 ?? this.heading1,
        heading2: heading2 ?? this.heading2,
        heading3: heading3 ?? this.heading3,
        heading4: heading4 ?? this.heading4,
        heading5: heading5 ?? this.heading5,
        heading6: heading6 ?? this.heading6,
        headingLight1: headingLight1 ?? this.headingLight1,
        headingLight2: headingLight2 ?? this.headingLight2,
        headingLight3: headingLight3 ?? this.headingLight3,
        headingLight4: headingLight4 ?? this.headingLight4,
        headingLight5: headingLight5 ?? this.headingLight5,
        headingLight6: headingLight6 ?? this.headingLight6,
        title1: title1 ?? this.title1,
        title2: title2 ?? this.title2,
        title3: title3 ?? this.title3,
        titleLight1: titleLight1 ?? this.titleLight1,
        titleLight2: titleLight2 ?? this.titleLight2,
        titleLight3: titleLight3 ?? this.titleLight3,
        subtitle1: subtitle1 ?? this.subtitle1,
        subtitle2: subtitle2 ?? this.subtitle2,
        subtitle3: subtitle3 ?? this.subtitle3,
        subtitleLight1: subtitleLight1 ?? this.subtitleLight1,
        subtitleLight2: subtitleLight2 ?? this.subtitleLight2,
        subtitleLight3: subtitleLight3 ?? this.subtitleLight3,
        description1: description1 ?? this.description1,
        description2: description2 ?? this.description2,
        description3: description3 ?? this.description3,
        descriptionLight1: descriptionLight1 ?? this.descriptionLight1,
        descriptionLight2: descriptionLight2 ?? this.descriptionLight2,
        descriptionLight3: descriptionLight3 ?? this.descriptionLight3,
        descriptionLight4: descriptionLight4 ?? this.descriptionLight4,
        textFieldStyle: textFieldStyle ?? this.textFieldStyle,
        primaryButtonTextStyle: primaryButtonTextStyle ?? this.primaryButtonTextStyle,
        textFieldErrorStyle: textFieldErrorStyle ?? this.textFieldErrorStyle,
        textFieldHintStyle: textFieldHintStyle ?? this.textFieldHintStyle);
  }

  @override
  ThemeExtension<SemnoxTheme> lerp(covariant ThemeExtension<SemnoxTheme>? other, double t) {
    if (other is! SemnoxTheme) {
      return this;
    }
    return SemnoxTheme(
        backGroundColor: Color.lerp(backGroundColor, other.backGroundColor, t),
        dividerColor: Colors.grey,
        primaryColor: Colors.white,
        secondaryColor: Colors.black,
        errorTextColor: Colors.deepOrange,
        containerBgColor: Colors.white,
        primaryButtonColor: Colors.grey,
        cardStateSelectedLight: Color.lerp(cardStateSelectedLight, other.cardStateSelectedLight, t),
        cardStateUnselectedLight: Color.lerp(cardStateUnselectedLight, other.cardStateUnselectedLight, t),
        shadowColor: Color.lerp(shadowColor, other.shadowColor, t),
        cardTextSelectedLight: TextStyle.lerp(cardTextSelectedLight, other.cardTextSelectedLight, t),
        cardTextUnselectedLight: TextStyle.lerp(cardTextUnselectedLight, other.cardTextUnselectedLight, t),
        darkTextColor: Color.lerp(darkTextColor, other.darkTextColor, t),
        sideNavBackground: Color.lerp(sideNavBackground, other.sideNavBackground, t),
        sideNavListLabel: Color.lerp(sideNavListLabel, other.sideNavListLabel, t),
        pageHeader: Color.lerp(pageHeader, other.pageHeader, t),
        sideNavListBGSelectedState: Color.lerp(sideNavListBGSelectedState, other.sideNavListBGSelectedState, t),
        sideNavListBGDefaultState: Color.lerp(sideNavListBGDefaultState, other.sideNavListBGDefaultState, t),
        sideNavListInnerShadow1: Color.lerp(sideNavListInnerShadow1, other.sideNavListInnerShadow1, t),
        sideNavListInnerShadow2: Color.lerp(sideNavListInnerShadow2, other.sideNavListInnerShadow2, t),
        scrollBarHandle: Color.lerp(scrollBarHandle, other.scrollBarHandle, t),
        scrollArea: Color.lerp(scrollArea, other.scrollArea, t),
        scrollDownInnerShadow1: Color.lerp(scrollDownInnerShadow1, other.scrollDownInnerShadow1, t),
        scrollDownInnerShadow2: Color.lerp(scrollDownInnerShadow2, other.scrollDownInnerShadow2, t),
        scrollDisabled: Color.lerp(scrollDisabled, other.scrollDisabled, t),
        customerDetailBG: Color.lerp(customerDetailBG, other.customerDetailBG, t),
        customerDetailInnerShadow1: Color.lerp(customerDetailInnerShadow1, other.customerDetailInnerShadow1, t),
        customerDetailInnerShadow2: Color.lerp(customerDetailInnerShadow2, other.customerDetailInnerShadow2, t),
        cartBG: Color.lerp(cartBG, other.cartBG, t),
        cartItemCardBG: Color.lerp(cartItemCardBG, other.cartItemCardBG, t),
        cartItemCardInnerShadow1: Color.lerp(cartItemCardInnerShadow1, other.cartItemCardInnerShadow1, t),
        cartItemCardInnerShadow2: Color.lerp(cartItemCardInnerShadow2, other.cartItemCardInnerShadow2, t),
        totalBackground: Color.lerp(totalBackground, other.totalBackground, t),
        totalInnerShadow1: Color.lerp(totalInnerShadow1, other.totalInnerShadow1, t),
        footerBG1: Color.lerp(footerBG1, other.footerBG1, t),
        footerBG2: Color.lerp(footerBG2, other.footerBG2, t),
        footerBG3: Color.lerp(footerBG3, other.footerBG3, t),
        footerBG4: Color.lerp(footerBG4, other.footerBG4, t),
        footerBG5: Color.lerp(footerBG5, other.footerBG5, t),
        dialogBG: Color.lerp(dialogBG, other.dialogBG, t),
        dialogHeaderBG: Color.lerp(dialogHeaderBG, other.dialogHeaderBG, t),
        dialogHeaderInnerShadow: Color.lerp(dialogHeaderInnerShadow, other.dialogHeaderInnerShadow, t),
        dialogFooterInnerShadow: Color.lerp(dialogFooterInnerShadow, other.dialogFooterInnerShadow, t),
        tableRow1: Color.lerp(tableRow1, other.tableRow1, t),
        tableRowSelectedState1: Color.lerp(tableRowSelectedState1, other.tableRowSelectedState1, t),
        tableRowSelectedState2: Color.lerp(tableRowSelectedState2, other.tableRowSelectedState2, t),
        tableRow2: Color.lerp(tableRow2, other.tableRow2, t),
        tableRowSelectState2: Color.lerp(tableRowSelectState2, other.tableRowSelectState2, t),
        textField1: Color.lerp(textField1, other.textField1, t),
        textField1active: Color.lerp(textField1active, other.textField1active, t),
        textField1disabled: Color.lerp(textField1disabled, other.textField1disabled, t),
        textField1Error: Color.lerp(textField1Error, other.textField1Error, t),
        textbox2: Color.lerp(textbox2, other.textbox2, t),
        textField3: Color.lerp(textField3, other.textField3, t),
        textField4: Color.lerp(textField4, other.textField4, t),
        textField3Active: Color.lerp(textField3Active, other.textField3Active, t),
        checkboxLight: Color.lerp(checkboxLight, other.checkboxLight, t),
        checkboxDark: Color.lerp(checkboxDark, other.checkboxDark, t),
        button1BG1: Color.lerp(button1BG1, other.button1BG1, t),
        button1InnerShadow1: Color.lerp(button1InnerShadow1, other.button1InnerShadow1, t),
        button1InnerShadow2: Color.lerp(button1InnerShadow2, other.button1InnerShadow2, t),
        button2BG1: Color.lerp(button2BG1, other.button2BG1, t),
        button2InnerShadow1: Color.lerp(button2InnerShadow1, other.button2InnerShadow1, t),
        button2InnerShadow2: Color.lerp(button2InnerShadow2, other.button2InnerShadow2, t),
        darkIcon: Color.lerp(darkIcon, other.darkIcon, t),
        lightIcon: Color.lerp(lightIcon, other.lightIcon, t),
        disabledIcon: Color.lerp(disabledIcon, other.disabledIcon, t),
        primaryTextColor1: Color.lerp(primaryTextColor1, other.primaryTextColor1, t),
        primaryTextColor2: Color.lerp(primaryTextColor2, other.primaryTextColor2, t),
        secondaryTextColor: Color.lerp(secondaryTextColor, other.secondaryTextColor, t),
        light1: Color.lerp(light1, other.light1, t),
        light2: Color.lerp(light2, other.light2, t),
        heading1: TextStyle.lerp(heading1, other.heading1, t),
        heading2: TextStyle.lerp(heading2, other.heading2, t),
        heading3: TextStyle.lerp(heading3, other.heading3, t),
        heading4: TextStyle.lerp(heading4, other.heading4, t),
        heading5: TextStyle.lerp(heading5, other.heading5, t),
        heading6: TextStyle.lerp(heading6, other.heading6, t),
        headingLight1: TextStyle.lerp(headingLight1, other.headingLight1, t),
        headingLight2: TextStyle.lerp(headingLight2, other.headingLight2, t),
        headingLight3: TextStyle.lerp(headingLight3, other.headingLight3, t),
        headingLight4: TextStyle.lerp(headingLight4, other.headingLight4, t),
        headingLight5: TextStyle.lerp(headingLight5, other.headingLight5, t),
        headingLight6: TextStyle.lerp(headingLight6, other.headingLight6, t),
        title1: TextStyle.lerp(title1, other.title1, t),
        title2: TextStyle.lerp(title2, other.title2, t),
        title3: TextStyle.lerp(title3, other.title3, t),
        titleLight1: TextStyle.lerp(titleLight1, other.titleLight1, t),
        titleLight2: TextStyle.lerp(titleLight2, other.titleLight2, t),
        titleLight3: TextStyle.lerp(titleLight3, other.titleLight3, t),
        subtitle1: TextStyle.lerp(subtitle1, other.subtitle1, t),
        subtitle2: TextStyle.lerp(subtitle2, other.subtitle2, t),
        subtitle3: TextStyle.lerp(subtitle3, other.subtitle3, t),
        subtitleLight1: TextStyle.lerp(subtitleLight1, other.subtitleLight1, t),
        subtitleLight2: TextStyle.lerp(subtitleLight2, other.subtitleLight2, t),
        subtitleLight3: TextStyle.lerp(subtitleLight3, other.subtitleLight3, t),
        description1: TextStyle.lerp(description1, other.description1, t),
        description2: TextStyle.lerp(description2, other.description2, t),
        description3: TextStyle.lerp(description3, other.description3, t),
        descriptionLight1: TextStyle.lerp(descriptionLight1, other.descriptionLight1, t),
        descriptionLight2: TextStyle.lerp(descriptionLight2, other.descriptionLight2, t),
        descriptionLight3: TextStyle.lerp(descriptionLight3, other.descriptionLight3, t),
        descriptionLight4: TextStyle.lerp(descriptionLight4, other.descriptionLight4, t),
        textFieldStyle: TextStyle.lerp(textFieldStyle, other.textFieldStyle, t),
        primaryButtonTextStyle: TextStyle.lerp(primaryButtonTextStyle, other.primaryButtonTextStyle, t),
        textFieldErrorStyle: TextStyle.lerp(textFieldErrorStyle, other.textFieldErrorStyle, t),
        textFieldHintStyle: TextStyle.lerp(textFieldHintStyle, other.textFieldHintStyle, t));
  }

  SemnoxTheme(
      {required this.backGroundColor,
      required this.dividerColor,
      required this.primaryColor,
      required this.secondaryColor,
      required this.errorTextColor,
      required this.containerBgColor,
      required this.primaryButtonColor,
      required this.cardStateSelectedLight,
      required this.cardStateUnselectedLight,
      required this.shadowColor,
      required this.darkTextColor,
      required this.sideNavBackground,
      required this.sideNavListLabel,
      required this.pageHeader,
      required this.sideNavListBGSelectedState,
      required this.sideNavListBGDefaultState,
      required this.sideNavListInnerShadow1,
      required this.sideNavListInnerShadow2,
      required this.scrollBarHandle,
      required this.scrollArea,
      required this.scrollDownInnerShadow1,
      required this.scrollDownInnerShadow2,
      required this.scrollDisabled,
      required this.customerDetailBG,
      required this.customerDetailInnerShadow1,
      required this.customerDetailInnerShadow2,
      required this.cartBG,
      required this.cartItemCardBG,
      required this.cartItemCardInnerShadow1,
      required this.cartItemCardInnerShadow2,
      required this.totalBackground,
      required this.totalInnerShadow1,
      required this.footerBG1,
      required this.footerBG2,
      required this.footerBG3,
      required this.footerBG4,
        required this.footerBG5,
        required this.dialogBG,
        required this.dialogHeaderBG,
        required this.dialogHeaderInnerShadow,
        required this.dialogFooterInnerShadow,
        required this.tableRow1,
        required this.tableRowSelectedState1,
        required this.tableRowSelectedState2,
        required this.tableRow2,
        required this.tableRowSelectState2,
        required this.textField1,
        required this.textField1active,
        required this.textField1disabled,
        required this.textField1Error,
        required this.textbox2,
        required this.textField3,
        required this.textField4,
        required this.textField3Active,
        required this.checkboxLight,
        required this.checkboxDark,
        required this.button1BG1,
        required this.button1InnerShadow1,
        required this.button1InnerShadow2,
        required this.button2BG1,
        required this.button2InnerShadow1,
        required this.button2InnerShadow2,
        required this.darkIcon,
        required this.lightIcon,
        required this.disabledIcon,
        required this.primaryTextColor1,
        required this.primaryTextColor2,
        required this.secondaryTextColor,
        required this.light1,
        required this.light2,
        required this.cardTextSelectedLight,
        required this.cardTextUnselectedLight,
        required this.heading1,
        required this.heading2,
        required this.heading3,
        required this.heading4,
        required this.heading5,
        required this.heading6,
        required this.headingLight1,
        required this.headingLight2,
        required this.headingLight3,
        required this.headingLight4,
        required this.headingLight5,
        required this.headingLight6,
        required this.title1,
        required this.title2,
        required this.title3,
        required this.titleLight1,
        required this.titleLight2,
        required this.titleLight3,
        required this.subtitle1,
        required this.subtitle2,
        required this.subtitle3,
        required this.subtitleLight1,
        required this.subtitleLight2,
        required this.subtitleLight3,
        required this.description1,
        required this.description2,
        required this.description3,
        required this.descriptionLight1,
        required this.descriptionLight2,
        required this.descriptionLight3,
        required this.descriptionLight4,
        required this.textFieldStyle,
        required this.primaryButtonTextStyle,
        required this.textFieldErrorStyle,
        required this.textFieldHintStyle});
}

ThemeData semnoxThemeData(BuildContext context, bool isDarkMode) {
  return isDarkMode ? ThemeData.dark().copyWith(
    // add up theme customizations if required
    extensions: <ThemeExtension<dynamic>>[
      semnoxDarkTheme,
    ],
  ): ThemeData.light().copyWith(
    // add up theme customizations if required
    extensions: <ThemeExtension<dynamic>>[
      semnoxTheme,
    ],
  );
}

SemnoxTheme semnoxTheme = SemnoxTheme(
    backGroundColor: ThemesProvider.getColor("backgroundColor"),
    dividerColor: Colors.grey,
    primaryColor: Colors.white,
    secondaryColor: Colors.black,
    errorTextColor: Colors.deepOrange,
    containerBgColor: Colors.white,
    primaryButtonColor: Colors.grey,
    cardStateSelectedLight: ThemesProvider.getColor("cardStateSelectedLight"),
    cardStateUnselectedLight: ThemesProvider.getColor("cardStateUnselectedLight"),
    shadowColor: ThemesProvider.getColor("shadowColor"),
    darkTextColor: ThemesProvider.getColor("darkTextColor"),
    sideNavBackground: ThemesProvider.getColor("secondaryColor"),
    sideNavListLabel: ThemesProvider.getColor("sideNavListLabel"),
    pageHeader: ThemesProvider.getColor("pageHeader"),
    sideNavListBGSelectedState: ThemesProvider.getColor("sideNavListBGSelectedState"),
    sideNavListBGDefaultState: ThemesProvider.getColor("secondaryColor"),
    sideNavListInnerShadow1: ThemesProvider.getColor("sideNavListInnerShadow1"),
    sideNavListInnerShadow2: ThemesProvider.getColor("sideNavListInnerShadow2"),
    scrollBarHandle: ThemesProvider.getColor("scrollBarHandle"),
    scrollArea: ThemesProvider.getColor("scrollArea"),
    scrollDownInnerShadow1: ThemesProvider.getColor("scrollDownInnerShadow1"),
    scrollDownInnerShadow2: ThemesProvider.getColor("scrollDownInnerShadow2"),
    scrollDisabled: ThemesProvider.getColor("scrollDisabled"),
    customerDetailBG: ThemesProvider.getColor("customerDetailBG"),
    customerDetailInnerShadow1: ThemesProvider.getColor("customerDetailInnerShadow1"),
    customerDetailInnerShadow2: ThemesProvider.getColor("customerDetailInnerShadow2"),
    cartBG: ThemesProvider.getColor("cartBG"),
    cartItemCardBG: ThemesProvider.getColor("cartItemCardBG"),
    cartItemCardInnerShadow1: ThemesProvider.getColor("cartItemCardInnerShadow1"),
    cartItemCardInnerShadow2: ThemesProvider.getColor("cartItemCardInnerShadow2"),
    totalBackground: ThemesProvider.getColor("totalBackground"),
    totalInnerShadow1: ThemesProvider.getColor("totalInnerShadow1"),
    footerBG1: ThemesProvider.getColor("footerBG1"),
    footerBG2: ThemesProvider.getColor("footerBG2"),
    footerBG3: ThemesProvider.getColor("footerBG3"),
    footerBG4: ThemesProvider.getColor("footerBG4"),
    footerBG5: ThemesProvider.getColor("footerBG5"),
    dialogBG: ThemesProvider.getColor("dialogBG"),
    dialogHeaderBG: ThemesProvider.getColor("dialogHeaderBG"),
    dialogHeaderInnerShadow: ThemesProvider.getColor("dialogHeaderInnerShadow"),
    dialogFooterInnerShadow: ThemesProvider.getColor("dialogFooterInnerShadow"),
    tableRow1: ThemesProvider.getColor("tableRow1"),
    tableRowSelectedState1: ThemesProvider.getColor("tableRowSelectedState1"),
    tableRowSelectedState2: ThemesProvider.getColor("tableRowSelectedState2"),
    tableRow2: ThemesProvider.getColor("tableRow2"),
    tableRowSelectState2: ThemesProvider.getColor("tableRowSelectState2"),
    textField1: ThemesProvider.getColor("textField1"),
    textField1active: ThemesProvider.getColor("secondaryColor"),
    textField1disabled: ThemesProvider.getColor("textField1disabled"),
    textField1Error: ThemesProvider.getColor("textField1Error"),
    textbox2: ThemesProvider.getColor("textbox2"),
    textField3: ThemesProvider.getColor("textField3"),
    textField4: ThemesProvider.getColor("textField4"),
    textField3Active: ThemesProvider.getColor("secondaryColor"),
    checkboxLight: ThemesProvider.getColor("checkboxLight"),
    checkboxDark: ThemesProvider.getColor("secondaryColor"),
    button1BG1: ThemesProvider.getColor("button1BG1"),
    button1InnerShadow1: ThemesProvider.getColor("button1InnerShadow1"),
    button1InnerShadow2: ThemesProvider.getColor("button1InnerShadow2"),
    button2BG1: ThemesProvider.getColor("button2BG1"),
    button2InnerShadow1: ThemesProvider.getColor("button2InnerShadow1"),
    button2InnerShadow2: ThemesProvider.getColor("button2InnerShadow2"),
    darkIcon: ThemesProvider.getColor("secondaryColor"),
    lightIcon: ThemesProvider.getColor("lightIcon"),
    disabledIcon: ThemesProvider.getColor("disabledIcon"),
    primaryTextColor1: ThemesProvider.getColor("primaryTextColor1"),
    primaryTextColor2: ThemesProvider.getColor("secondaryColor"),
    secondaryTextColor: ThemesProvider.getColor("secondaryTextColor"),
    light1: ThemesProvider.getColor("light1"),
    light2: ThemesProvider.getColor("light2"),
    cardTextSelectedLight: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    cardTextUnselectedLight: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    heading1: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("secondaryColor"),
      fontSize: 32.0,
      fontWeight: FontWeight.w700,
    ),
    heading2: TextStyle(fontSize: 36, fontWeight: FontWeight.w400, fontFamily: 'RobotoCondensed', color: Colors.black),
    heading3: TextStyle(fontSize: 36, fontWeight: FontWeight.w400, fontFamily: 'RobotoCondensed', color: Colors.black),
    heading4: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, fontFamily: 'RobotoCondensed', color: Colors.black),
    heading5: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, fontFamily: 'RobotoCondensed', color: Colors.white),
    heading6: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, fontFamily: 'RobotoCondensed', color: Colors.black),
    headingLight1:
    TextStyle(fontSize: 36, fontWeight: FontWeight.w400, fontFamily: 'RobotoCondensed', color: Colors.white),
    headingLight2:
    TextStyle(fontSize: 36, fontWeight: FontWeight.w400, fontFamily: 'RobotoCondensed', color: Colors.white),
    headingLight3:
    TextStyle(fontSize: 36, fontWeight: FontWeight.w400, fontFamily: 'RobotoCondensed', color: Colors.white),
    headingLight4:
    TextStyle(fontSize: 20, fontWeight: FontWeight.w700, fontFamily: 'RobotoCondensed', color: Colors.white),
    headingLight5:
    TextStyle(fontSize: 16, fontWeight: FontWeight.w700, fontFamily: 'RobotoCondensed', color: Colors.black),
    headingLight6:
    TextStyle(fontSize: 24, fontWeight: FontWeight.w400, fontFamily: 'RobotoCondensed', color: Colors.white),
    title1: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, fontFamily: 'RobotoCondensed', color: Colors.black),
    title2: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, fontFamily: 'RobotoCondensed', color: Colors.black),
    title3: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, fontFamily: 'RobotoCondensed', color: Colors.black),
    titleLight1: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("primaryColor"),
      fontSize: 22.0,
      fontWeight: FontWeight.w400,
    ),
    titleLight2: TextStyle(
      color: ThemesProvider.getColor("primaryColor"),
      fontWeight: FontWeight.w700,
      fontSize: 20,
      fontFamily: 'RobotoCondensed',
    ),
    titleLight3: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("primaryColor"),
      fontSize: 19.0,
      fontWeight: FontWeight.w700,
    ),
    subtitle1: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("secondaryColor"),
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
    ),
    subtitle2: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("secondaryColor"),
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
    ),
    subtitle3: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("secondaryColor"),
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
    ),
    subtitleLight1: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("primaryColor"),
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
    ),
    subtitleLight2: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("primaryColor"),
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
    ),
    subtitleLight3: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("primaryColor"),
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
    ),
    description1: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("secondaryColor"),
      fontSize: 12.0,
      fontWeight: FontWeight.w700,
    ),
    description2: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("secondaryColor"),
      fontSize: 12.0,
      fontWeight: FontWeight.w600,
    ),
    description3: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("secondaryColor"),
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
    ),
    descriptionLight1: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("primaryColor"),
      fontSize: 12.0,
      fontWeight: FontWeight.w700,
    ),
    descriptionLight2: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("primaryColor"),
      fontSize: 12.0,
      fontWeight: FontWeight.w600,
    ),
    descriptionLight3: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("primaryColor"),
      fontSize: 10.0,
      fontWeight: FontWeight.w600,
    ),
    descriptionLight4: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("primaryColor"),
      fontSize: 8.0,
      fontWeight: FontWeight.w600,
    ),
    textFieldStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: 'RobotoCondensed',
        color: ThemesProvider.getColor("secondaryColor")),
    primaryButtonTextStyle:
    TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'RobotoCondensed', color: Colors.black),
    textFieldErrorStyle:
    TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'RobotoCondensed', color: Colors.black),
    textFieldHintStyle: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("darkGrey2"),
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
    ));

SemnoxTheme semnoxDarkTheme = SemnoxTheme(
    backGroundColor: ThemesProvider.getColor("backgroundColor"),
    dividerColor: Colors.grey,
    primaryColor: Colors.black,
    secondaryColor: Colors.white,
    errorTextColor: Colors.deepOrange,
    containerBgColor: Colors.white,
    primaryButtonColor: Colors.grey,
    cardStateSelectedLight: ThemesProvider.getColor("cardStateSelectedLight"),
    cardStateUnselectedLight: ThemesProvider.getColor("cardStateUnselectedLight"),
    shadowColor: ThemesProvider.getColor("shadowColor"),
    darkTextColor: ThemesProvider.getColor("darkTextColor"),
    sideNavBackground: ThemesProvider.getColor("secondaryColor"),
    sideNavListLabel: ThemesProvider.getColor("sideNavListLabel"),
    pageHeader: ThemesProvider.getColor("pageHeader"),
    sideNavListBGSelectedState: ThemesProvider.getColor("sideNavListBGSelectedState"),
    sideNavListBGDefaultState: ThemesProvider.getColor("secondaryColor"),
    sideNavListInnerShadow1: ThemesProvider.getColor("sideNavListInnerShadow1"),
    sideNavListInnerShadow2: ThemesProvider.getColor("sideNavListInnerShadow2"),
    scrollBarHandle: ThemesProvider.getColor("scrollBarHandle"),
    scrollArea: ThemesProvider.getColor("scrollArea"),
    scrollDownInnerShadow1: ThemesProvider.getColor("scrollDownInnerShadow1"),
    scrollDownInnerShadow2: ThemesProvider.getColor("scrollDownInnerShadow2"),
    scrollDisabled: ThemesProvider.getColor("scrollDisabled"),
    customerDetailBG: ThemesProvider.getColor("customerDetailBG"),
    customerDetailInnerShadow1: ThemesProvider.getColor("customerDetailInnerShadow1"),
    customerDetailInnerShadow2: ThemesProvider.getColor("customerDetailInnerShadow2"),
    cartBG: ThemesProvider.getColor("cartBG"),
    cartItemCardBG: ThemesProvider.getColor("cartItemCardBG"),
    cartItemCardInnerShadow1: ThemesProvider.getColor("cartItemCardInnerShadow1"),
    cartItemCardInnerShadow2: ThemesProvider.getColor("cartItemCardInnerShadow2"),
    totalBackground: ThemesProvider.getColor("totalBackground"),
    totalInnerShadow1: ThemesProvider.getColor("totalInnerShadow1"),
    footerBG1: ThemesProvider.getColor("footerBG1"),
    footerBG2: ThemesProvider.getColor("footerBG2"),
    footerBG3: ThemesProvider.getColor("footerBG3"),
    footerBG4: ThemesProvider.getColor("footerBG4"),
    footerBG5: ThemesProvider.getColor("footerBG5"),
    dialogBG: ThemesProvider.getColor("dialogBG"),
    dialogHeaderBG: ThemesProvider.getColor("dialogHeaderBG"),
    dialogHeaderInnerShadow: ThemesProvider.getColor("dialogHeaderInnerShadow"),
    dialogFooterInnerShadow: ThemesProvider.getColor("dialogFooterInnerShadow"),
    tableRow1: ThemesProvider.getColor("tableRow1"),
    tableRowSelectedState1: ThemesProvider.getColor("tableRowSelectedState1"),
    tableRowSelectedState2: ThemesProvider.getColor("tableRowSelectedState2"),
    tableRow2: ThemesProvider.getColor("tableRow2"),
    tableRowSelectState2: ThemesProvider.getColor("tableRowSelectState2"),
    textField1: ThemesProvider.getColor("textField1"),
    textField1active: ThemesProvider.getColor("secondaryColor"),
    textField1disabled: ThemesProvider.getColor("textField1disabled"),
    textField1Error: ThemesProvider.getColor("textField1Error"),
    textbox2: ThemesProvider.getColor("textbox2"),
    textField3: ThemesProvider.getColor("textField3"),
    textField4: ThemesProvider.getColor("textField4"),
    textField3Active: ThemesProvider.getColor("secondaryColor"),
    checkboxLight: ThemesProvider.getColor("checkboxLight"),
    checkboxDark: ThemesProvider.getColor("secondaryColor"),
    button1BG1: ThemesProvider.getColor("button1BG1"),
    button1InnerShadow1: ThemesProvider.getColor("button1InnerShadow1"),
    button1InnerShadow2: ThemesProvider.getColor("button1InnerShadow2"),
    button2BG1: ThemesProvider.getColor("button2BG1"),
    button2InnerShadow1: ThemesProvider.getColor("button2InnerShadow1"),
    button2InnerShadow2: ThemesProvider.getColor("button2InnerShadow2"),
    darkIcon: ThemesProvider.getColor("secondaryColor"),
    lightIcon: ThemesProvider.getColor("lightIcon"),
    disabledIcon: ThemesProvider.getColor("disabledIcon"),
    primaryTextColor1: ThemesProvider.getColor("primaryTextColor1"),
    primaryTextColor2: ThemesProvider.getColor("secondaryColor"),
    secondaryTextColor: ThemesProvider.getColor("secondaryTextColor"),
    light1: ThemesProvider.getColor("light1"),
    light2: ThemesProvider.getColor("light2"),
    cardTextSelectedLight: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    cardTextUnselectedLight: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    heading1: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("secondaryColor"),
      fontSize: 32.0,
      fontWeight: FontWeight.w700,
    ),
    heading2: TextStyle(fontSize: 36, fontWeight: FontWeight.w400, fontFamily: 'RobotoCondensed', color: Colors.black),
    heading3: TextStyle(fontSize: 36, fontWeight: FontWeight.w400, fontFamily: 'RobotoCondensed', color: Colors.black),
    heading4: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, fontFamily: 'RobotoCondensed', color: Colors.black),
    heading5: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, fontFamily: 'RobotoCondensed', color: Colors.white),
    heading6: TextStyle(fontSize: 24, fontWeight: FontWeight.w400, fontFamily: 'RobotoCondensed', color: Colors.black),
    headingLight1:
    TextStyle(fontSize: 36, fontWeight: FontWeight.w400, fontFamily: 'RobotoCondensed', color: Colors.white),
    headingLight2:
    TextStyle(fontSize: 36, fontWeight: FontWeight.w400, fontFamily: 'RobotoCondensed', color: Colors.white),
    headingLight3:
    TextStyle(fontSize: 36, fontWeight: FontWeight.w400, fontFamily: 'RobotoCondensed', color: Colors.white),
    headingLight4:
    TextStyle(fontSize: 20, fontWeight: FontWeight.w700, fontFamily: 'RobotoCondensed', color: Colors.white),
    headingLight5:
    TextStyle(fontSize: 16, fontWeight: FontWeight.w700, fontFamily: 'RobotoCondensed', color: Colors.black),
    headingLight6:
    TextStyle(fontSize: 24, fontWeight: FontWeight.w400, fontFamily: 'RobotoCondensed', color: Colors.white),
    title1: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'RobotoCondensed', color: Colors.black),
    title2: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'RobotoCondensed', color: Colors.black),
    title3: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'RobotoCondensed', color: Colors.black),
    titleLight1: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("primaryColor"),
      fontSize: 22.0,
      fontWeight: FontWeight.w400,
    ),
    titleLight2: TextStyle(
      color: ThemesProvider.getColor("primaryColor"),
      fontWeight: FontWeight.w700,
      fontSize: 20,
      fontFamily: 'RobotoCondensed',
    ),
    titleLight3: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("primaryColor"),
      fontSize: 19.0,
      fontWeight: FontWeight.w700,
    ),
    subtitle1: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("secondaryColor"),
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
    ),
    subtitle2: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("secondaryColor"),
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
    ),
    subtitle3: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("secondaryColor"),
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
    ),
    subtitleLight1: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("primaryColor"),
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
    ),
    subtitleLight2: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("primaryColor"),
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
    ),
    subtitleLight3: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("primaryColor"),
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
    ),
    description1: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("secondaryColor"),
      fontSize: 12.0,
      fontWeight: FontWeight.w700,
    ),
    description2: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("secondaryColor"),
      fontSize: 12.0,
      fontWeight: FontWeight.w600,
    ),
    description3: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("secondaryColor"),
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
    ),
    descriptionLight1: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("primaryColor"),
      fontSize: 12.0,
      fontWeight: FontWeight.w700,
    ),
    descriptionLight2: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("primaryColor"),
      fontSize: 12.0,
      fontWeight: FontWeight.w600,
    ),
    descriptionLight3: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("primaryColor"),
      fontSize: 10.0,
      fontWeight: FontWeight.w600,
    ),
    descriptionLight4: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("primaryColor"),
      fontSize: 8.0,
      fontWeight: FontWeight.w600,
    ),
    textFieldStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: 'RobotoCondensed',
        color: ThemesProvider.getColor("secondaryColor")),
    primaryButtonTextStyle:
    TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'RobotoCondensed', color: Colors.black),
    textFieldErrorStyle:
    TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'RobotoCondensed', color: Colors.black),
    textFieldHintStyle: TextStyle(
      fontFamily: 'RobotoCondensed',
      color: ThemesProvider.getColor("darkGrey2"),
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
    ));


*/
/*
*
* --> "secondaryColor": "0xFF101216",
  "sideNavBackground": "0xFF101216",
  "sideNavListBGDefaultState": "0xFF101216",
  "textField1active": "0xFF101216",
  "textField3Active": "0xFF101216",
  "checkboxDark": "0xFF101216",
  "primaryTextColor2": "0xFF101216",
  "darkIcon": "0xFF101216",
*
*
*
* *//*
*/
/*

*/
