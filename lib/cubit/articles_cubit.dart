import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:newsapp/model/article_model.dart';
import 'package:newsapp/repo/articles_repo.dart';

part 'articles_state.dart';

class ArticlesCubit extends Cubit<ArticlesState> {
  final ArticlesRepositoryIml articlesRepo;
  ArticlesCubit(this.articlesRepo) : super(ArticlesInitial());

  getNewsArticlesData() async {
    emit(ArticlesLoading());

    try {
      var data = await articlesRepo.getnewsArticles();

      List<ArticleModel> result =
          (data as List).map((k) => ArticleModel.fromJson(k)).toList();

      emit(ArticlesLoaded(model: result));
    } catch (e) {
      emit(ArticlesError(error: e.toString()));
    }
  }
}
