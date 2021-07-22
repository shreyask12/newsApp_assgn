import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/model/article_model.dart';
import 'package:newsapp/showArticleLinks.dart';

class ArticleDetailsScreen extends StatefulWidget {
  final ArticleModel data;
  const ArticleDetailsScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  _ArticleDetailsScreenState createState() => _ArticleDetailsScreenState();
}

class _ArticleDetailsScreenState extends State<ArticleDetailsScreen> {
  late double height;
  late double width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: height * 0.50,
                  width: width,
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        key: Key('imagedetail'),
                        filterQuality: FilterQuality.high,
                        imageUrl: widget.data.imageUrl,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        progressIndicatorBuilder: (context, value, progress) =>
                            LinearProgressIndicator(
                          value: progress.progress,
                        ),
                        errorWidget: (context, url, error) => Container(
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: Center(child: Icon(Icons.error))),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                          ),
                          iconSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10.0),
                  child: Text(
                    widget.data.title,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      height: 2,
                      wordSpacing: 1,
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15.0),
                  child: Text(
                    widget.data.summary,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      height: 2,
                      wordSpacing: 2,
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => ShowArticleLinksPage(
                          url: widget.data.url,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: height * 0.05,
                    width: width * 0.30,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.0,
                        color: Color(0xffE77817),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Read More ',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.0,
                          color: Color(0xffE77817),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
