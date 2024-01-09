import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:master_data/master_data_bl.dart';
import 'package:product_menu_data/models/product_menu_panel_content_container_dto.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/utils/size_config.dart';

import '../models/product_grid_item.dart';

class MenuGridItem extends StatelessWidget {
   MenuGridItem({Key? key, required this.gridItem, required this.productSelectedCallback, required this.masterDataBl}) : super(key: key);
  final GridItem gridItem;
  final Function productSelectedCallback;
  final MasterDataBLContract masterDataBl;

  late Uint8List _imageData ;
  @override
  Widget build(BuildContext context) {
   SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
   SizeConfig.init(context);

    return GestureDetector(
        onTap: () {
          if (gridItem is PanelItem) {
            print("panel ${gridItem.title}");
            productSelectedCallback(gridItem);
          } else if (gridItem is ProductItem) {
            ProductMenuPanelContentContainerDTO productMenuContentPanelContainerDTO =
            (gridItem.dataObject as ProductMenuPanelContentContainerDTO);
            var isSubPanel = (productMenuContentPanelContainerDTO.productId == -1 &&
                productMenuContentPanelContainerDTO.childPanelId != -1);
            if (isSubPanel) {
              productSelectedCallback(gridItem);
            } else {
              productSelectedCallback(gridItem);
            }
          }
        },
        child: _panelWidget(gridItem, theme)
    );
  }

  Future<Uint8List> _getImgData(imgUrl) async {
      _imageData = await masterDataBl.getImageData(fileName: imgUrl);
    return _imageData;
  }

  Widget _getPanelImage(String? imgUrl) {
    try {
      if(imgUrl !=null|| (imgUrl??'').isNotEmpty ){
        return FutureBuilder(
          future: _getImgData(imgUrl),
          builder: (BuildContext context, AsyncSnapshot<Uint8List> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data!.isNotEmpty) {
                return ClipRRect(
                    borderRadius:  BorderRadius.only(bottomLeft:Radius.circular(SizeConfig.getSize(8)), topLeft: Radius.circular(SizeConfig.getSize(8))),
                    child: Image.memory(snapshot.data!, fit: BoxFit.cover,width: double.infinity,height: double.infinity, ));
              } else {
                return const SizedBox();
              }
            } else {
              return const SizedBox();
            }
          },
        );
      }
      else{
        return const SizedBox();
      }
    } catch (err) {
      return const SizedBox();
    }
  }

  Widget _panelWidget(GridItem gridItem, SemnoxTheme theme){
    return Padding(
      padding: const EdgeInsets.only(left: 4,right: 4, bottom: 4),
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: theme.secondaryColor!
                    .withOpacity(0.3),
                spreadRadius:SizeConfig.getSize(0.2),
                blurRadius: SizeConfig.getSize(0.2),
                offset:  Offset(0,
                    SizeConfig.getSize(2)), // changes position of shadow
              ),
            ],
            color: theme!.button1BG1,
            borderRadius: BorderRadius.circular(SizeConfig.getSize(8))
        ),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              gridItem.dataObject.imageURL != null && gridItem.dataObject.imageURL.isNotEmpty?   Expanded(child: Container( child:_getPanelImage(gridItem.dataObject.imageURL,))):const SizedBox(),
               Expanded(
                flex: 1,
                child: Text(
                  gridItem.title,
                  style: theme.heading4!.copyWith(fontSize:  SizeConfig.getFontSize(18)),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

}
