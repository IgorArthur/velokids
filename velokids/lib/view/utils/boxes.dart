import 'package:hive_flutter/hive_flutter.dart';

import '../../model/history.dart';
import '../../model/service.dart';

class Boxes {
  static Box<History> getHistory() =>
    Hive.box<History>('history');
  
  static Box<Service> getService() =>
    Hive.box<Service>('service');
}