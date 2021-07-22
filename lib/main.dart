import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:newsapp/screens/articles.dart';
import 'package:newsapp/cubit/articles_cubit.dart';
import 'package:newsapp/repo/articles_repo.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News Articles',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          create: (context) => ArticlesCubit(ArticlesRepositoryIml()),
          child: ArticleLinksScreen()),
    );
  }
}
