import 'package:flutter/material.dart';
import 'package:velokids/controller/main_controller.dart';
import 'package:velokids/view/utils/export_utils.dart';
import 'package:velokids/view/utils/search_field.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../utils/boxes.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.neutral0,
        toolbarHeight: 6.7.h,
        title: const Text('VELOKIDS').button(AppColors.neutral200),
        centerTitle: true,
        leading: TextButton(
          child: Icon(
            Icons.arrow_back,
            color: AppColors.neutral200,
            size: 5.8.w,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: AppColors.neutral0,
      body: ValueListenableBuilder<Box>(
          valueListenable: Boxes.getHistory().listenable(),
          builder: (context, box, widget) {
            // final history = Boxes.getHistory().values.toList().cast<History>();

            return SafeArea(child: _handleBody());
          }),
    );
  }

  Widget _handleBody() {
    return GetBuilder<MainController>(
        init: MainController(),
        builder: (mainController) {
          return SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 2.h),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 2.h),
                      width: 80.w,
                      child:
                          const Text('HISTÓRICO').large(AppColors.primary100)),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.5.h),
                    child: SearchField(
                      notifier: mainController.filterField,
                      onPressed: () {
                        mainController.filterList();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 70.h,
                    child: ListView.builder(
                        itemCount: mainController.serviceHistory.length,
                        itemBuilder: (BuildContext context, int index) {
                          return HistoryTile(
                            date: mainController.serviceHistory[index].date,
                            time: mainController.serviceHistory[index].time,
                            vehicle:
                                mainController.serviceHistory[index].vehicle,
                            clientName:
                                mainController.serviceHistory[index].clientName,
                          );
                        }),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
