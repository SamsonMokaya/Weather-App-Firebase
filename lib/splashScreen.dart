import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp/pages/SignUpPage.dart';
import 'package:weatherapp/pages/authPage.dart';
import '../components/myButton.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE2DBDB),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            //logo
            children: [
              Padding(
                padding: EdgeInsets.only(left:30.0, right: 30.0, top: 70.0),
                child: Image.asset(
                  "lib/assets/weather.png",
                ),
              ),

              Padding(
                padding: EdgeInsets.all(24.0),
                child: Text(
                  "Flood Enlightenment App",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                    fontSize: 30,
                    color: Color(0xFF4D5903),
                  ),
                ),
              ),

              SizedBox(height: 50,),

              //get started
              myButton(
                onTap: (){
                  Navigator.pushReplacement(
                    context, MaterialPageRoute(
                      builder: (context){
                        return AuthPage();
                      }
                  ),
                  );
                },
                text: "Get Started",
              ),

              SizedBox(height: 30,),


              Padding(
                padding: EdgeInsets.all(15.0),
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
