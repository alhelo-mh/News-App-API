abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsBottomNavState extends NewsStates {}

class NewsBusinessLoadingState extends NewsStates {}

class NewsGetBusinessSuccessState extends NewsStates {}

class NewsGetBusinessErrorState extends NewsStates {
  final String error;
  NewsGetBusinessErrorState(this.error);
}

class NewsSportLoadingState extends NewsStates {}

class NewsGetSportSuccessState extends NewsStates {}

class NewsGetSportErrorState extends NewsStates {
  final String error;
  NewsGetSportErrorState(this.error);
}

class NewsSciencstLoadingState extends NewsStates {}

class NewsGetSciencsSuccessState extends NewsStates {}

class NewsGetSciencsErrorState extends NewsStates {
  final String error;
  NewsGetSciencsErrorState(this.error);
}

class NewsSearchLoadingState extends NewsStates {}

class NewsGetSearchSuccessState extends NewsStates {}

class NewsGetSearchErrorState extends NewsStates {
  final String error;
  NewsGetSearchErrorState(this.error);
}
