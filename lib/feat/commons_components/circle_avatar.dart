import 'package:edufin/feat/styles/colors.dart';
import 'package:edufin/feat/styles/strings.dart';
import 'package:edufin/feat/styles/text_style.dart';
import 'package:flutter/material.dart';

class CommonCircleAvatar extends StatelessWidget {
  const CommonCircleAvatar({super.key, required this.size,  this.textColor=AppColors.black});
  final double size;

final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: size,
          backgroundImage: AssetImage("assets/images/prottoy.jpg"),
        ),
        SizedBox(height: 12,),
        Text(Strings.institute,style: TextStyles.fontText20SemiBold(textColor),)
      ],
    );
  }
}
