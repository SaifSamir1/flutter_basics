import 'package:flutter/material.dart';
import 'package:flutter_basics_app/features/news_cubit/news_cubit.dart';
import 'package:flutter_basics_app/features/news_cubit/news_states.dart';
import 'package:flutter_basics_app/widgets/error_view.dart';
import 'package:flutter_basics_app/widgets/news_card.dart';
import 'package:flutter_basics_app/widgets/news_header.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tech News'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: context.read<NewsCubit>().getNews,
          ),
        ],
      ),
      body: BlocBuilder<NewsCubit, NewsStates>(
        builder: (context, state) {
          if (state is NewsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is NewsError) {
            return ErrorView(
              message: state.error,
              onRetry: context.read<NewsCubit>().getNews,
            );
          }
          else {
            final news = context.read<NewsCubit>().news;
            return Column(
                children: [
                  NewsHeader(totalResults: news?.totalResults ?? 0),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: news!.articles!.length,
                      itemBuilder: (context, index) {
                        return NewsCard(article: news.articles![index]);
                      },
                    ),
                  ),
                ],
              );
          }
        },
      ),
      
    );
  }
}
