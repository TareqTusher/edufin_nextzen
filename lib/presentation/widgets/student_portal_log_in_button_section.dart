import 'package:edufin/services/auth.dart';
import 'package:edufin/core/common_components/common_elevated_button.dart';
import 'package:edufin/core/theme/colors.dart';
import 'package:edufin/core/theme/strings.dart';
import 'package:edufin/core/theme/text_style.dart';
import 'package:edufin/presentation/screens/student_description.dart';
import 'package:flutter/material.dart';

class StudentPortalLogInButtonSection extends StatelessWidget {
  const StudentPortalLogInButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailTEController = TextEditingController();
    final TextEditingController passTEController = TextEditingController();
    final GlobalKey<FormState> key = GlobalKey<FormState>();
    return CommonElevatedButton(
      text: Strings.studentPortal,
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return Padding(
              padding: EdgeInsets.only(
                left: 12,
                right: 12,
                top: 12,
                bottom: MediaQuery.of(context).viewInsets.bottom + 12,
              ),
              child: Form(
                key: key,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      Strings.enterDetails,
                      style: TextStyles.fontText16Regular(AppColors.blackColor),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: emailTEController,
                      decoration: InputDecoration(
                        hintText: "Student Id",
                        filled: true,
                        fillColor: AppColors.whiteColor,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      validator: (v) => v!.isEmpty ? "Enter Student Id" : null,
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      controller: passTEController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Password",
                        filled: true,
                        fillColor: AppColors.whiteColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (v) => v!.isEmpty ? "Enter Password" : null,
                    ),
                    SizedBox(height: 16),
                    CommonElevatedButton(
                      text: Strings.login,
                      onTap: () async {
                        if (key.currentState!.validate()) {
                          await SessionService.saveSession('student');

                          if (context.mounted) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => StudentDescription(),
                              ),
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
    );
  }
}