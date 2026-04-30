import 'package:edufin/core/common_components/circle_avatar.dart';
import 'package:edufin/core/theme/colors.dart';
import 'package:edufin/services/app_routes.dart';
import 'package:edufin/services/auth.dart';
import 'package:edufin/services/router.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


@override
void initState() {
  super.initState();
  _checkSession();
}

void _checkSession() async {
  await Future.delayed(Duration(seconds: 3)); 
  final role = await SessionService.getRole();

  if (!mounted) return;

  if (role == 'teacher') {
    router.go(AppRoutesPath.teacherDescription);
  } else if (role == 'student') {
    router.go(AppRoutesPath.studentDescription);
  } else {
    router.go(AppRoutesPath.portalScreen);
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
                children: [
                  CommonCircleAvatar(size: 80, textColor: AppColors.whiteColor),
                ],
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
