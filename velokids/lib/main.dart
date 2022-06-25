import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:velokids/controller/main_controller.dart';
import 'package:velokids/view/pages/history_page.dart';
import 'package:velokids/view/pages/main_page.dart';
import 'package:velokids/view/pages/service_page.dart';
import 'package:velokids/view/utils/export_utils.dart';

import 'model/history.dart';
import 'model/service.dart';
import 'view/utils/boxes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Set the Status bar to color Transparent, and the icon colors to black.
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  ));

  await Hive.initFlutter();

  // Register the adpters of hive to use the hive Object properties, and open the hive box.
  Hive.registerAdapter(HistoryAdapter());
  await Hive.openBox<History>('history');
  Hive.registerAdapter(ServiceAdapter());
  await Hive.openBox<Service>('service');
  
  // Necessary to create the vehicles on the first incialization
  Get.put(MainController());  

  // On the first app incialization on the phone, the controller create the services at the hive box of services, after this, the services are only going to be updated. 
  if(Boxes.getService().isEmpty) {
    MainController().createVehicles();
  }


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
