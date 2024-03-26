import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CustomDivider extends StatelessWidget {
  final double? height;
  final double? thickness;
  final Color? color;

  const CustomDivider({super.key, this.height = 1, this.thickness = 1, this.color = kDividerColor});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color,
      height: height,
      thickness: thickness,
    );
  }
}
