import 'package:edufin/feat/commons_components/circle_avatar.dart';
import 'package:edufin/feat/commons_components/common_elevated_button.dart';
import 'package:edufin/feat/styles/colors.dart';
import 'package:edufin/feat/styles/strings.dart';
import 'package:edufin/feat/styles/text_style.dart';
import 'package:edufin/presentation/screens/student_description.dart';
import 'package:edufin/presentation/screens/teacher_description.dart';
import 'package:edufin/presentation/widgets/student_portal_log_in_button_section.dart';
import 'package:edufin/presentation/widgets/teacher_portal_log_in_button.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PortalScreen extends StatefulWidget {
  const PortalScreen({super.key});

  @override
  State<PortalScreen> createState() => _PortalScreenState();
}

class _PortalScreenState extends State<PortalScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    bool sessionAlive = prefs.getBool("sessionAlive") ?? false;
    String role = prefs.getString("role") ?? "";

    if (sessionAlive) {
      if (role == "student") {
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => StudentDescription()),
          );
        }
        return;
      } else if (role == "teacher") {
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => TeacherDescription()),
          );
        }
        return;
      }
    }

    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SizedBox.shrink(),
      );
    }


    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonCircleAvatar(size: 60),
              SizedBox(height: 40),

              // ───── Student Portal Button ─────
              StudentPortalLogInButtonSection(),

              SizedBox(height: 24),

              // ───── Teacher Portal Button ─────
              TeacherPortalLogInButton(),
            ],
          ),
        ),
      ),
    );
  }
}
