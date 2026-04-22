import 'package:edufin/feat/commons_components/circle_avatar.dart';
import 'package:edufin/feat/styles/colors.dart';
import 'package:edufin/feat/styles/strings.dart';
import 'package:edufin/feat/styles/text_style.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Container(
            height: 100,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.9),
                  Colors.white.withOpacity(0.7),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),

          SizedBox(height: 40),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  //padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 40,
                        decoration: BoxDecoration(
                          color: AppColors.primary600,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(Icons.home, color: Colors.white),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Home",
                        style: TextStyles.fontText14Medium(AppColors.grey600),
                      ),

                      SizedBox(width: 12),
                    ],
                  ),
                ),

                CommonCircleAvatar(size: 50),
                Row(
                  children: [
                    Icon(Icons.school, size: 40, color: AppColors.primary600),
                    SizedBox(width: 12),

                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: Strings.edu,
                            style: TextStyles.fontText32SemiBold(
                              AppColors.primary700,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
