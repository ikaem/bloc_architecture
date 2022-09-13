class NewsRepository {
  final NewsApi newsApi;

  const NewsRepository({
    required this.newsApi,
  });

  Future<List<News>?> getSomeNews({NewsType type}) async {
    switch (type) {
      case NewsType.Latest:
        final List<News> news = await newsApi.getNews(type);
        return news;

      case NewsType.Popular:
        final List<News> news = await newsApi.getNews(type);
        return news;
    }

    return null;
  }
}
