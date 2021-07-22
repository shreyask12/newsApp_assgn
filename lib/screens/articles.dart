import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/screens/article_details.dart';
import 'package:newsapp/cubit/articles_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/model/article_model.dart';

class ArticleLinksScreen extends StatefulWidget {
  const ArticleLinksScreen({Key? key}) : super(key: key);

  @override
  _ArticleLinksScreenState createState() => _ArticleLinksScreenState();
}

class _ArticleLinksScreenState extends State<ArticleLinksScreen> {
  late ArticlesCubit _articlesCubit;

  @override
  void initState() {
    _articlesCubit = context.read<ArticlesCubit>();
    _articlesCubit.getNewsArticlesData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'News Articles',
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            BlocConsumer<ArticlesCubit, ArticlesState>(
              listener: (context, state) {
                if (state is ArticlesError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.red,
                      content: Text(state.error),
                      duration: Duration(seconds: 2),
                    ),
                  );
                } else if (state is ArticlesLoaded) {}
              },
              builder: (context, state) {
                if (state is ArticlesLoading) {
                  return Container(
                    padding: EdgeInsets.all(20.0),
                    child: Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  );
                } else if (state is ArticlesError) {
                  return Container(child: Text(state.error));
                } else if (state is ArticlesLoaded) {
                  List<ArticleModel> model = state.model;
                  return Expanded(
                    child: ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return createCardView(model[index]);
                        },
                        cacheExtent: 10240,
                        itemCount: state.model.length),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget createCardView(ArticleModel data) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => ArticleDetailsScreen(
              data: data,
            ),
          ),
        );
      },
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                flex: 1,
                child: CachedNetworkImage(
                  filterQuality: FilterQuality.high,
                  imageUrl: data.imageUrl,
                  imageBuilder: (context, imageProvider) => Container(
                    height: MediaQuery.of(context).size.height * 0.10,
                    width: MediaQuery.of(context).size.width * 0.25,
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
              ),
              SizedBox(width: 10.0),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Text(
                        data.title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        maxLines: 2,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text('Summary : '),
                    Container(
                      child: Text(
                        data.summary,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShowWikiLinksPage {}
