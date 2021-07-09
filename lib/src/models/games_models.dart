class GamesModel {
  String? title;
  String? thumbnail;
  String? shortDescription;
  String? gameUrl;
  String? genre;
  String? platform;
  String? releaseDate;
  int? id;

  GamesModel({
    this.gameUrl,
    this.genre,
    this.platform,
    this.shortDescription,
    this.thumbnail,
    this.title,
    this.releaseDate,
    this.id,
  });

  factory GamesModel.fromJson(Map<String, dynamic> data) {
    return GamesModel(
      title: data['title'],
      thumbnail: data['thumbnail'],
      shortDescription: data['short_description'],
      gameUrl: data['game_url'],
      genre: data['genre'],
      platform: data['platform'],
      releaseDate: data['release_date'],
      id: data['id'],
    );
  }
}
