import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/banner/BannerItemFactory.dart';
import 'package:flutter_wanandroid/banner/Pair.dart';
import 'package:flutter_wanandroid/banner/banner_view.dart';
import 'package:flutter_wanandroid/http/http_util.dart';
import 'package:flutter_wanandroid/http/webapi.dart';
import 'package:flutter_wanandroid/models/banner_result.dart';
import 'package:flutter_wanandroid/models/bean/banner_bean.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  bool isLoading = true;

  BannerView _bannerView() {
    List<String> images = [];
    images.add(
        "http://shp.qpic.cn/ishow/2735041709/1555464892_1186005513_29965_sProdImgNo_7.jpg/0");
    images.add(
        "http://shp.qpic.cn/ishow/2735012115/1548055014_-695593207_29388_sProdImgNo_8.jpg/0");
    images.add(
        "http://shp.qpic.cn/ishow/2735012117/1548061233_587358052_15546_sProdImgNo_7.jpg/0");
    images.add(
        "http://shp.qpic.cn/ishow/2735012115/1548055591_1186005513_11229_sProdImgNo_2.jpg/0");
    images.add(
        "http://shp.qpic.cn/ishow/2735012115/1548054970_-695593207_26969_sProdImgNo_8.jpg/0");
    images.add(
        "http://shp.qpic.cn/ishow/2735012115/1548054919_1186005513_15008_sProdImgNo_8.jpg/0");
    images.add(
        "http://shp.qpic.cn/ishow/2735012115/1548054648_1186005513_7543_sProdImgNo_8.jpg/0");
    images.add(
        "http://shp.qpic.cn/ishow/2735012111/1548041716_587358052_31760_sProdImgNo_8.jpg/0");
    images.add(
        "http://shp.qpic.cn/ishow/2735011818/1547806092_1186005513_25911_sProdImgNo_8.jpg/0");
    images.add(
        "http://shp.qpic.cn/ishow/2735011818/1547806010_704174346_24775_sProdImgNo_8.jpg/0");
    images.add(
        "http://shp.qpic.cn/ishow/2735011818/1547805713_-888937974_10947_sProdImgNo_8.jpg/0");
    images.add(
        "http://shp.qpic.cn/ishow/2735011817/1547805561_1186005513_9534_sProdImgNo_8.jpg/0");
    images.add(
        "http://shp.qpic.cn/ishow/2735011815/1547798220_-695593207_3376_sProdImgNo_8.jpg/0");
    images.add(
        "http://shp.qpic.cn/ishow/2735011815/1547797630_587358052_19346_sProdImgNo_8.jpg/0");
    images.add(
        "http://shp.qpic.cn/ishow/2735011815/1547797006_-695593207_2609_sProdImgNo_8.jpg/0");
    images.add(
        "http://shp.qpic.cn/ishow/2735011814/1547791774_-695593207_20786_sProdImgNo_8.jpg/0");
    images.add(
        "http://shp.qpic.cn/ishow/2735011814/1547791837_587358052_13686_sProdImgNo_8.jpg/0");
    images.add(
        "http://shp.qpic.cn/ishow/2735011117/1547197926_-888937974_22336_sProdImgNo_8.jpg/0");
    images.add(
        "http://shp.qpic.cn/ishow/2735011016/1547110612_-888937974_7699_sProdImgNo_8.jpg/0");
    images.add(
        "http://shp.qpic.cn/ishow/2735010915/1547020516_704174346_3495_sProdImgNo_8.jpg/0");
    images.add(
        "http://shp.qpic.cn/ishow/2735010816/1546935490_-888937974_8713_sProdImgNo_8.jpg/0");
    images.add(
        "http://shp.qpic.cn/ishow/2735010915/1547020064_-888937974_25739_sProdImgNo_8.jpg/0");
    images.add(
        "http://shp.qpic.cn/ishow/2735041709/1555463886_-695593207_22439_sProdImgNo_7.jpg/0");

    List<Pair<String, Color>> params = [];
    for (String image in images) {
      params.add(Pair.create(image, Colors.grey[500]));
    }

    return new BannerView(
      BannerItemFactory.banners(params),
      indicatorMargin: 5.0,
      indicatorNormal: new Container(
        width: 5.0,
        height: 5.0,
        decoration: new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.all(
            new Radius.circular(5.0),
          ),
        ),
      ),
      indicatorSelected: new Container(
        width: 5.0,
        height: 5.0,
        decoration: new BoxDecoration(
          color: Colors.black,
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.all(
            new Radius.circular(5.0),
          ),
        ),
      ),
      indicatorBuilder: (context, indicator) {
        Widget cc = new Container(
          alignment: Alignment.center,
          padding: new EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          height: 40.0,
          width: double.infinity,
//          color: Colors.grey[300],
          child: indicator,
        );
        return new Align(
          alignment: Alignment.bottomCenter,
          child: new Opacity(
            opacity: 0.5,
            child: cc,
          ),
        );
      },
//    indicatorBuilder: (context, indicator){
//      return new Align(
//        alignment: Alignment.bottomCenter,
//        child: new Opacity(
//          opacity: 0.5,
//          child: new Container(
//            height: 40.0,
//            padding: new EdgeInsets.symmetric(horizontal: 16.0),
//            color: Colors.black45,
//            alignment: Alignment.centerRight,
//            child: indicator,
//          ),
//        ),
//      );
//    },

      onPageChanged: (index) {
        //print("index===$index");
      },
      onItemTaps: (index) {
        //print("点击了第$index个item");
      },
    );
  }

  BannerView _bannerView0(List<BannerModel> list) {
    List<Pair<String, Color>> params = [];
    for (BannerModel model in list) {
      params.add(Pair.create(model.imagePath, Colors.grey[500]));
    }

    return new BannerView(
      BannerItemFactory.banners(params),
    );
  }

  List<BannerModel> list;

  void getBanner() async {
//    HttpUtil.get(Api.BANNER, (List<BannerModel> data){
//      if (null != data) {
//        list = data;
//        list.forEach((model) {
//          print(model.imagePath);
//        });
//      }
//    });
    await http.get(Api.BANNER).then((http.Response response) {
      //print(response.body.toString());
      Map<String, dynamic> resultModel = json.decode(response.body);
      BannerResultModel model = BannerResultModel.fromJson(resultModel);
      isLoading = false;
      setState(() {
        if (null != model) {
          list = model.data;
          print(model.data.length);
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getBanner();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: isLoading
          ? new Center(
              child: new CircularProgressIndicator(),
            )
          : Center(
              child: ListView.builder(itemBuilder: (context, index) {
                if (index == 0) {
                  return new Container(
                    child: _bannerView0(list),
                    height: 225,
                  );
                  //return ListTile(title: Text("data:$index"),);
                } else {
                  return ListTile(
                    title: Text("data:$index"),
                  );
                }
              }),
            ),
    );
  }
}
