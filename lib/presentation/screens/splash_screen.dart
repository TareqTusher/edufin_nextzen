import 'package:edufin/feat/commons_components/circle_avatar.dart';
import 'package:edufin/feat/styles/colors.dart';
import 'package:edufin/feat/styles/strings.dart';
import 'package:edufin/feat/styles/text_style.dart';
import 'package:edufin/presentation/screens/portal_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
super.initState();
      Future.delayed(
      Duration(seconds: 1),
      () => Navigator.push(context, MaterialPageRoute(builder: (context)=>PortalScreen())),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primary400,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                CommonCircleAvatar(size: 80,),
                  SizedBox(height: 100),
        
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: Strings.edu,
                          style: TextStyles.fontText32SemiBold(
                            AppColors.whiteColor,
                          ),
                        ),
                           TextSpan(
                          text: Strings.fin,
                          style: TextStyles.fontText32SemiBold(
                            AppColors.blackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
