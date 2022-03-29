import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projectpart1/constants.dart';
import 'package:projectpart1/prediction.dart';
import 'package:projectpart1/rounded_input.dart';
import 'package:projectpart1/rounded_password.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'rounded_button.dart';
// import 'package:flutter_svg/flutter_svg.dart';
class LoginScreen extends StatefulWidget{
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin{
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
  static Future<User?> loginUsingEmailPassword(
      {required String email,
        required String password,
        required BuildContext context}) async{
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try{
      UserCredential usercredential  = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = usercredential.user;

  } on FirebaseAuthException catch(e){
      if(e.code == "user-not-found"){
        print("No user found for that email");
  }
  }
  return user;
}



  bool isLogin = true;
  late Animation<double> containerSize;
  late AnimationController animationController;
  Duration animationDuration  = Duration(milliseconds:270);

    @override
    void initState(){
      super.initState();
      SystemChrome.setEnabledSystemUIOverlays([]);

      animationController = AnimationController(vsync: this,duration: animationDuration);


    }
    @override
    void dispose(){
      animationController.dispose();
      super.dispose();

    }






    @override
    Widget build(BuildContext context ){
      TextEditingController _emailController = TextEditingController();
      TextEditingController _passwordController = TextEditingController();


      Size size = MediaQuery.of(context).size;
      double ViewInsert = MediaQuery.of(context).viewInsets.bottom;
      double defaultloginsize = size.height - (size.height*0.2);
      double defaultregistersize = size.height - (size.height*0.1);

      containerSize = Tween<double>(begin: size.height*0.1,  end:defaultregistersize).animate(CurvedAnimation(parent: animationController, curve: Curves.linear));

      return Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 100,
              right: -50,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: kPrimaryColor,
                ),

              ),

            ),
            Positioned(
              top: -50,
              left: -50,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: kPrimaryColor,
                ),
              ),

            ),
            Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Container(
                  width: size.width,
                  height: defaultloginsize,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Skyler here",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,

                      ),),
                      SizedBox(height: 40),
                      Image.asset('images/group.jpg'),
                      SizedBox(height: 40),
                      RoundedInput(icon: Icons.mail,hint: 'Username',),

                      RoundedPasswordInput(hint: 'Password',),
                      InkWell(
                        onTap: () async{
                          User? user = await loginUsingEmailPassword(email: _emailController.text, password: _passwordController.text, context: context);
                          if(user!= null){
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> ProfileScreen()));
                          }
                        },
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          width: size.width *0.8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: kPrimaryColor,
                          ),
                          padding: EdgeInsets.symmetric(vertical: 20),
                          alignment: Alignment.center,
                          child: Text(
                            "LOGIN",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18

                                )
                          ),

                        ),


                      ),


                      // RoundedButton(title: 'LOGIN'),
                      FutureBuilder(
                        future: _initializeFirebase(),
                        builder: (context,snapshot){
                          if(snapshot.connectionState == ConnectionState.done) {
                            return LoginScreen();

                          }
                          return const Center(
                            child: CircularProgressIndicator(),
                          );

                        }

                      )




                    ],
                  ),
                ),
              ),
            ),




          ],
        ),

      );


    }
  }



