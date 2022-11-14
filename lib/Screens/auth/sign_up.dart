import 'package:buildapp/Screens/auth/sign_in.dart';
import 'package:buildapp/Utils/utils.dart';
import 'package:buildapp/widgets/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class SignUp extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignUp> {
  // GlobalKey<FormState> _Formkey = GlobalKey<FormState>();
  @override
  bool _isHidden = true;
  bool loading = false;
  final pwdController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    pwdController.dispose();
  }

  FirebaseAuth _auth = FirebaseAuth.instance;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Sign Up'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 30.0,
                left: 10,
                right: 10,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "Assets/Images/wel.PNG",
                      width: 250,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        controller: nameController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          labelText: 'Full Name',
                          prefixIcon: Icon(Icons.drive_file_rename_outline),
                        ),
                        validator: MultiValidator([
                          RequiredValidator(errorText: "Required*"),
                        ]),
                        // onChanged: (val)async {
                        //   // setState(() {
                        //   //   cust_name = val;
                        //   // });
                        // },
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        controller: emailController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email),
                        ),
                        validator: MultiValidator([
                          RequiredValidator(errorText: "Required*"),
                          EmailValidator(
                              errorText: "Please enter a valid email")
                        ]),
                        // onChanged: (val) async{
                        //   // setState(() {
                        //   //   email = value;
                        //   // });
                        // },
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        controller: pwdController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock),
                        ),
                        validator: MultiValidator([
                          RequiredValidator(errorText: "Required*"),
                        ]),
                        obscureText: _isHidden,
                        // onChanged: (val) {
                        //   // setState(() {
                        //   //   password = val;
                        //   // });
                        // },
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SizedBox(
                        width: 300,
                        height: 40,
                        child: RoundButton(
                          title: 'Create Account',
                          loading: loading,
                          onTap: () {
                            setState(() {
                              loading = true;
                            });

                            if (_formkey.currentState!.validate()) {
                              _auth
                                  .createUserWithEmailAndPassword(
                                email: emailController.text.toString(),
                                password: pwdController.text.toString(),
                              )
                                  .then((value) {
                                Utils().toastMessage('Successfully Registered');
                                setState(() {
                                  loading = false;
                                });
                              }).onError((error, stackTrace) {
                                Utils().toastMessage(error.toString());
                                setState(() {
                                  loading = false;
                                });
                              });
                              SignIn();
                            }

                            // FirebaseAuth.instance.createUserWithEmailAndPassword(
                            //   email: email, password: password)
                            //   .then(signedInUser){
                            //     _firbbase.collection('users')
                            //     .add({'email': email, 'pass' : password})
                            //     .then(value){
                            //       if(signedInUser != null){
                            //         Navigator.pushNamed(context, 'Home');
                            //       }
                            //     })
                            //   .catchError((e){
                            //     print(e);
                            //   });
                            // })
                            // .catchError((e){
                            //     print(e);
                            //   });
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Already have an Account ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          FlatButton(
                            onPressed: () {
                              Get.to(SignIn());
                            },
                            textColor: Colors.black,
                            child: Text(
                              'Sign in',
                              style: TextStyle(fontSize: 25.0),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            // color: Colors.deepPurple,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
