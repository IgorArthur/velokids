import 'package:get/get.dart';
import 'package:velokids/model/service.dart';

class MainController extends GetxController {
  MainController() {
    _loadVehicles();
  }

  late Service car1;
  late Service car2;
  late Service car3;
  late Service motorcycle1;
  late Service motorcycle2;

  late Service selectedService;

  void _loadVehicles() {
    car1 = Service(
      isFree: false,
      vehicle: 'Carro 1',
      date: '18/06/2022',
      clientName: 'Igor Arthur',
      clientDocument: '140.440.734-06',
      time: '11:30 - 12:30',
      value: 'RS 50.00',
    );
    car2 = Service(
      isFree: true,
      vehicle: 'Carro 2',
      date: '',
      clientName: '',
      clientDocument: '',
      time: '',
      value: '',
    );
    car3 = Service(
      isFree: false,
      vehicle: 'Carro 3',
      date: '18/06/2022',
      clientName: 'David Ferreira',
      clientDocument: '440.140.436-60',
      time: '09:30 - 10;00',
      value: 'RS 25.00',
    );
    motorcycle1 = Service(
      isFree: true,
      vehicle: 'Moto 1',
      date: '',
      clientName: '',
      clientDocument: '',
      time: '',
      value: '',
    );
    motorcycle2 = Service(
      isFree: true,
      vehicle: 'Moto 2',
      date: '',
      clientName: '',
      clientDocument: '',
      time: '',
      value: '',
    );
  }
}
