// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'livi_pod.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LiviPod _$LiviPodFromJson(Map<String, dynamic> json) => LiviPod(
      remoteId: json['remoteId'] as String,
      medicationName: json['medicationName'] as String,
    )
      ..id = json['id'] as String
      ..schedule = json['schedule'] == null
          ? null
          : Schedule.fromJson(json['schedule'] as Map<String, dynamic>);

Map<String, dynamic> _$LiviPodToJson(LiviPod instance) => <String, dynamic>{
      'id': instance.id,
      'remoteId': instance.remoteId,
      'medicationName': instance.medicationName,
      'schedule': instance.schedule?.toJson(),
    };
