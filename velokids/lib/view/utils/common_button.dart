// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:velokids/view/utils/export_utils.dart';

class CommonButton extends StatelessWidget {
  CommonButton({
    Key? key,
    required this.type,
    required this.onPressed,
    required this.title,
    this.icon,
    this.iconColor,
    this.iconSize,
  }) : super(key: key);

  int type;
  String title;
  Function() onPressed;

  IconData? icon;
  Color? iconColor;
  double? iconSize;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        width: 53.w,
        height: 5.4.h,
        decoration: BoxDecoration(
          color: type == 2 ? AppColors.neutral0 : AppColors.primary100,
          border: Border.all(
            color: type == 2 ? AppColors.error100 : AppColors.neutral0,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon == null
                ? const SizedBox()
                : Padding(
                    padding: EdgeInsets.only(right: 3.w),
                    child: Icon(
                      icon,
                      size: iconSize,
                      color: iconColor,
                    ),
                  ),
            Text(title).button(
              type == 2 ? AppColors.error100 : AppColors.neutral0,
            ),
          ],
        ),
      ),
    );
  }
}
