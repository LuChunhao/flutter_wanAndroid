import 'package:json_annotation/json_annotation.dart';
part 'article_list.g.dart';
@JsonSerializable()
class ArticleResultModel {
  Data data;
  int errorCode;
  String errorMsg;


  ArticleResultModel(this.data, this.errorCode, this.errorMsg);

  factory ArticleResultModel.fromJson(Map<String, dynamic> json) => _$ArticleResultModelFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleResultModelToJson(this);
}

@JsonSerializable()
class Data {
  int curPage;
  List<ArticleBean> datas;
  int offset;
  bool over;
  int pageCount;
  int size;
  int total;


  Data(this.curPage, this.datas, this.offset, this.over, this.pageCount,
      this.size, this.total);

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class ArticleBean {
  String apkLink;
  String author;
  int chapterId;
  String chapterName;
  bool collect;
  int courseId;
  String desc;
  String envelopePic;
  bool fresh;
  int id;
  String link;
  String niceDate;
  String origin;
  String prefix;
  String projectLink;
  int publishTime;
  int superChapterId;
  String superChapterName;
  List tags;
  String title;
  int type;
  int userId;
  int visible;
  int zan;


  ArticleBean(this.apkLink, this.author, this.chapterId, this.chapterName,
      this.collect, this.courseId, this.desc, this.envelopePic, this.fresh,
      this.id, this.link, this.niceDate, this.origin, this.prefix,
      this.projectLink, this.publishTime, this.superChapterId,
      this.superChapterName, this.tags, this.title, this.type, this.userId,
      this.visible, this.zan);

  factory ArticleBean.fromJson(Map<String, dynamic> json) => _$DataBeanFromJson(json);
  Map<String, dynamic> toJson() => _$DataBeanToJson(this);
}
