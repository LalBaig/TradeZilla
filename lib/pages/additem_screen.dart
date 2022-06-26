import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:trade_zilla/utilities/colors.dart';

import '../provider/youritemProvider.dart';

class AddItemScreen extends StatefulWidget {
  AddItemScreen({Key? key}) : super(key: key);

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  TextEditingController _productNameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _exchangewithController = TextEditingController();

  final ImagePicker imagePicker = ImagePicker();
  late XFile imageFileList;
  var imagefile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  print('pressed');
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Options"),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: [
                                GestureDetector(
                                  child:
                                      const Text("Capture Image From Camera"),
                                  onTap: () {
                                    SelectImage(ImageSource.camera);
                                  },
                                ),
                                const Padding(padding: EdgeInsets.all(10)),
                                GestureDetector(
                                  child: const Text("Take Image From Gallery"),
                                  onTap: () {
                                    SelectImage(ImageSource.gallery);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                },
                icon: const Icon(Icons.camera_enhance)),
          ],
          title: const Text('Add Your Product'),
          centerTitle: true,
          backgroundColor: organeColor,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              imagefile == null
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      color: organeColor,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.photo,
                              color: whtColor,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Add Photo",
                              style: TextStyle(color: whtColor, fontSize: 20),
                            )
                          ]),
                    )
                  : Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(color: whtColor),
                      child: Image.file(
                        imagefile,
                        width: 200.0,
                        height: 200.0,
                        fit: BoxFit.fitHeight,
                      )),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 5.0, top: 10.0, bottom: 5.0),
                child: TextField(
                  controller: _productNameController,
                  maxLines: null,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: const InputDecoration(
                      hintText: 'Enter Product Name', border: InputBorder.none),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 5.0, top: 10.0, bottom: 5.0),
                child: TextField(
                  controller: _descriptionController,
                  maxLines: null,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: const InputDecoration(
                      hintText: 'Enter Product Description',
                      border: InputBorder.none),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 5.0, top: 10.0, bottom: 5.0),
                child: TextField(
                  controller: _exchangewithController,
                  maxLines: null,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: const InputDecoration(
                      hintText: 'Enter Exchange With',
                      border: InputBorder.none),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 5.0, top: 10.0, bottom: 5.0),
                child: TextField(
                  controller: _addressController,
                  maxLines: null,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: const InputDecoration(
                      hintText: 'Enter Your Address', border: InputBorder.none),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: (() {
            print('pressed');
            saveProduct();
          }),
          label: Text("Save"),
          icon: Icon(Icons.save),
        ));
  }

  void SelectImage(ImageSource imageSource) async {
    XFile? _image = await imagePicker.pickImage(source: imageSource);

    if (_image == null) return;

    var tempfile = File(_image.path);

    final appDir = await getApplicationDocumentsDirectory();
    final fileName = basename(_image.path);

    tempfile = await tempfile.copy('${appDir.path}/$fileName');

    setState(() {
      imagefile = tempfile;
    });
    print(tempfile);
    Get.back();
  }

  void saveProduct() {
    String productName = _productNameController.text.trim();
    String description = _descriptionController.text.trim();

    String address = _addressController.text.trim();
    String exchangewith = _exchangewithController.text.trim();

    String imagePath = imagefile != null ? imagefile.path : null;

    int id = DateTime.now().millisecondsSinceEpoch;

    Provider.of<Youritem>(this.context, listen: false).addProduct(
        id, productName, exchangewith, address, imagePath, description);

    Get.back();
  }
}
