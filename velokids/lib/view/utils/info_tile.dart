import 'package:flutter/material.dart';
import 'package:velokids/view/utils/export_utils.dart';

class InfoTile extends StatelessWidget {
  InfoTile({
    Key? key,
    required this.title,
    required this.firstInfo,
    this.secondInfo,
  }) : super(key: key);

  String title;
  String firstInfo;
  String? secondInfo;

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
              child: secondInfo != null
                  ? Row(
                      children: [
                        Container(
                            alignment: Alignment.centerLeft,
                            width: 35.w,
                            child: Text(firstInfo).button()),
                        const Expanded(child: SizedBox()),
                        Container(
                            alignment: Alignment.centerRight,
                            width: 35.w,
                            child: Text(secondInfo!).button()),
                      ],
                    )
                  : SizedBox(width: 78.w, child: Text(firstInfo).button()),
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
