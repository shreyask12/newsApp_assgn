import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/articles.dart';
import 'package:newsapp/cubit/articles_cubit.dart';
import 'package:newsapp/repo/articles_repo.dart';
import 'package:device_preview/device_preview.dart' as dp;

void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then(
    (_) => runApp(
      dp.DevicePreview(
        enabled: false,
        builder: (context) => MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News Articles',
      locale: dp.DevicePreview.locale(context),
      builder: dp.DevicePreview.appBuilder,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          create: (context) => ArticlesCubit(ArticlesRepositoryIml()),
          child: ArticleLinksScreen()),
    );
  }
}
