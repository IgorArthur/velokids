import 'package:flutter/material.dart';
import 'package:velokids/view/pages/history_page.dart';
import 'package:velokids/view/pages/main_page.dart';
import 'package:velokids/view/pages/service_page.dart';
import 'package:velokids/view/utils/export_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder:
        (BuildContext context, Orientation orientation, DeviceType deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const MainPage(),
        routes: {
          '/main': (BuildContext context) => const MainPage(),
          '/history': (BuildContext context) => const HistoryPage(),
          '/service': (BuildContext context) => const ServicePage(),
        },
      );
    });
  }
}
