import 'package:edufin/feat/styles/colors.dart';
import 'package:edufin/feat/styles/text_style.dart';
import 'package:flutter/material.dart';

class CommonElevatedButton extends StatelessWidget {
  const CommonElevatedButton({super.key, this.icons, required this.text, required this.onTap,  this.color=AppColors.primary600, required this.backgroundClr,  this.height=50,  this.borderColor=AppColors.primary600,this.iconColor=AppColors.whiteColor,  this.size});
  final IconData? icons;
  final String text;
  final VoidCallback onTap;
  final Color color,backgroundClr,borderColor,iconColor;
  final double height;
  final double? size;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: onTap,
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          color:backgroundClr ,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: borderColor),
        ),
        child: Center(
          child: icons == null
              ? Text(
                  text,
                  style: TextStyles.fontText14Medium(
                    color,
                  ).copyWith(fontSize:size ),
                )
              : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Icon(icons,size:16, color: iconColor,), SizedBox(width: 8), Text(text,style: TextStyles.fontText14Medium(
                    color,
                  ).copyWith(fontWeight: FontWeight.bold),),]),
        ),
      ),
    );
  }
}