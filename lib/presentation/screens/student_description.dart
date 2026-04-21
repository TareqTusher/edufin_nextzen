import 'package:edufin/feat/commons_components/circle_avatar.dart';
import 'package:edufin/feat/styles/colors.dart';
import 'package:edufin/feat/styles/strings.dart';
import 'package:edufin/feat/styles/text_style.dart';
import 'package:flutter/material.dart';

class StudentDescription extends StatelessWidget {
  const StudentDescription({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> buttonText = [
      "Profile",
      "Fees",
      "Teacher",
      "Subject",
      "Class Schedule",
      "Homework",
      "Exam Schedule",
      "Report Card",
      "Leave Request",
      "Hostels",
      "Route",
      "Book Request",
    ];
    List<Color> colors = [
      AppColors.skyBlue100,
      AppColors.amber100,

      AppColors.green100,

      AppColors.blue100,

      AppColors.red100,

      AppColors.skyBlue100,

      AppColors.skyBlue100,

      AppColors.amber100,
      AppColors.red100,
      AppColors.amber100,
      AppColors.blue100,
      AppColors.skyBlue100,
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CommonCircleAvatar(size: 60),
                  SizedBox(height: 12),
                  Text(
                    Strings.institute,
                    style: TextStyles.fontText20SemiBold(AppColors.blackColor),
                  ),
                  SizedBox(height: 12),
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: colors.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      crossAxisCount: 3,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: colors[index],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(child: Text(buttonText[index])),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
