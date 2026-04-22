import 'package:edufin/presentation/screens/splash_screen.dart';
import 'package:edufin/presentation/screens/student_description.dart';
import 'package:edufin/presentation/screens/teacher_description.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  String role = prefs.getString("role") ?? "";
  bool sessionAlive = prefs.getBool("sessionAlive") ?? false;

  Widget homeScreen;

  if (sessionAlive && role == "student") {
    homeScreen = StudentDescription();
  } else if (sessionAlive && role == "teacher") {
    homeScreen = TeacherDescription();
  } else {
    homeScreen = SplashScreen();
  }

  await prefs.setBool("sessionAlive", false);

  runApp(MyApp(home: homeScreen));
}

class MyApp extends StatelessWidget {
  final Widget home;
  const MyApp({super.key, required this.home});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}