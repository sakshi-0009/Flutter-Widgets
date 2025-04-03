import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/view/screen.dart';
import 'theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeProvider.themeMode,
          theme: ThemeData.light().copyWith(
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.purpleAccent.shade100,
            ),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.purpleAccent.shade100,
            ),
          ),
          darkTheme: ThemeData.dark().copyWith(
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.deepPurple.shade900,
            ),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.deepPurple.shade900,
            ),
          ),
          home: TaskScreen(),
        );
      },
    );
  }
}
