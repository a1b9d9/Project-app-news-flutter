abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsBottomNivState extends NewsStates {}

class NewsChangeScreenState extends NewsStates {}

class NewsGetBusinessScreenState extends NewsStates {}

class NewsLoadingBusinessScreenState extends NewsStates {}

class NewsErrorBusinessScreenState extends NewsStates {
  final String error;

  NewsErrorBusinessScreenState(this.error);

}


class NewsGetScienceScreenState extends NewsStates {}

class NewsLoadingScienceScreenState extends NewsStates {}

class NewsErrorScienceScreenState extends NewsStates {
  final String error;

  NewsErrorScienceScreenState(this.error);

}




class NewsGetSportsScreenState extends NewsStates {}

class NewsLoadingSportsScreenState extends NewsStates {}

class NewsErrorSportsScreenState extends NewsStates {
  final String error;

  NewsErrorSportsScreenState(this.error);

}


class NewsChangeThemScreenState extends NewsStates {}




class NewsGetSearchScreenState extends NewsStates {}

class NewsLoadingSearchScreenState extends NewsStates {}

class NewsErrorSearchScreenState extends NewsStates {
  final String error;

  NewsErrorSearchScreenState(this.error);

}