import 'package:edufin/feat/commons_components/circle_avatar.dart';
import 'package:edufin/feat/styles/colors.dart';
import 'package:edufin/feat/styles/strings.dart';
import 'package:edufin/feat/styles/text_style.dart';
import 'package:edufin/presentation/screens/home_page.dart';
import 'package:edufin/presentation/screens/portal_screen.dart';
import 'package:flutter/material.dart';

class TeacherDescription extends StatelessWidget {
  const TeacherDescription({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> buttonText = [
      Strings.teacher,
      Strings.studentDetails,
      Strings.studentAdd,
      Strings.attend,
      Strings.qr,
      Strings.liveClass,
      Strings.schedule,
      Strings.leave,
      Strings.fees,
      Strings.exam,
      Strings.homeWork,
      Strings.academic,
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

        List<IconData> icons = [
      Icons.person,
      Icons.badge,

      Icons.group_add,
      Icons.check_circle,
      Icons.qr_code_scanner,
      Icons.videocam,
      Icons.calendar_today,

      Icons.event_busy,
      Icons.money,

      Icons.quiz,
      Icons.home_work,
      Icons.school,
    ];
    List<Color> iconColor = [
      AppColors.deepSkyBlue,
      AppColors.amber,

      AppColors.green,

      AppColors.blue,

      AppColors.red,

      AppColors.deepSkyBlue,

      AppColors.deepSkyBlue,

      AppColors.amber,
      AppColors.red,
      AppColors.amber,
      AppColors.blue,
      AppColors.deepSkyBlue,
    ];
    return SafeArea(
      child: Scaffold(
        
        appBar: AppBar(
          backgroundColor: AppColors.white,
          leading: InkWell(
            splashColor: AppColors.whiteColor,
            hoverColor: AppColors.whiteColor,
            highlightColor: AppColors.whiteColor,
            focusColor: AppColors.whiteColor,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PortalScreen()),
              );
            },
            child: Icon(Icons.chevron_left, size: 24),
          ),
        ),
        backgroundColor: AppColors.whiteColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left:  16,right: 16,bottom: 16),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CommonCircleAvatar(size: 60),
                 
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
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: colors[index],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                icons[index],
                                size: 34,
                                color: iconColor[index],
                              ),
                              Center(child: Text(buttonText[index])),
                            ],
                          ),
                        ),
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
