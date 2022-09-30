import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_order/global/global.dart';
import 'package:food_order/views/user_view.dart';
import 'package:food_order/views/admin_view.dart';
import 'package:food_order/widgets/custom_text_field.dart';
import 'package:food_order/widgets/error_dialog.dart';

import '../widgets/loading_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  formValidation()
  {
    if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty)
    {
      //login
      loginNow();
    }else
    {
      showDialog(
          context: context,
          builder: (c)
          {
            return ErrorDialog(
                message: "Please write email/password.",
            );

          }
      );
    }
  }

  loginNow() async
  {
    showDialog(
        context: context,
        builder: (c)
        {
          return LoadingDialog(
            message: "Checking Credentials",
          );

        }
    );

    //firebase authentication
    User? currentUser;
    await firebaseAuth.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    ).then((auth){
      currentUser = auth.user!;
    }).catchError((error){
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (c)
          {
            return ErrorDialog(
              message: error.message.toString(),
            );

          }
      );
    });
    if(currentUser != null)
    {
      readDataAndSetDataLocally(currentUser!).then((value){
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (c)=> const UserPage()));
      });
    }
  }

  Future readDataAndSetDataLocally(User currentUser) async
  {
    await FirebaseFirestore.instance.collection("users")
        .doc(currentUser.uid)
        .get()
        .then((snapshot) async {
          await sharedPreferences!.setString("uid", currentUser.uid);
          await sharedPreferences!.setString("email", snapshot.data()!["userEmail"]);
          await sharedPreferences!.setString("name", snapshot.data()!["userName"]);
          await sharedPreferences!.setString("photoUrl", snapshot.data()!["userAvatarUrl"]);

    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(
                "images/seller.png",
                height: 270,
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextField(
                  controller: emailController,
                  data: Icons.email,
                  hintText: "Email",
                  isObsecre: false,
                  enabled: true,
                ),
                CustomTextField(
                  controller: passwordController,
                  data: Icons.lock,
                  hintText: "Password",
                  isObsecre: true,
                  enabled: true,
                ),
              ],
            ),
          ),
          ElevatedButton(
            child: const Text(
              "Login",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
                primary: Colors.cyan,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10)
            ),
            onPressed: ()
            {
              if(emailController.text == "admin@gmail.com"){
                Navigator.push(context, MaterialPageRoute(builder: (c)=> const AdminPage()));
              }else{
                formValidation();
              }
            },
          ),
          const SizedBox(height: 30,),
        ],
      ),
    );
  }
}
