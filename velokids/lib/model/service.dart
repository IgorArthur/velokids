class Service {
  Service({
    required this.id,
    required this.vehicle,
    
    required this.isFree,
    required this.date,
    required this.clientName,
    required this.clientDocument,
    required this.time,
    required this.value,
  });

  final int id;
  final String vehicle;
  late bool isFree;
  late String date;
  late String clientName;
  late String clientDocument;
  late String time;
  late String value;

  void cleanService() {
    isFree = true;
    date = '';
    clientName = '';
    clientDocument = '';
    time = '';
    value = '';
  }
}
