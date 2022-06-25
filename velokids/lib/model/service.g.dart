// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ServiceAdapter extends TypeAdapter<Service> {
  @override
  final int typeId = 1;

  @override
  Service read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Service()
      ..id = fields[0] as int
      ..vehicle = fields[1] as String
      ..isFree = fields[2] as bool
      ..date = fields[3] as String
      ..clientName = fields[4] as String
      ..clientDocument = fields[5] as String
      ..time = fields[6] as String
      ..value = fields[7] as String;
  }

  @override
  void write(BinaryWriter writer, Service obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.vehicle)
      ..writeByte(2)
      ..write(obj.isFree)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.clientName)
      ..writeByte(5)
      ..write(obj.clientDocument)
      ..writeByte(6)
      ..write(obj.time)
      ..writeByte(7)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ServiceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
