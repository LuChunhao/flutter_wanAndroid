import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/common/constant/constant.dart';
import 'package:flutter_wanandroid/common/util/logger.dart';
import 'package:flutter_wanandroid/view/item/item_article.dart';
import 'package:flutter_wanandroid/view/widget/banner/BannerItemFactory.dart';
import 'package:flutter_wanandroid/view/widget/banner/Pair.dart';
import 'package:flutter_wanandroid/view/widget/banner/banner_view.dart';
import 'package:flutter_wanandroid/http/http_dio.dart';
import 'package:flutter_wanandroid/http/webapi.dart';
import 'package:flutter_wanandroid/models/banner_result.dart';
import 'package:flutter_wanandroid/models/bean/banner_bean.dart';
import 'package:flutter_wanandroid/models/result/article_list.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  static const String TAG = 'HomePageState>>';
  bool isLoading = true;
  int index = 0;
  List<ArticleBean> datas;

  BannerView _bannerView() {
    List<Pair<String, Color>> params = [];
    for (String image in Constant.bannerList) {
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

  /// 获取首页banner
  void getBanner() async {
    var resultModel = await Http.getInstance().get(Api.BANNER);
    BannerResultModel model = BannerResultModel.fromJson(resultModel);

    setState(() {
      if (null != model) {
        list = model.data;
        print(model.data.length);
      }
    });
  }

  /// 获取首页数据
  getHomeData() async {
    var resultMap =
        await Http.getInstance().get(Api.ARTICLE_LIST + '$index/json');
    ArticleResultModel resultModel = ArticleResultModel.fromJson(resultMap);
    isLoading = false;
    setState(() {
      datas = resultModel.data.datas;
      LogUtil.d(TAG,  "长度${datas.length}");
    });

  }

  @override
  void initState() {
    super.initState();
    getBanner();
    getHomeData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: isLoading
          ? new Center(
              child: new CircularProgressIndicator(),
            )
          : Center(
              child: ListView.builder(
                itemCount: null == datas ? 0 : datas.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return new Container(
                      child: _bannerView0(list),
                      height: 225,
                    );
                    //return ListTile(title: Text("data:$index"),);
                  } else {
                    index -= 1;
                    ArticleBean bean = datas[index];
                    return new ArticleItem(bean);
                  }
                },

              ),
            ),
    );
  }
}
