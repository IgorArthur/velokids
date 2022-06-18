import 'package:flutter/material.dart';
import 'package:velokids/view/utils/export_utils.dart';

class HistoryTile extends StatelessWidget {
  const HistoryTile({
    Key? key,
    required this.date,
    required this.vehicle,
    required this.time,
    required this.clientName,
  }) : super(key: key);

  final String date;

  final String vehicle;
  final String time;
  final String clientName;

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
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              width: 85.w,
              height: 8.h,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primary100),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      width: 23.5.w,
                      height: 3.h,
                      child: Text(vehicle).small(),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 25.w,
                      height: 3.h,
                      child: Text(time).small(),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      width: 23.5.w,
                      height: 3.h,
                      child: Text(clientName).small(),
                    )
                  ]),
            ),
          ),
          Positioned(
            left: 11.w,
            bottom: 7.h,
            child: Container(
              color: AppColors.neutral0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Text(date).small(AppColors.primary100),
              ),
            ),
          )
        ],
      ),
    );
  }
}
