


abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsLoading extends NewsStates {}

class NewsSuccess extends NewsStates {}

class NewsError extends NewsStates {
  final String error;

  NewsError(this.error);
}

