// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prn_dose.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrnDose _$PrnDoseFromJson(Map<String, dynamic> json) => PrnDose()
  ..minQty = (json['minQty'] as num).toDouble()
  ..maxQty = (json['maxQty'] as num).toDouble()
  ..nteQty = (json['nteQty'] as num).toDouble()
  ..hourInterval = json['hourInterval'] as int;

Map<String, dynamic> _$PrnDoseToJson(PrnDose instance) => <String, dynamic>{
      'minQty': instance.minQty,
      'maxQty': instance.maxQty,
      'nteQty': instance.nteQty,
      'hourInterval': instance.hourInterval,
    };
