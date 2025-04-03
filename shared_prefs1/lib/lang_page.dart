import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  final String selectedLanguage;

  SecondScreen({required this.selectedLanguage});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String getLocalizedText() {
    switch (widget.selectedLanguage) {
      case 'मराठी':
        return 'तुम्ही मराठी भाषा निवडली आहे';
      case 'हिन्दी':
        return 'आपने हिन्दी भाषा चुनी है';
      case 'తెలుగు':
        return 'நீங்கள் தமிழ் மொழியை தேர்ந்தெடுத்துள்ளீர்கள்';
      case 'தமிழ்':
        return 'మీరు తెలుగు భాషను ఎంచుకున్నారు';
      case 'ગુજરાતી':
        return 'તમે ગુજરાતી ભાષા પસંદ કરી છે';
      default:
        return 'You have selected: ${widget.selectedLanguage} language';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selected Language'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent.shade200,
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Container(

          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.blueAccent.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            getLocalizedText(),
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Text color
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
