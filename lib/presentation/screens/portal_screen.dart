import 'package:edufin/feat/commons_components/circle_avatar.dart';
import 'package:edufin/feat/commons_components/common_elevated_button.dart';
import 'package:edufin/feat/styles/colors.dart';
import 'package:edufin/feat/styles/strings.dart';
import 'package:edufin/feat/styles/text_style.dart';
import 'package:edufin/presentation/screens/student_description.dart';
import 'package:edufin/presentation/screens/teacher_description.dart';
import 'package:flutter/material.dart';

class PortalScreen extends StatelessWidget {
  const PortalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailTEController = TextEditingController();
    final TextEditingController passTEController = TextEditingController();
    final GlobalKey<FormState> key = GlobalKey<FormState>();

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonCircleAvatar(size: 60),
          
              SizedBox(height: 40),
              CommonElevatedButton(
                text: Strings.studentPortal,
                onTap: () {

         showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Form(
                            key: key,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  Strings.enterDetails,
                                  style: TextStyles.fontText16Regular(
                                    AppColors.blackColor,
                                  ),
                                ),
                                SizedBox(height: 16),
                                TextFormField(
                                  
                                  controller: emailTEController,
                                  decoration: InputDecoration(
                                    fillColor: AppColors.whiteColor,
                                    filled: true,
                                    hintText: "Student Id",
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors.grey300,
                                      ),
                                    ),
                                  ),
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return "Enter Student Id";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 12),
                                TextFormField(
                                  obscureText: true,
                                  keyboardType: TextInputType.emailAddress,
                                  controller: passTEController,
                                  decoration: InputDecoration(
                                    fillColor: AppColors.whiteColor,
                                    filled: true,
                                    hintText: "Enter Password",
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors.grey300,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors.grey300,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors.grey300,
                                      ),
                                    ),
                                  ),
                                  validator: (String? value) {
                                    if (value?.isEmpty ?? false) {
                                      return "Enter Password";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 16),
                                SizedBox(
                                  width: 150,
                                  child: CommonElevatedButton(
                                    text: Strings.login,
                                    onTap: () {
                                      //print("object");
                                      if (key.currentState!.validate()) {
                                         Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentDescription()));
                                      }
                                    },
                                    backgroundClr: AppColors.primary600,
                                    color: AppColors.whiteColor,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
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
              CommonElevatedButton(
                text: Strings.teacherPortal,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Form(
                            key: key,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  Strings.enterDetails,
                                  style: TextStyles.fontText16Regular(
                                    AppColors.blackColor,
                                  ),
                                ),
                                SizedBox(height: 16),
                                TextFormField(

                                  controller: emailTEController,
                                  decoration: InputDecoration(
                                    fillColor: AppColors.whiteColor,
                                    filled: true,
                                    hintText: "Teacher Id",
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors.grey300,
                                      ),
                                    ),
                                  ),
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return "Enter Teacher Id";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 12),
                                TextFormField(
                                  obscureText: true,
                                  keyboardType: TextInputType.emailAddress,
                                  controller: passTEController,
                                  decoration: InputDecoration(
                                    fillColor: AppColors.whiteColor,
                                    filled: true,
                                    hintText: "Enter Password",
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors.grey300,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors.grey300,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors.grey300,
                                      ),
                                    ),
                                  ),
                                  validator: (String? value) {
                                    if (value?.isEmpty ?? false) {
                                      return "Enter Password";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 16),
                                SizedBox(
                                  width: 150,
                                  child: CommonElevatedButton(
                                    text: Strings.login,
                                    onTap: () {
                                      //print("object");
                                      if (key.currentState!.validate()) {
                                         Navigator.push(context, MaterialPageRoute(builder: (context)=>TeacherDescription()));
                                      }
                                    },
                                    backgroundClr: AppColors.primary600,
                                    color: AppColors.whiteColor,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
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
