part of 'articles_cubit.dart';

abstract class ArticlesState extends Equatable {
  const ArticlesState();

  @override
  List<Object> get props => [];
}

class ArticlesInitial extends ArticlesState {
  const ArticlesInitial();

  @override
  List<Object> get props => [];
}

class ArticlesLoading extends ArticlesState {
  const ArticlesLoading();

  @override
  List<Object> get props => [];
}

class ArticlesLoaded extends ArticlesState {
  final List<ArticleModel> model;
  const ArticlesLoaded({required this.model});

  @override
  List<Object> get props => [model];
}

class ArticlesError extends ArticlesState {
  final String error;
  const ArticlesError({required this.error});

  @override
  List<Object> get props => [this.error];
}
