import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ShowArticleLinksPage extends StatefulWidget {
  final String url;
  const ShowArticleLinksPage({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  _ShowArticleLinksPageState createState() => _ShowArticleLinksPageState();
}

class _ShowArticleLinksPageState extends State<ShowArticleLinksPage> {
  late bool isLoading;

  @override
  void initState() {
    super.initState();
    isLoading = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.url,
        ),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              WebView(
                onPageFinished: (_) {
                  setState(() {
                    isLoading = false;
                  });
                },
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: widget.url,
              ),
              isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
