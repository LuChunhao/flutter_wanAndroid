import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/common/util/logger.dart';
import 'package:flutter_wanandroid/models/result/article_list.dart';
import 'package:flutter_wanandroid/view/pages/article_detail_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ArticleItem extends StatefulWidget {
  ArticleBean articleBean;

  ArticleItem(this.articleBean);

  @override
  State<StatefulWidget> createState() => ArticleItemState();
}

class ArticleItemState extends State<ArticleItem> {
  void _itemClick() async {
    await Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return ArticleDetailPage(
        widget.articleBean.title,
        widget.articleBean.link,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    Row author = Row(
      children: <Widget>[
        Text("作者: "),
        new Expanded(
          child: Text(
            widget.articleBean.author,
            style: TextStyle(color: Colors.blue),
            textAlign: TextAlign.left,
          ),
          flex: 2,
        ),
        new Expanded(
            child: Text(
          widget.articleBean.niceDate,
          style: TextStyle(color: Colors.blue),
          textAlign: TextAlign.right,
        ))
      ],
    );

    Row articleType = Row(
      children: <Widget>[
        Expanded(
          child: Text(
            widget.articleBean.chapterName,
            style: TextStyle(color: Colors.blue),
          ),
          flex: 2,
        ),
        Icon(
          Icons.favorite_border,
        )
      ],
    );
    return Card(
      elevation: 4,
      child: InkWell(
        // 水波纹控件
        onTap: () {
          // 点击事件
          _itemClick();
//          Fluttertoast.showToast(
//            msg: widget.articleBean.author,
//            toastLength: Toast.LENGTH_SHORT,
//            gravity: ToastGravity.BOTTOM,
//            timeInSecForIos: 1,
//            backgroundColor: Colors.red,
//            textColor: Colors.white,
//            fontSize: 14.0,
//          );
        },
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 5),
              child: author,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 5),
              child: Text(
                widget.articleBean.title,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16.0, color: Colors.black),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 5),
              child: articleType,
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }
}
