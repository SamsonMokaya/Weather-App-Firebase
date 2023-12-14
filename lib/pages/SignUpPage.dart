import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'SignInPage.dart';
import '../components/myButton.dart';
import '../components/square_tile.dart';
import 'authPage.dart';

class SignUpPage extends StatefulWidget {
  final Function()? onTap;

  const SignUpPage({Key? key, this.onTap}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignUpPage> {
  //text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Function to show toast messages
  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }

  // Sign-up user method
  void signUpUser() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      showToast("Please fill in all fields.");
      return;
    }

    if (password != confirmPassword) {
      showToast("Passwords do not match.");
      return;
    }

    try {
      // Your Firebase sign-up logic goes here
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
         email: email,
         password: password,
       );

      showToast("Sign-up successful!");

      // Check if to redirect user to home page or loginpage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignInPage()),
      );

    }on FirebaseAuthException catch  (e) {
      print('Error signing up: $e');
      showToast("Error signing up: ${e.code}");
    }
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
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),

              // Welcome message
              Center(
                child: Text(
                  "Welcome",
                  style: GoogleFonts.openSans(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF4D5903),
                  ),
                ),
              ),

              SizedBox(height: 10,),

              // Email label
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

              SizedBox(height: 5,),

              // Email text field
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
                  ),
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

              SizedBox(height: 5,),

              // Password text field
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
                  ),
                ),
              ),

              SizedBox(height: 10,),

              // Confirm Password label
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text(
                  "Confirm Password",
                  style: GoogleFonts.openSans(
                    color: Color(0xFF4D5903),
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
              ),

              SizedBox(height: 5,),

              // Confirm Password text field
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
                      controller: confirmPasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: '************',
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),

              // Sign-up button
              myButton(
                onTap: signUpUser,
                text: "Sign Up",
              ),

              SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already a member? ",
                    style: GoogleFonts.openSans(
                      color: Color(0xFF4D5903),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SignInPage();
                          },
                        ),
                      );
                    },
                    child: Text(
                      "Sign in here",
                      style: GoogleFonts.openSans(
                        color: Color(0xFF4D5903),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 15,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTile(
                    imagePath: 'lib/assets/google.png',
                    onTap: () {},
                  ),
                ],
              ),

              SizedBox(height: 20,),

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
