import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Drawer.dart';

class Emergency extends StatelessWidget {
  const Emergency({Key? key}) : super(key: key);

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
      body: SingleChildScrollView( // Wrap with SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Emergency",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              _buildBeforeFloodSection(),
              SizedBox(height: 20),
              EmergencyContactCard(
                title: "General Inquiries",
                phoneNumber: "0703 037 000",
                email: "info@redcross.or.ke",
              ),
              EmergencyContactCard(
                title: "Help",
                phoneNumber: "1199",
                isTollFree: true,
              ),
              EmergencyContactCard(
                title: "Whistle Blowing",
                phoneNumber: "0800 720 577",
                email: "complaints@redcross.or.ke",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBeforeFloodSection() {
    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "What Should You Do Before a Flood?",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          _buildFloodRiskList(),
          SizedBox(height: 10),
          _buildStaySafeList(),
        ],
      ),
    );
  }

  Widget _buildFloodRiskList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildListItem("Learn about the types of flooding in your area."),
        _buildListItem("Reach out to your local office of emergency management."),
        _buildListItem("Know your home and community’s flood risk."),
        _buildListItem("Visit the FEMA Flood Map Service Center and search for your home using your address."),
      ],
    );
  }

  Widget _buildStaySafeList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Make Plans to Stay Safe",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        _buildListItem("Designate a place on higher ground that you can get to quickly."),
        _buildListItem("Plan to move to higher ground before flooding begins."),
        _buildListItem("Know if you are in an area prone to river floods."),
        _buildListItem("Review your evacuation plan for river floods."),
        _buildListItem("Be prepared to evacuate immediately for storm surges."),
        _buildListItem("Move inland before coastal flooding begins."),
      ],
    );
  }

  Widget _buildListItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Icon(Icons.check, color: Colors.green),
          SizedBox(width: 5),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}

class EmergencyContactCard extends StatelessWidget {
  final String title;
  final String phoneNumber;
  final String? email;
  final bool isTollFree;

  const EmergencyContactCard({
    required this.title,
    required this.phoneNumber,
    this.email,
    this.isTollFree = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.phone),
                SizedBox(width: 5),
                Text(isTollFree ? "Toll-Free: $phoneNumber" : "Tel: $phoneNumber"),
              ],
            ),
            if (email != null) ...[
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(Icons.email),
                  SizedBox(width: 5),
                  Text("Email: $email"),
                ],
              ),
            ],
          ],
        ),
        onTap: () {
          // Add action on tap if needed
        },
      ),
    );
  }
}
