import 'package:buildapp/Screens/auth/login_with_phone_number.dart';
import 'package:buildapp/Screens/home_and_general_screen/Bottom_navigation_bar.dart';
import 'package:buildapp/Screens/home_and_general_screen/home.dart';
import 'package:buildapp/Screens/auth/sign_up.dart';
import 'package:buildapp/widgets/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'forgot_password.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool loading = false;
  final _formkey = GlobalKey<FormState>();
  final pwdController = TextEditingController();
  final emailController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    setState(() {
      loading = true;
    });
    super.dispose();
    emailController.dispose();
    pwdController.dispose();
  }

  void SignIn() {
    _auth
        .signInWithEmailAndPassword(
            email: emailController.text,
            password: pwdController.text.toString())
        .then((value) {
      Get.to(BottomNavigationBarScreen());
      setState(() {
        loading = false;
      });
    });
  }
  //  .onError((error, stackTrace){
  //    Utils().toastMessage(error.toString());

  //  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Sign In'),
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
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          labelText: 'Email or Phone Number',
                          prefixIcon: Icon(Icons.email),
                        ),
                        validator: MultiValidator([
                          RequiredValidator(errorText: "Required*"),
                          EmailValidator(
                              errorText: "Please enter a valid email")
                        ]),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        controller: pwdController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock),
                        ),
                        validator: MultiValidator(
                            [RequiredValidator(errorText: "Required*")]),
                        obscureText: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: FlatButton(
                        onPressed: () {
                          Get.to(ForgotPass());
                        },
                        textColor: Colors.blue,
                        child: Text(
                          'Forgot password !',
                          style: TextStyle(fontSize: 15.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SizedBox(
                        width: 300,
                        height: 40,
                        child: RoundButton(
                          title: 'Sign In',
                          loading: loading,
                          onTap: () {
                            setState(() {
                              loading = true;
                            });
                            if (_formkey.currentState!.validate()) {
                              SignIn();
                            }
                          },
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(LoginWithPhoneNumber());
                      },
                      child: Container(
                        height: 40,
                        width: 300,
                        child: Center(child: Text('LogIn with phone')),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(color: Colors.black)),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(35.0),
                        child: Row(
                          children: [
                            Text("Don't have an account?"),
                            TextButton(
                                onPressed: () {
                                  Get.to(SignUp());
                                },
                                child: Text('Sign Up'))
                          ],
                        )),
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

//  FlatButton(
//                         color: Colors.deepPurple,
//                         onPressed: () {
//                           Get.to(SignUp());
//                         },
//                         textColor: Colors.white,
//                         child: Text(
//                           'Create Account',
//                           style: TextStyle(fontSize: 25.0),
//                         ),
//                       ),
