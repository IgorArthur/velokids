// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velokids/view/utils/export_utils.dart';

class InfoTile extends StatelessWidget {
  InfoTile(
      {Key? key, required this.title, required this.info, this.mask, this.hint})
      : super(key: key);

  String title;
  ValueNotifier<String> info;

  String? hint;
  List<TextInputFormatter>? mask;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 11.h,
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            bottom: 0,
            child: Container(
              alignment: Alignment.center,
              width: 85.w,
              height: 8.h,
              padding: EdgeInsets.symmetric(horizontal: 3.5.w, vertical: 0.6.h),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primary100),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                alignment: Alignment.centerLeft,
                width: 77.w,
                child: TextFormField(
                  onChanged: (String value) {
                    info.value = value;
                  },
                  inputFormatters: mask,
                  initialValue: info.value,
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 3.w, bottom: 1.h),
                    hintText: hint,
                    hintStyle: const TextStyle(
                      color: AppColors.neutral100,
                      fontSize: 14,
                    ),
                  ),
                  style: const TextStyle(
                    color: AppColors.neutral200,
                    fontSize: 14,
                  ),
                  cursorColor: AppColors.neutral100,
                ),
              ),
            ),
          ),
          Positioned(
            left: 11.w,
            bottom: 7.h,
            child: Container(
              height: 2.h,
              color: AppColors.neutral0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                ).small(AppColors.primary100),
              ),
            ),
          )
        ],
      ),
    );
  }
}
