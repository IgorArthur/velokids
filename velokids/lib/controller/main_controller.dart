import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:velokids/model/history.dart';
import 'package:velokids/model/service.dart';
import 'package:velokids/view/utils/boxes.dart';

class MainController extends GetxController {
  MainController();

  Map<dynamic, Service> services = <dynamic, Service>{};
  List<History> originalServiceHistory = <History>[];
  List<History> serviceHistory = <History>[];
  ValueNotifier<String> filterField = ValueNotifier('');
  late Service selectedService;
  ValueNotifier<String> clientNameField = ValueNotifier('');
  ValueNotifier<String> clientDocumentField = ValueNotifier('');
  ValueNotifier<String> rentField = ValueNotifier('');
  ValueNotifier<String> valueField = ValueNotifier('');

  void onInit(){
    _loadVehicles();
    _loadHistory();
  }

  // On the first app incialization on the phone, the controller create the services on hive box of services, after this, the services is only going to be updated. 
  void createVehicles() {
    var service0 = Service()
      ..id = 0
      ..vehicle = 'Carro 1'
      ..isFree = true
      ..date = ''
      ..clientName = ''
      ..clientDocument = ''
      ..time = ''
      ..value = '';
    Boxes.getService().put(0, service0);

    var service1 = Service()
      ..id = 1
      ..vehicle = 'Carro 2'
      ..isFree = true
      ..date = ''
      ..clientName = ''
      ..clientDocument = ''
      ..time = ''
      ..value = '';
    Boxes.getService().put(1, service1);

    var service2 = Service()
      ..id = 2
      ..vehicle = 'Carro 3'
      ..isFree = true
      ..date = ''
      ..clientName = ''
      ..clientDocument = ''
      ..time = ''
      ..value = '';
    Boxes.getService().put(2, service2);

    var service3 = Service()
      ..id = 3
      ..vehicle = 'Moto 1'
      ..isFree = true
      ..date = ''
      ..clientName = ''
      ..clientDocument = ''
      ..time = ''
      ..value = '';
    Boxes.getService().put(3, service3);

    var service4 = Service()
      ..id = 4
      ..vehicle = 'Moto 2'
      ..isFree = true
      ..date = ''
      ..clientName = ''
      ..clientDocument = ''
      ..time = ''
      ..value = '';
    Boxes.getService().put(4, service4);

    services = Boxes.getService().toMap();
    
    log('=============== CRIOU OS 5 SERVICES ==========');
  }

  void _loadVehicles(){
    services = Boxes.getService().toMap();
  }

  void _loadHistory() {
    originalServiceHistory = Boxes.getHistory().values.toList().cast<History>(); 
    serviceHistory = originalServiceHistory;

    update();
  }

  
  void selectService(Service service) {
    selectedService = service;

    clientDocumentField.value = selectedService.clientDocument;
    clientNameField.value = selectedService.clientName;
    rentField.value = selectedService.time;
    valueField.value = selectedService.value;

    update();
  }

  // add Service
  void generateReceiptService(Service service) {
    final now = DateTime.now();


    service.isFree = false;
    service.date = '${now.day}/${now.month}/${now.year}';
    service.clientName = clientNameField.value;
    service.clientDocument = clientDocumentField.value;
    service.time = rentField.value;
    service.value = valueField.value;

    service.save();

    services = Boxes.getService().toMap();

    
    // Add service on the History

    var history = History()
      ..vehicle = selectedService.vehicle
      ..date = '${now.day}/${now.month}/${now.year}'
      ..clientName = clientNameField.value
      ..time = rentField.value;

    Boxes.getHistory().add(history);

    originalServiceHistory = Boxes.getHistory().values.toList().cast<History>(); 
    serviceHistory = originalServiceHistory;

    update();
  }

  void cleanService(Service service) {
    service.isFree = true;
    service.date = '';
    service.clientName = '';
    service.clientDocument = '';
    service.time = '';
    service.value = '';

    service.save();

    update();
  }

  void filterList() {
    final filteredList = <History>[];

    for (final item in originalServiceHistory) {
      if (item.clientName
          .toLowerCase()
          .removeAllWhitespace
          .contains(filterField.value.toLowerCase().removeAllWhitespace)) {
        filteredList.add(item);
      }
    }

    serviceHistory = filteredList;

    update();
  }
}
