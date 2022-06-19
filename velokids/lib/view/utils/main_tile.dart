import 'package:flutter/material.dart';
import 'package:velokids/controller/main_controller.dart';
import 'package:velokids/model/service.dart';
import 'package:velokids/view/utils/export_utils.dart';

class MainTile extends StatelessWidget {
  const MainTile({
    Key? key,
    required this.service,
    required this.controller,
  }) : super(key: key);

  final Service service;
  final MainController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.selectService(service);
        Navigator.pushNamed(context, '/service');
      },
      child: Container(
        margin: EdgeInsets.only(top: 1.h),
        child: Column(
          children: [
            SizedBox(
              width: 80.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: 35.w,
                      height: 2.h,
                      child: Text(
                        service.vehicle.toUpperCase(),
                        overflow: TextOverflow.ellipsis,
                      ).small(AppColors.primary100)),
                  Container(
                    alignment: Alignment.centerRight,
                    width: 35.w,
                    height: 2.h,
                    child: Text(
                      service.date,
                      overflow: TextOverflow.clip,
                      textAlign: TextAlign.right,
                    ).small(),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 0.5.h),
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              width: 85.w,
              height: 10.h,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primary100),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(children: [
                Container(
                  alignment: Alignment.centerLeft,
                  width: 30.w,
                  child: Text(
                    service.isFree == true ? 'LIVRE' : 'OCUPADO',
                    overflow: TextOverflow.ellipsis,
                  ).medium(service.isFree == true
                      ? AppColors.sucess100
                      : AppColors.error100),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 18.w,
                  child: Text(
                    service.time,
                    overflow: TextOverflow.ellipsis,
                  ).medium(),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  width: 30.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        width: 25.w,
                        height: 3.h,
                        child: Text(
                          service.clientName,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.right,
                        ).button(),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        width: 25.w,
                        height: 3.h,
                        child: Text(
                          service.clientDocument,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.right,
                        ).small(),
                      ),
                    ],
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
