class Service {
  Service({
    required this.isFree,
    required this.vehicle,
    required this.date,
    required this.clientName,
    required this.clientDocument,
    required this.time,
    required this.value,
  });

  late bool isFree;
  late String vehicle;
  late String date;
  late String clientName;
  late String clientDocument;
  late String time;
  late String value;
}
