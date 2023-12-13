import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Drawer.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);

   final user = FirebaseAuth.instance.currentUser!;

  final List<WeatherScenario> weatherScenarios = [
    WeatherScenario(
      condition: "Rainy",
      advice: "Carry an umbrella and wear waterproof clothing.",
      icon: Icons.beach_access,
      iconColor: Colors.blue,
    ),
    WeatherScenario(
      condition: "Sunny",
      advice: "Stay hydrated and wear sunscreen.",
      icon: Icons.wb_sunny,
      iconColor: Colors.yellow,
    ),
    WeatherScenario(
      condition: "Foggy",
      advice: "Reduce speed and use fog lights while driving.",
      icon: Icons.cloud,
      iconColor: Colors.grey,
    ),
  ];

  void singUserOut(){
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF888903),
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
        ),

        actions: [
          Row(
            children: [

              SizedBox(width: 10,),

              Text(
                user.email!,
                style: GoogleFonts.openSans(
                  fontSize: 15,
                  color: Color(0xFFDFDFDF),
                ),
              ),
              SizedBox(width: 8,),

              IconButton(onPressed: singUserOut, icon: Icon(Icons.logout))
            ],
          ),
        ],
      ),
      drawer: CustomDrawer(),
      backgroundColor: const Color(0xFFE2DBDB),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            SizedBox(height: 20),
            Text(
              "Welcome to Flood Awareness",
              style: GoogleFonts.pacifico(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Stay informed about weather conditions and know what to do during different scenarios.",
              style: GoogleFonts.openSans(
                fontSize: 18,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: weatherScenarios.length,
                itemBuilder: (context, index) {
                  return WeatherAdviceCard(weatherScenario: weatherScenarios[index]);
                },
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class WeatherAdviceCard extends StatelessWidget {
  final WeatherScenario weatherScenario;

  const WeatherAdviceCard({
    required this.weatherScenario,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            weatherScenario.icon,
            size: 50,
            color: weatherScenario.iconColor,
          ),
          SizedBox(height: 10),
          Text(
            weatherScenario.condition,
            style: GoogleFonts.pacifico(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Text(
            weatherScenario.advice,
            style: GoogleFonts.openSans(
              fontSize: 16,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class WeatherScenario {
  final String condition;
  final String advice;
  final IconData icon;
  final Color iconColor;

  WeatherScenario({
    required this.condition,
    required this.advice,
    required this.icon,
    required this.iconColor,
  });
}
