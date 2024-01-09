import 'dart:io';
import 'dart:typed_data';

import 'package:customer_data/models/customer_data.dart';
import 'package:customer_data/models/relationships/customer_relationship_data.dart';
import 'package:customer_ui/screens/registration/NewCustomerScreen.dart';
import 'package:customer_ui/utils/extensions.dart';
import 'package:customer_ui/utils/size_config.dart';
import 'package:execution_context/builder.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:master_data/builder.dart';
import 'package:messages_data/builder.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:themes_library/themes_library.dart';



class ImagePickerDialog extends StatefulWidget {
  TextEditingController addressController;
  VoidCallback? onPress;
  String title;
  bool? isChecked = true;
  bool isEdit;
  CustomerRelationshipData? relationData;
  Function(XFile? imageFile,String? name)? onImageUpdate;
  XFile? imageFile;
  TextEditingController? idProofFileURL;



  ImagePickerDialog(
      {required this.title,
        required this.addressController,
        this.onPress,
        this.isChecked,
        this.onImageUpdate,
        this.relationData,
        required  this.isEdit,
        this.imageFile,
        this.idProofFileURL
      });

  @override
  State<ImagePickerDialog> createState() => _ImagePickerDialogState();
}

class _ImagePickerDialogState extends State<ImagePickerDialog> {
  late NotificationBar _notificationBar;
  CustomerData? selectedCustomerData;
  CustomerData? data;
  bool _isLoading = false;
  ImagePicker picker = ImagePicker();
  XFile? image;

@override
  void initState() {
    super.initState();
    setState(() {
      imageUploadedValue.value = '';
      imageUploadedFileName.value = '';
    });
    _notificationBar = NotificationBar(showHideSideBar: false);
    image =widget.imageFile;
}

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Scaffold(
      bottomNavigationBar:  Container(
        child: _notificationBar,
      ),
      backgroundColor: Colors.transparent,
      body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: AlertDialog(
            backgroundColor: theme.backGroundColor,
            title: Padding(
              padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
              child: Text(
                widget.title.toUpperCase(),
                style: theme.heading5?.copyWith(
                    fontSize: 19.0,
                    fontWeight: FontWeight.w700
                ),
                textAlign: TextAlign.start,
              ),
            ),
            contentPadding: EdgeInsets.zero,
            insetPadding: EdgeInsets.zero,
            content: _widget(),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              Container(
                // height:  MediaQuery.of(context).size.height,
                height: SizeConfig.getSize(60),
                width: MediaQuery.of(context).size.width * 0.10,
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(0.0),
                    backgroundColor: theme.button1BG1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0)),
                  ),
                  child: Text(
                    MessagesProvider.get("Cancel").toUpperCase(),
                    style: theme.headingLight5?.copyWith(
                        color: theme.secondaryColor,
                        fontSize: SizeConfig.getFontSize(16),
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Container(
                // height:  MediaQuery.of(context).size.height,
                height: SizeConfig.getSize(60),
                width: MediaQuery.of(context).size.width * 0.10,
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: ElevatedButton(
                  onPressed: (){
                    if(image!= null) {
                      _uploadImage();
                    }
                    else{
                      widget.onImageUpdate!(null,'');
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(0.0),
                    backgroundColor: theme.button2BG1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0)),
                  ),
                  child: Text(
                    MessagesProvider.get("Confirm").toUpperCase(),
                    style: theme.headingLight5?.copyWith(
                        color: Colors.white,
                        fontSize: SizeConfig.getFontSize(16),
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          )).withLoader(isLoading: _isLoading,theme: theme),
    );
  }



  _widget() {

    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return Container(
      // width: MediaQuery.of(context).size.width * 0.9,
      // height: MediaQuery.of(context).size.height * 0.9,
      child: Form(
        child: Column(
          children: [
            Container(
              height: 1,
              color:theme.dividerColor,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    width: MediaQuery.of(context).size.width *0.75,
                    height: MediaQuery.of(context).size.height * 0.6,
                    alignment: AlignmentDirectional.topStart,
                    child:  widget.idProofFileURL?.text.isNotEmpty == true?_getImage(widget.idProofFileURL?.text):image == null ? Image.asset( 'assets/ic_id_proof.png' ?? 'assets/ic_id_proof.png', color: theme.primaryOpposite, ) : Image.file(File(image!.path),width: 100,height: 100,),
                  ),
                ),
                Expanded(
                  child: Container(
                    //height: MediaQuery.of(context).size.height * 0.65,
                    alignment: AlignmentDirectional.centerEnd,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            // height:  MediaQuery.of(context).size.height,
                            height: SizeConfig.getSize(60),
                            width: MediaQuery.of(context).size.width * 0.10,
                            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: ElevatedButton(
                              onPressed: () async {
                                  image = await picker.pickImage(source: ImageSource.gallery);
                                  setState(() {
                                    image = image;
                                    //update UI
                                  });
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(0.0),
                                backgroundColor: theme.button2BG1,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0)),
                              ),
                              child: Text(
                                MessagesProvider.get("Browse").toUpperCase(),
                                style: theme.headingLight5?.copyWith(
                                    color: Colors.white,
                                    fontSize: SizeConfig.getFontSize(16),
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Container(
                            // height:  MediaQuery.of(context).size.height,
                            height: SizeConfig.getSize(60),
                            width: MediaQuery.of(context).size.width * 0.10,
                            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  image = null;
                                  widget.idProofFileURL?.text = '';
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(0.0),
                                backgroundColor: theme.button1BG1,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0)),
                              ),
                              child: Text(
                                MessagesProvider.get("clear").toUpperCase(),
                                style: theme.headingLight5?.copyWith(
                                    color: theme.secondaryColor,
                                    fontSize: SizeConfig.getFontSize(16),
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            const Spacer(),
            Container(
              height: 1,
              color: theme.dividerColor,
            ),
          ],
        ),
      ),
    ).withLoader(isLoading: _isLoading, theme: theme);
  }

  void setLoadingStatus(bool status) {
    setState(() {
      _isLoading = status;
    });
  }


  _uploadImage() async {
    setState(() {
      imageUploadedValue.value = '';
      imageUploadedFileName.value = '';
    });
        setLoadingStatus(true);
    final execContextBL = await ExecutionContextBuilder.build();
    final execContextDTO = execContextBL.getExecutionContext();
    final masterDataBL = await MasterDataBuilder.build(execContextDTO!);
    final uploading = await masterDataBL.uploadImage( binaryImage: File(image?.path ?? '').readAsBytesSync(), fileName: '${image?.name}', );
    print(uploading.toString());
    setLoadingStatus(false);
    setState(() {
      widget.onImageUpdate!(image,'${image?.name}');
      imageUploadedValue.value = 'true';
      imageUploadedFileName.value = '${image?.name}';
      Navigator.pop(context);
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
            return Image.memory(snapshot.data!,width: 100,height: 100,);
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
