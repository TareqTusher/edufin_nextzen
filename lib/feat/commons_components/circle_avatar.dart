import 'package:flutter/material.dart';

class CommonCircleAvatar extends StatelessWidget {
  const CommonCircleAvatar({super.key, required this.size});
  final double size;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size,
      backgroundImage: AssetImage("assets/images/prottoy.jpg"),
    );
  }
}
