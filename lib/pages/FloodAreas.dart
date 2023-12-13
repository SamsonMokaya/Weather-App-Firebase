import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Drawer.dart';

class FloodAreas extends StatelessWidget {
   FloodAreas({Key? key}) : super(key: key);

  final List<FloodedImage> floodedImages = [
    FloodedImage(imagePath: 'lib/assets/flood_image1.jpeg', location: 'Nairobi'),
    FloodedImage(imagePath: 'lib/assets/flood_image2.jpeg', location: 'Mombasa'),
    FloodedImage(imagePath: 'lib/assets/flood_image3.jpeg', location: 'Kisumu'),
    FloodedImage(imagePath: 'lib/assets/flood_image4.jpeg', location: 'Athi River'),
    // Add more images as needed
  ];

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
                "Jonathan Doe  >",
                style: GoogleFonts.openSans(
                  fontSize: 15,
                  color: Color(0xFFDFDFDF),
                ),
              ),
              SizedBox(width: 8,),
            ],
          ),
        ],
      ),
      drawer: CustomDrawer(),
      backgroundColor: const Color(0xFFE2DBDB),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Flooded Areas",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Floods can have devastating effects on communities. Here are some areas affected:",
              style: TextStyle(fontSize: 16),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: floodedImages.length,
              itemBuilder: (context, index) {
                return FloodImageCard(floodedImage: floodedImages[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FloodImageCard extends StatelessWidget {
  final FloodedImage floodedImage;

  const FloodImageCard({
    required this.floodedImage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            floodedImage.imagePath,
            fit: BoxFit.cover,
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              floodedImage.location,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FloodedImage {
  final String imagePath;
  final String location;

  FloodedImage({
    required this.imagePath,
    required this.location,
  });
}
