import 'package:hive_flutter/hive_flutter.dart';

part 'service.g.dart';

// Para futuras alterações em produção: 
//  Se excluir algum @HiveField, nunca usar o mesmo número já utilizado antes.
//  Para ediçao e troca de tipo de um @HiveField, trocar o número, e NUNCA utilizar um número utilizado antes
//  Recomendação: Deixar comentado todos os campos que não forem ser mais utilizados. 

@HiveType(typeId: 1)
class Service extends HiveObject {

  @HiveField(0)
  late int id;

  @HiveField(1)
  late String vehicle;
  
  @HiveField(2)
  late bool isFree;

  @HiveField(3)
  late String date;

  @HiveField(4)
  late String clientName;

  @HiveField(5)
  late String clientDocument;
  
  @HiveField(6)
  late String time;
  
  @HiveField(7)
  late String value;
}
