import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:velokids/view/utils/export_utils.dart';

extension AppFonts on Text {

  Text small([Color? color]) {
    final TextStyle textStyle = GoogleFonts.inriaSans(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: color ?? AppColors.neutral200);
    return Text(data!, 
      style: textStyle.merge(style),
    );
  }

  Text medium([Color? color]) {
    final TextStyle textStyle = GoogleFonts.inriaSans(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: color ?? AppColors.neutral200);
    return Text(data!, 
      style: textStyle.merge(style),
    );
  }

  Text large([Color? color]) {
    final TextStyle textStyle = GoogleFonts.inriaSans(
      fontWeight: FontWeight.w400,
      fontSize: 18,
      color: color ?? AppColors.neutral200);
    return Text(data!, 
      style: textStyle.merge(style),
    );
  }

  Text button([Color? color]) {
    final TextStyle textStyle = GoogleFonts.inriaSans(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: color ?? AppColors.neutral200);
    return Text(data!, 
      style: textStyle.merge(style),
    );
  }

  Text counter([Color? color]) {
    final TextStyle textStyle = GoogleFonts.inriaSans(
      fontWeight: FontWeight.w600,
      fontSize: 22,
      color: color ?? AppColors.neutral200);
    return Text(data!, 
      style: textStyle.merge(style),
    );
  }

}