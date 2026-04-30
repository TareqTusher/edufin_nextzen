import 'package:edufin/core/common_components/list_data.dart';
import 'package:edufin/services/app_routes.dart';
import 'package:edufin/services/auth.dart';
import 'package:edufin/core/common_components/circle_avatar.dart';
import 'package:edufin/core/theme/colors.dart';
import 'package:edufin/core/theme/strings.dart';
import 'package:edufin/presentation/screens/home_page.dart';
import 'package:edufin/presentation/screens/portal_screen.dart';
import 'package:edufin/services/router.dart';
import 'package:flutter/material.dart';

class TeacherDescription extends StatefulWidget {
  const TeacherDescription({super.key});

  @override
  State<TeacherDescription> createState() => _TeacherDescriptionState();
}

class _TeacherDescriptionState extends State<TeacherDescription> {
  @override
  Widget build(BuildContext context) {


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
              router.push(AppRoutesPath.portalScreen);
            },
            child: Icon(Icons.chevron_left, size: 24),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 12),
              child: InkWell(
                onTap: () async {
                  await SessionService.logout();
                  if (mounted) {
                    router.push(AppRoutesPath.splashScreen);
                  }
                },
                child: Icon(Icons.logout, size: 16),
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.whiteColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CommonCircleAvatar(size: 60),

                  SizedBox(height: 12),
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount:TeacherListdata. colors.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      crossAxisCount: 3,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          router.push(AppRoutesPath.homePage);
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color:TeacherListdata. colors[index],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                               TeacherListdata. icons[index],
                                size: 34,
                                color:TeacherListdata.iconColor[index],
                              ),
                              Center(child: Text(
                                
                                
                               TeacherListdata. buttonText[index])),
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
