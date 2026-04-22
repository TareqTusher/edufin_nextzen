import 'package:edufin/feat/commons_components/circle_avatar.dart';
import 'package:edufin/feat/styles/colors.dart';
import 'package:edufin/feat/styles/strings.dart';
import 'package:edufin/feat/styles/text_style.dart';
import 'package:edufin/presentation/screens/portal_screen.dart';
import 'package:edufin/presentation/screens/student_description.dart';
import 'package:edufin/presentation/screens/teacher_description.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkAndNavigate();
  }

  void _checkAndNavigate() async {
    await Future.delayed(Duration(seconds: 3));

    final prefs = await SharedPreferences.getInstance();
    bool sessionAlive = prefs.getBool("sessionAlive") ?? false;
    String role = prefs.getString("role") ?? "";

    if (!mounted) return;

    if (sessionAlive && role == "student") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => StudentDescription()),
      );
    } else if (sessionAlive && role == "teacher") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => TeacherDescription()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => PortalScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backGroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [CommonCircleAvatar(size: 80,textColor: AppColors.whiteColor,)],
              ),
            ),
          ],
        ),
        bottomSheet: Container(
          color: AppColors.backGroundColor,
          padding: EdgeInsets.all(20),
          child: SizedBox(
            
            width: double.infinity,
            height: 50,
            child: Image.asset(
              
              "assets/images/logo.png",
              height: 100,
              width: 100,
            ),
          ),
        ),
      ),
    );
  }
}
