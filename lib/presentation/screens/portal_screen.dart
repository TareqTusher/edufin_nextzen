import 'package:edufin/services/app_routes.dart';
import 'package:edufin/services/auth.dart';
import 'package:edufin/core/common_components/circle_avatar.dart';
import 'package:edufin/core/theme/colors.dart';
import 'package:edufin/presentation/widgets/student_portal_log_in_button_section.dart';
import 'package:edufin/presentation/widgets/teacher_portal_log_in_button.dart';
import 'package:edufin/services/router.dart';
import 'package:flutter/material.dart';

class PortalScreen extends StatefulWidget {
  const PortalScreen({super.key});

  @override
  State<PortalScreen> createState() => _PortalScreenState();
}

class _PortalScreenState extends State<PortalScreen> {
  bool isLoading=true;

  @override
  void initState() {
    super.initState();
    _checkLogin();
  }

  void _checkLogin() async {
    print("role");
    final role = await SessionService.getRole();
print('Saved role: $role'); 

    if (mounted) {
      if (role == 'student') {
       router.go(AppRoutesPath.studentDescription);
      } else if (role == 'teacher') {
           router.go(AppRoutesPath.teacherDescription);

      } else {
        setState(() => isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CommonCircleAvatar(size: 80),
              SizedBox(height: 40),
              StudentPortalLogInButtonSection(),
              SizedBox(height: 24),
              TeacherPortalLogInButton(),
            ],
          ),
        ),
      ),
    );
  }
}
