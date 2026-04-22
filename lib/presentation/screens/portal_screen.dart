import 'package:edufin/feat/commons_components/circle_avatar.dart';
import 'package:edufin/feat/commons_components/common_elevated_button.dart';
import 'package:edufin/feat/styles/colors.dart';
import 'package:edufin/feat/styles/strings.dart';
import 'package:edufin/feat/styles/text_style.dart';
import 'package:edufin/presentation/screens/student_description.dart';
import 'package:edufin/presentation/screens/teacher_description.dart';
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
    bool isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
    String role = prefs.getString("role") ?? "";

    if (isLoggedIn) {
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

    final TextEditingController emailTEController = TextEditingController();
    final TextEditingController passTEController = TextEditingController();
    final GlobalKey<FormState> key = GlobalKey<FormState>();

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

              /// 🎓 Student Portal
              CommonElevatedButton(
                text: Strings.studentPortal,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Form(
                          key: key,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                Strings.enterDetails,
                                style: TextStyles.fontText16Regular(
                                    AppColors.blackColor),
                              ),
                              SizedBox(height: 16),
                              TextFormField(
                                controller: emailTEController,
                                decoration: InputDecoration(
                                  hintText: "Student Id",
                                  filled: true,
                                ),
                                validator: (v) =>
                                    v!.isEmpty ? "Enter Student Id" : null,
                              ),
                              SizedBox(height: 12),
                              TextFormField(
                                controller: passTEController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  filled: true,
                                ),
                                validator: (v) =>
                                    v!.isEmpty ? "Enter Password" : null,
                              ),
                              SizedBox(height: 16),
                              CommonElevatedButton(
                                text: Strings.login,
                                onTap: () async {
                                  if (key.currentState!.validate()) {
                                    final prefs =
                                        await SharedPreferences.getInstance();
                                    await prefs.setBool("isLoggedIn", true);
                                    await prefs.setString("role", "student");

                                    if (context.mounted) {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                StudentDescription()),
                                      );
                                    }
                                  }
                                },
                                backgroundClr: AppColors.primary600,
                                color: AppColors.whiteColor,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                backgroundClr: AppColors.primary600,
                color: AppColors.whiteColor,
                size: 20,
              ),

              SizedBox(height: 24),

              /// 👨‍🏫 Teacher Portal
              CommonElevatedButton(
                text: Strings.teacherPortal,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Form(
                          key: key,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                Strings.enterDetails,
                                style: TextStyles.fontText16Regular(
                                    AppColors.blackColor),
                              ),
                              SizedBox(height: 16),
                              TextFormField(
                                controller: emailTEController,
                                decoration: InputDecoration(
                                  hintText: "Teacher Id",
                                  filled: true,
                                ),
                                validator: (v) =>
                                    v!.isEmpty ? "Enter Teacher Id" : null,
                              ),
                              SizedBox(height: 12),
                              TextFormField(
                                controller: passTEController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  filled: true,
                                ),
                                validator: (v) =>
                                    v!.isEmpty ? "Enter Password" : null,
                              ),
                              SizedBox(height: 16),
                              CommonElevatedButton(
                                text: Strings.login,
                                onTap: () async {
                                  if (key.currentState!.validate()) {
                                    final prefs =
                                        await SharedPreferences.getInstance();
                                    await prefs.setBool("isLoggedIn", true);
                                    await prefs.setString("role", "teacher");

                                    if (context.mounted) {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                TeacherDescription()),
                                      );
                                    }
                                  }
                                },
                                backgroundClr: AppColors.primary900,
                                color: AppColors.whiteColor,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                backgroundClr: AppColors.primary900,
                color: AppColors.whiteColor,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}