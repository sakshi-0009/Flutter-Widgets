import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';

class MultiLang extends StatefulWidget {
  const MultiLang({super.key});

  @override
  State<MultiLang> createState() => _MultiLangState();
}

class _MultiLangState extends State<MultiLang> {
  @override
  String _selectedLanguage = 'English';
  bool _isLanguageSelected = false;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _loadSelectedLanguage();
  }

  _loadSelectedLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedLanguage = prefs.getString('language') ?? 'English';
      _isLanguageSelected = prefs.getBool('isLanguageSelected') ?? false;
    });

    if (_isLanguageSelected) {
      _navigateToSecondScreen();
    }
  }

  _saveSelectedLanguage(String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', language);
    await prefs.setBool(
        'isLanguageSelected', false);
  }

  _navigateToSecondScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Home(selectedLanguage: _selectedLanguage),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.chooseLanguage),
        backgroundColor: Colors.white38,
        leading: Icon(Icons.person),
        actions: [
          Icon(Icons.logout)
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(
                'https://media.licdn.com/dms/image/v2/D5612AQEEIyj7ZT0x3w/article-cover_image-shrink_720_1280/article-cover_image-shrink_720_1280/0/1685241402872?e=2147483647&v=beta&t=UkihywMdwcuQjFrmfZhP2446R-w-wEpGrKRxddk6lBs',
                height: 280,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 12,
                children: <Widget>[
                  _buildLanguageButton('English'),
                  _buildLanguageButton('हिन्दी'),
                  _buildLanguageButton('मराठी'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageButton(String language) {
    return StatefulBuilder(
      builder: (context, setState) {
        bool isButtonHovered = false;

        return MouseRegion(
          onEnter: (_) => setState(() => isButtonHovered = true),
          onExit: (_) => setState(() => isButtonHovered = false),
          child: GestureDetector(
            onTap: () {
              setState(() {
                _selectedLanguage = language;
              });
              _saveSelectedLanguage(language);
              _navigateToSecondScreen();
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: isButtonHovered ? Colors.blueAccent : Colors.blue,
                  width: 3,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white38,
                    offset: Offset(2, 2),
                    blurRadius: 8,
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 10),
                  Text(
                    language,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
