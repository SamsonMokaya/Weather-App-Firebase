import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/square_tile.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'SignUpPage.dart';
import '../components/myButton.dart';
import 'authPage.dart';



class SignInPage extends StatefulWidget {

  // final Function? onTap;

  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  //text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //Sign in user method
  void signUserIn() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      showToast("Please fill in all fields.");
      return;
    }

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      showToast("Sign-in successful!");

      // Check if to redirect user to home page or loginpage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AuthPage()),
      );


    } on FirebaseAuthException catch (e) {
      showToast("Error signing up: ${e.code}");
    }
  }


  //show pop ups
  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE2DBDB),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Logo
              Center(
                child: Image.asset(
                  'lib/assets/weather.png',
                  width: 250,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),

              //Welcome message
              Center(
                child: Text("Welcome Back ! !",
                  style: GoogleFonts.openSans(
                      fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF4D5903),
                  ),
                ),
              ),

              SizedBox(height: 20,),


              //Email label
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text(
                  "Email",
                  style: GoogleFonts.openSans(
                    color: Color(0xFF4D5903),
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
              ),

              SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'junedoe@gmail.com',
                        ),
                      ),
                    )
                ),
              ),

              SizedBox(height: 10,),


              // Password label
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text(
                  "Password",
                  style: GoogleFonts.openSans(
                    color: Color(0xFF4D5903),
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
              ),

              SizedBox(height: 10,),

              //password text field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '************',
                        ),
                      ),
                    )
                ),
              ),



              SizedBox(
                height: 20,
              ),

              //sign in button
              myButton(
                  onTap: signUserIn,
                  text: "Sign In"
              ),

              SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Not a member? ",
                    style: GoogleFonts.openSans(
                      color: Color(0xFF4D5903),
                    ),),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(
                        context, MaterialPageRoute(
                          builder: (context){
                            return SignUpPage();
                          }
                      ),
                      );
                    },
                    child: Text("Sign up here",
                      style: GoogleFonts.openSans(
                        color: Color(0xFF4D5903),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),


              SizedBox(height: 25,),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTile(
                    imagePath: 'lib/assets/google.png',
                    onTap: () {},
                  ),
                ],
              ),

              SizedBox(height: 30,),



              Center(
                child: Text(
                  "@sylvia",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                    color: Color(0xFF4D5903),
                    fontSize: 13,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
