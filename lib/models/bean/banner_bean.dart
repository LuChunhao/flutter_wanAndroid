import 'package:json_annotation/json_annotation.dart';
part 'banner_bean.g.dart';

@JsonSerializable()
class BannerModel {
  String desc;
  int id;
  String imagePath;
  int isVisible;
  int order;
  String title;
  int type;
  String url;

  BannerModel(this.desc, this.id, this.imagePath, this.isVisible, this.order,
      this.title, this.type, this.url);

  factory BannerModel.fromJson(Map<String, dynamic> json) => _$BannerModelFromJson(json);
  Map<String, dynamic> toJson() => _$BannerModelToJson(this);

//  BannerModel.fromJson(Map<String, dynamic> json) {
//    desc = json["desc"];
//    id = json["id"];
//    imagePath = json["imagePath"];
//    isVisible = json["isVisible"];
//    order = json["order"];
//    title = json["title"];
//    type = json["type"];
//    url = json["url"];
//  }
}
