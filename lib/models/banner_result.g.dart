// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerResultModel _$BannerResultModelFromJson(Map<String, dynamic> json) {
  return BannerResultModel((json['data'] as List)
      ?.map((e) =>
          e == null ? null : BannerModel.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$BannerResultModelToJson(BannerResultModel instance) =>
    <String, dynamic>{'data': instance.data};
