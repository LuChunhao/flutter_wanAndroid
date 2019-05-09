import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_wanandroid/models/bean/banner_bean.dart';
part 'banner_result.g.dart';

@JsonSerializable()
class BannerResultModel {

  List<BannerModel> data;

  BannerResultModel(this.data);

  factory BannerResultModel.fromJson(Map<String, dynamic> json) => _$BannerResultModelFromJson(json);
  Map<String, dynamic> toJson() => _$BannerResultModelToJson(this);


}