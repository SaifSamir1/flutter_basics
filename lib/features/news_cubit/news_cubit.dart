



import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_basics_app/models/news_model.dart';
import 'package:flutter_basics_app/features/news_cubit/news_states.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit() : super(NewsInitialState());

    NewsModel? news;
    final Dio dio = Dio();
    final apiPath = "https://newsapi.org/v2/everything?domains=techcrunch.com&apiKey=1f61186025724ff99436bd7ca9fa128d";

  Future<void> getNews() async {
    try {
      emit(NewsLoading());
      final response = await dio.get(apiPath);
      final jsonResponse = response.data;
      news = NewsModel.fromJson(jsonResponse);
      emit(NewsSuccess());
      
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }
}