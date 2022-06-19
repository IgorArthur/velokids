import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:velokids/model/history.dart';
import 'package:velokids/model/service.dart';

class MainController extends GetxController {
  MainController() {
    _loadVehicles();
    _loadHistory();
  }

  final Map<int, Service> services = <int, Service>{};
  List<History> originalServiceHistory = <History>[];
  List<History> serviceHistory = <History>[];
  ValueNotifier<String> filterField = ValueNotifier('');
  late Service selectedService;
  ValueNotifier<String> clientNameField = ValueNotifier('');
  ValueNotifier<String> clientDocumentField = ValueNotifier('');
  ValueNotifier<String> rentField = ValueNotifier('');
  ValueNotifier<String> valueField = ValueNotifier('');

  void _loadVehicles() {
    services[0] = Service(
      id: 0,
      vehicle: 'Carro 1',
      isFree: false,
      date: '18/06/2022',
      clientName: 'Igor Arthur',
      clientDocument: '140.440.734-06',
      time: '11:30 - 12:30',
      value: 'RS 50.00',
    );
    services[1] = Service(
      id: 1,
      vehicle: 'Carro 2',
      isFree: true,
      date: '',
      clientName: '',
      clientDocument: '',
      time: '',
      value: '',
    );
    services[2] = Service(
      id: 2,
      vehicle: 'Carro 3',
      isFree: true,
      date: '',
      clientName: '',
      clientDocument: '',
      time: '',
      value: '',
    );
    services[3] = Service(
      id: 3,
      vehicle: 'Moto 1',
      isFree: true,
      date: '',
      clientName: '',
      clientDocument: '',
      time: '',
      value: '',
    );
    services[4] = Service(
      id: 4,
      vehicle: 'Moto 2',
      isFree: true,
      date: '',
      clientName: '',
      clientDocument: '',
      time: '',
      value: '',
    );

    update();
  }

  void _loadHistory() {
    originalServiceHistory = [];
    serviceHistory = [];

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

  void generateReceiptService() {
    final now = DateTime.now();
    services[selectedService.id]!.clientName = clientNameField.value;
    services[selectedService.id]!.clientDocument = clientDocumentField.value;
    services[selectedService.id]!.time = rentField.value;
    services[selectedService.id]!.value = valueField.value;
    services[selectedService.id]!.isFree = false;
    services[selectedService.id]!.date = '${now.day}/${now.month}/${now.year}';

    originalServiceHistory.add(
      History(
        vehicle: selectedService.vehicle,
        date: '${now.day}/${now.month}/${now.year}',
        clientName: clientNameField.value,
        time: rentField.value,
      ),
    );

    serviceHistory = originalServiceHistory;

    update();

    update();
  }

  void deleteService() {
    services[selectedService.id]!.cleanService();

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
