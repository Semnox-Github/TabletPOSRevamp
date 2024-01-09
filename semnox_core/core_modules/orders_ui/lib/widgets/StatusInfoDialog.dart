import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

import '../utils/AppColors.dart';

class StatusInfoDialog extends StatelessWidget {
  final list;
  StatusInfoDialog(this.list) : super();

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: AlertDialog(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          insetPadding: EdgeInsets.symmetric(horizontal: SizeConfig.getSize(120),vertical: SizeConfig.isBigDevice() ? SizeConfig.getSize(150) : SizeConfig.getSize(50)),
          title: Text("Color and Character legends",
            style: GoogleFonts.robotoCondensed(
                color: theme.secondaryColor,
              fontSize: 15,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: SizeConfig.getSize(30)),
          content: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                Expanded(
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: list.length,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,crossAxisSpacing: 0,mainAxisSpacing: 0,
                      childAspectRatio: 6/0.5,),
                    itemBuilder: (BuildContext context, int i) {
                      return Container(
                        // height: 15, width: 100,
                        child: Row(
                          children: [
                            Container(
                              width: 12,height: 12,
                              decoration: BoxDecoration(
                                  color: list[i].replaceAll('(', '').replaceAll(')', '')
                                      .split(',')[0] == 'ABANDONED' || list[i].replaceAll('(', '').replaceAll(')', '')
                                      .split(',')[0] == 'REVERSED' || list[i].replaceAll('(', '').replaceAll(')', '')
                                      .split(',')[0] == 'REVERSE_INITIATED' ? Colors.white : Color.fromRGBO(
                                      int.parse(list[i].replaceAll('(', '').replaceAll(')', '')
                                          .split(',')[1].toString()),
                                      int.parse(list[i].replaceAll('(', '').replaceAll(')', '')
                                          .split(',')[2].toString()),
                                      int.parse(list[i].replaceAll('(', '').replaceAll(')', '')
                                          .split(',')[3].toString()),
                                      1),
                                  border: Border.all(color: list[i].replaceAll('(', '').replaceAll(')', '')
                                      .split(',')[0] == 'ABANDONED'  || list[i].replaceAll('(', '').replaceAll(')', '')
                                      .split(',')[0] == 'REVERSED' || list[i].replaceAll('(', '').replaceAll(')', '')
                                      .split(',')[0] == 'REVERSE_INITIATED' ? Colors.grey.shade200 : Colors.white)
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Text(
                              list[i].replaceAll('(', '').replaceAll(')', '')
                                  .split(',')[0] == 'ABANDONED' ? "ABANDONED"
                                  : list[i].replaceAll('(', '').replaceAll(')', '')
                                  .split(',')[0] == 'REVERSED' ? "REVERSED"
                                  : list[i].replaceAll('(', '').replaceAll(')', '')
                                  .split(',')[0] == 'REVERSE_INITIATED' ? "REVERSE_INITIATED"
                                  : ((list[i].replaceAll('(', '').replaceAll(')', '')
                                  .split(',')[0])
                                  +
                                  (list[i].replaceAll('(', '').replaceAll(')', '')
                                      .split(',')[4] == '' ? '' : " (${list[i].replaceAll('(', '').replaceAll(')', '')
                                      .split(',')[4]})")),
                              style: TextStyle(fontSize: SizeConfig.getFontSize(14)),),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          actionsPadding: EdgeInsets.only(bottom: SizeConfig.getSize(10)),
          actions: [
            Center(
              child: InkWell(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(
                      color: AppColors.blackColor,
                      borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("OK",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.robotoCondensed(
                            color: Colors.white,
                            fontSize: 14,fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],

          /*Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150,
                    height: 215,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: ScrollPhysics(),
                      itemCount: 12,
                      itemBuilder: (context, i){
                        return GestureDetector(
                          onTap: (){
                            print(list[i]);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 3),
                            child: Row(
                              children: [
                                Container(
                                  width: 12,height: 12,
                                  color: list[i].replaceAll('(', '').replaceAll(')', '')
                                      .split(',')[0] == 'ABANDONED' ? Colors.white : Color.fromRGBO(
                                      int.parse(list[i].replaceAll('(', '').replaceAll(')', '')
                                          .split(',')[1].toString()),
                                      int.parse(list[i].replaceAll('(', '').replaceAll(')', '')
                                          .split(',')[2].toString()),
                                      int.parse(list[i].replaceAll('(', '').replaceAll(')', '')
                                          .split(',')[3].toString()),
                                      1),
                                ),
                                const SizedBox(width: 10,),
                                Text(
                                  list[i].replaceAll('(', '').replaceAll(')', '')
                                      .split(',')[0] == 'ABANDONED' ? "ABANDONED" : ((list[i].replaceAll('(', '').replaceAll(')', '')
                                    .split(',')[0])
                                    +
                                        (list[i].replaceAll('(', '').replaceAll(')', '')
                                    .split(',')[4] == '' ? '' : " (${list[i].replaceAll('(', '').replaceAll(')', '')
                                        .split(',')[4]})")),
                                  style: TextStyle(fontSize: 10),),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Container(
                    width: 150,
                    height: 215,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: ScrollPhysics(),
                      itemCount: 9,
                      itemBuilder: (context, i){
                        return GestureDetector(
                          onTap: (){
                            print(list);
                            print(list.length);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 3),
                            child: Row(
                              children: [
                                Container(
                                  width: 12,height: 12,
                                  decoration: BoxDecoration(
                                    color: list[12+i].replaceAll('(', '').replaceAll(')', '')
                                        .split(',')[0] == 'ABANDONED' || list[12+i].replaceAll('(', '').replaceAll(')', '')
                                        .split(',')[0] == 'REVERSED' || list[12+i].replaceAll('(', '').replaceAll(')', '')
                                        .split(',')[0] == 'REVERSE_INITIATED' ? Colors.white : Color.fromRGBO(
                                        int.parse(list[12+i].replaceAll('(', '').replaceAll(')', '')
                                            .split(',')[1].toString()),
                                        int.parse(list[12+i].replaceAll('(', '').replaceAll(')', '')
                                            .split(',')[2].toString()),
                                        int.parse(list[12+i].replaceAll('(', '').replaceAll(')', '')
                                            .split(',')[3].toString()),
                                        1),
                                    border: Border.all(color: list[12+i].replaceAll('(', '').replaceAll(')', '')
                                        .split(',')[0] == 'ABANDONED'  || list[12+i].replaceAll('(', '').replaceAll(')', '')
                                        .split(',')[0] == 'REVERSED' || list[12+i].replaceAll('(', '').replaceAll(')', '')
                                        .split(',')[0] == 'REVERSE_INITIATED' ? Colors.grey.shade200 : Colors.white)
                                  ),
                                ),
                                const SizedBox(width: 10,),
                                Text(
                                  list[12+i].replaceAll('(', '').replaceAll(')', '')
                                      .split(',')[0] == 'ABANDONED' ? "ABANDONED"
                                      : list[12+i].replaceAll('(', '').replaceAll(')', '')
                                      .split(',')[0] == 'REVERSED' ? "REVERSED"
                                      : list[12+i].replaceAll('(', '').replaceAll(')', '')
                                      .split(',')[0] == 'REVERSE_INITIATED' ? "REVERSE_INITIATED"
                                      : ((list[12+i].replaceAll('(', '').replaceAll(')', '')
                                      .split(',')[0])
                                      +
                                      (list[12+i].replaceAll('(', '').replaceAll(')', '')
                                          .split(',')[4] == '' ? '' : " (${list[i].replaceAll('(', '').replaceAll(')', '')
                                          .split(',')[4]})")),
                                  style: TextStyle(fontSize: 10),),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(
                      color: AppColors.blackColor,
                      borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("OK",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.robotoCondensed(
                            color: Colors.white,
                            fontSize: 14,fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),*/
        ),
      ),
    );
  }
}
