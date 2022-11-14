import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:buildapp/Screens/home_and_general_screen/Bottom_navigation_bar.dart';
import 'package:buildapp/Utils/utils.dart';
import 'package:buildapp/widgets/round_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

class CreateBids extends StatefulWidget {
  const CreateBids({Key? key}) : super(key: key);
  _CreateBidsState createState() => _CreateBidsState();
}

class _CreateBidsState extends State<CreateBids> {
  bool loading = false;
  final postController = TextEditingController();
  // final databaseRef = FirebaseDatabase.instance.ref('Post');
  final _formkey = GlobalKey<FormState>();
  File? _image;
  final picker = ImagePicker();

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  DatabaseReference databaseRef = FirebaseDatabase.instance.ref('Post');

  Future getImageGallery() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('no image picked');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Create Bids'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Center(
              //   child: InkWell(
              //     onTap: () {
              //       getImageGallery();
              //     },
              //     child: Container(
              //       height: 200,
              //       width: 300,
              //       decoration:
              //           BoxDecoration(border: Border.all(color: Colors.black)),
              //       child: _image != null
              //           ? Image.file(_image!.absolute)
              //           : Center(child: Icon(Icons.image)),
              //     ),
              //   ),
              // ),
              Container(
                  padding: EdgeInsets.all(20), //padding of outer Container
                  child: DottedBorder(
                    color: Colors.black, //color of dotted/dash line
                    strokeWidth: 3, //thickness of dash/dots
                    dashPattern: [10, 6],
                    //dash patterns, 10 is dash width, 6 is space width
                    child: Container(
                      //inner container
                      height: 150, //height of inner container
                      width: double
                          .infinity, //width to 100% match to parent container.
                      color: Color(0xffd0c9c9),

                      child: _image != null
                          ? Image.file(_image!.absolute)
                          : IconButton(
                              icon: Icon(Icons.camera_alt),
                              onPressed: () {
                                getImageGallery();
                              },
                            ),
                    ),
                  )),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                    key: _formkey,
                    child: Column(children: [
                      TextFormField(
                        controller: postController,
                        validator: RequiredValidator(errorText: 'Required*'),
                        decoration: InputDecoration(
                          labelText: 'Title',
                          hintText: "Enter title",
                        ),
                      ),
                      TextFormField(
                        validator: RequiredValidator(errorText: 'Required*'),
                        controller: postController,
                        decoration: InputDecoration(
                          labelText: 'Location',
                          hintText: "Enter your location",
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        validator: RequiredValidator(errorText: 'Required*'),
                        controller: postController,
                        decoration: InputDecoration(
                          labelText: 'Category',
                          hintText: "Enter Category",
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        validator: RequiredValidator(errorText: 'Required*'),
                        controller: postController,
                        decoration: InputDecoration(
                          labelText: 'Price (PKR)',
                          hintText: "Set a price",
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        validator: RequiredValidator(errorText: 'Required*'),
                        maxLines: 4,
                        controller: postController,
                        decoration: InputDecoration(
                          labelText: 'Description',
                          hintText: "Enter full detiles",
                        ),
                      ),
                      SizedBox(height: 15),
                      RoundButton(
                          title: 'Post Bids',
                          loading: loading,
                          onTap: () {
                            setState(() {
                              loading = true;
                            });
                            if (_formkey.currentState!.validate()) {
                              String id = DateTime.now()
                                  .millisecondsSinceEpoch
                                  .toString();
                              databaseRef.child(id).set({
                                'title': postController.text.toString(),
                                'id': DateTime.now()
                                    .millisecondsSinceEpoch
                                    .toString(),
                              });
                              firebase_storage.Reference ref = firebase_storage
                                  .FirebaseStorage.instance
                                  .ref('/nasir/' +
                                      DateTime.now()
                                          .millisecondsSinceEpoch
                                          .toString());
                              firebase_storage.UploadTask uploadTask =
                                  ref.putFile(_image!.absolute);

                              Future.value(uploadTask).then(
                                (value) async {
                                  var newUrl = await ref.getDownloadURL();

                                  databaseRef.child('1').set({
                                    'id': '1212',
                                    'title': newUrl.toString()
                                  }).then((value) {
                                    Utils().toastMessage('Bids added');
                                    setState(() {
                                      loading = false;
                                    });
                                  }).onError((error, stackTrace) {
                                    Utils().toastMessage(
                                        "Don't leave it is empty");

                                    setState(() {
                                      loading = false;
                                    });
                                  });
                                  ;
                                },
                              );
                            }
                          }),
                    ])),
              ),
            ],
          ),
        ));
  }
}
