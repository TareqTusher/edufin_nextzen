import 'package:edufin/feat/commons_components/circle_avatar.dart';
import 'package:edufin/feat/styles/colors.dart';
import 'package:edufin/feat/styles/strings.dart';
import 'package:edufin/feat/styles/text_style.dart';
import 'package:edufin/presentation/screens/home_page.dart';
import 'package:edufin/presentation/screens/portal_screen.dart';
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
    List<IconData> icons = [
      Icons.person,
      Icons.account_balance_wallet,

      Icons.person_outline,
      Icons.menu_book,
      Icons.calendar_month,
      Icons.edit,
      Icons.event_available,

      Icons.description,
      Icons.exit_to_app,

      Icons.bed,
      Icons.directions_bus,
      Icons.menu_book,
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
          backgroundColor: AppColors.whiteColor,
          leading: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PortalScreen()),
              );
            },
            child: Icon(Icons.chevron_left,size: 24,),
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

                  SizedBox(height: 16),
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
