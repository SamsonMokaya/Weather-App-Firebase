import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp/pages/Emergency.dart';
import 'package:weatherapp/pages/FloodAreas.dart';
import 'package:weatherapp/pages/homePage.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  // Default current page
  String? _currentPage = "Home";

  void _setCurrentPage(String page) {
    setState(() {
      _currentPage = page;
      print(_currentPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFF4D5903),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: GestureDetector(
              onTap: () {
                _setCurrentPage("Home");
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: _currentPage == "Home"
                      ? Color(0xFF888903)
                      : Color(0xFF4D5903),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Home",
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: GestureDetector(
              onTap: () {
                _setCurrentPage("FloodAreas");
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => FloodAreas()));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: _currentPage == "FloodAreas"
                      ? Color(0xFF888903)
                      : Color(0xFF4D5903),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.warning,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Current Flooded areas",
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: GestureDetector(
              onTap: () {
                _setCurrentPage("EmergencyContact");
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Emergency()));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: _currentPage == "EmergencyContact"
                      ? Color(0xFF888903)
                      : Color(0xFF4D5903),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.contacts,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Emergency Contacts",
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
