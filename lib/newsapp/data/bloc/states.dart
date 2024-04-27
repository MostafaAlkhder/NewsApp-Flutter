abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsBottomNavState extends NewsStates {}

class NewsGetBusinessSuccessState extends NewsStates {}

class NewsGetBusinessLoadingState extends NewsStates {}

class NewsBusinessErrorState extends NewsStates {
  final String error;
  NewsBusinessErrorState(this.error);
}

class NewsGetSportsSuccessState extends NewsStates {}

class NewsGetSportsLoadingState extends NewsStates {}

class NewsSportsErrorState extends NewsStates {
  final String error;
  NewsSportsErrorState(this.error);
}

class NewsGetScienceSuccessState extends NewsStates {}

class NewsGetScienceLoadingState extends NewsStates {}

class NewsScienceErrorState extends NewsStates {
  final String error;
  NewsScienceErrorState(this.error);
}
