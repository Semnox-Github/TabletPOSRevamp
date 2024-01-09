import 'dart:typed_data';

import 'package:execution_context/builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:master_data/builder.dart';
import 'package:messages_data/builder.dart';
import 'package:themes_library/themes_library.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../ImagePickerDialog.dart';
import '../utils/size_config.dart';

class IdProofProfileWidget extends StatefulWidget {
  final String title;
  VoidCallback? onPress;
  String? image;
  TextEditingController? idProofFileURL;

  IdProofProfileWidget({required this.title, super.key,this.onPress,this.image,this.idProofFileURL});

  @override
  State<IdProofProfileWidget> createState() => _IdProofProfileWidgetState();
}

class _IdProofProfileWidgetState extends State<IdProofProfileWidget> {
  ImagePicker picker = ImagePicker();
  XFile? image;

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    SizeConfig.init(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding:  EdgeInsets.only(right: 20,top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.title,
                style: theme.heading6?.copyWith(fontSize: SizeConfig.getFontSize(20), fontWeight: FontWeight.normal),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap:(){
                  showDialog(
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(
                        builder: (context, setState) {
                          return ImagePickerDialog(
                            title: MessagesProvider.get('SELECT AN ID PROOF'),
                            addressController: TextEditingController(),
                            isChecked : true,
                            isEdit: false,
                            onImageUpdate: (value,name){
                              setImage(value,name);
                            },
                            onPress: (){
                            },
                            imageFile: image,
                            idProofFileURL: widget.idProofFileURL,
                          );
                        },
                      );
                    },
                  ); },
                child:widget.idProofFileURL?.text.isNotEmpty == true?_getImage(widget.idProofFileURL?.text) :image == null ? Image.asset(
                  widget.image ??  'assets/ic_id_proof.png',
                  color: theme.primaryOpposite,width: 60,height: 60,
                ) : Image.file(File(image!.path),width: 60,height: 60,),
              ),
              const SizedBox(height: 8.0,)
            ],
          ),
        ),
      ],
    );
  }
  setImage(XFile? value, String? name){
    setState(() {
      image = value;
      widget.idProofFileURL?.text = name!;
    });
  }
  
  Widget _getImage(imgUrl) {
    try {
      return FutureBuilder(
        future: _getImgData(imgUrl),
        builder: (BuildContext context, AsyncSnapshot<Uint8List> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data!.isNotEmpty) {
            } else {
              return const SizedBox();
            }
            return Image.memory(snapshot.data!,width: 60,height: 60,);
          } else {
            return const SizedBox();
          }
        },
      );
    } catch (err) {
      return const SizedBox();
    }
  }

  Future<Uint8List> _getImgData(imgUrl) async {
   final _execContextBL = await ExecutionContextBuilder.build();
    final _execContext = _execContextBL!.getExecutionContext();
    final _masterDataBl = await MasterDataBuilder.build(_execContext!);
    Uint8List imageData = await _masterDataBl.getImageData(fileName: imgUrl);
    return imageData;
  }

}

