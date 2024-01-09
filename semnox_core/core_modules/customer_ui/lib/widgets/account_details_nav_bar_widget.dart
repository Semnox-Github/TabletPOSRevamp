import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountDetailsNavBarWidget extends StatelessWidget {
  final VoidCallback onCreditClicked;
  final VoidCallback onGamesClicked;
  final VoidCallback onDiscountsClicked;
  final VoidCallback onPurchaseActivityClicked;
  final VoidCallback onGameActivityClicked;

  AccountDetailsNavBarWidget(
      {
        Key? key,
        required this.onCreditClicked,
        required this.onGamesClicked,
        required this.onDiscountsClicked,
        required this.onPurchaseActivityClicked,
        required this.onGameActivityClicked
      })
      : super(key: key);

  final _isCashSelected = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: ValueListenableBuilder<bool>(
        valueListenable: _isCashSelected,
        builder: (context, isCashSelected, _) => ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          children: [
            Row(
              children: [
                IconButton(
                  icon: Image.asset('assets/back_arrow_white.png'),
                  iconSize: 20.0,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(width: 16),
                Text("ACCOUNT\nDETAILS",
                    style: GoogleFonts.robotoCondensed(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w700
                ))
              ],
            ),
            const SizedBox(height: 24),
            NavigationItem(
                title: 'Credit Plus',
                isSelected: isCashSelected,
                onTapped: () {
                  onCreditClicked;
                }),
            NavigationItem(
                title: 'Games',
                isSelected: !isCashSelected,
                onTapped: () {
                  onGamesClicked;
                }),
            NavigationItem(
                title: 'Discounts',
                isSelected: !isCashSelected,
                onTapped: () {

                }),
            NavigationItem(
                title: 'Purchase Activity',
                isSelected: !isCashSelected,
                onTapped: () {

                }),
            NavigationItem(
                title: 'Game Activity',
                isSelected: !isCashSelected,
                onTapped: () {

                })
          ],
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
    return InkWell(
      onTap: () {
        onTapped();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF3D3D3D) : Colors.black,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Text(title, style: isSelected ?
        GoogleFonts.robotoCondensed(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700
        ) :
        GoogleFonts.robotoCondensed(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400
        )),
      ),
    );
  }
}
