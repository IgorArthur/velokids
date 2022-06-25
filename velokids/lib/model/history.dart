import 'package:hive/hive.dart';

part 'history.g.dart';


// Para futuras alterações em produção: 
//  Se excluir algum @HiveField, nunca usar o mesmo número já utilizado antes.
//  Para ediçao e troca de tipo de um @HiveField, trocar o número, e NUNCA utilizar um número utilizado antes
//  Recomendação: Deixar comentado todos os campos que não forem ser mais utilizados. 

@HiveType(typeId: 0)
class History extends HiveObject {
  
  @HiveField(0)
  late String vehicle;

  @HiveField(1)
  late String date;

  @HiveField(2)
  late String clientName;

  @HiveField(3)
  late String time;
}
