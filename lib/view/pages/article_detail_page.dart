import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class ArticleDetailPage extends StatefulWidget {
  String title;
  String url;

  ArticleDetailPage(this.title, this.url);

  @override
  State<StatefulWidget> createState() => new ArticleDetailState();
}

class ArticleDetailState extends State<ArticleDetailPage> {

  final flutterWebViewPlugin = FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();
    flutterWebViewPlugin.onDestroy.listen((_){

      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(
      url: widget.url,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      withZoom: false,
      withLocalStorage: true,
      withJavascript: true,
    );
  }
}
