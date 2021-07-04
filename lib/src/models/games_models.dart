class GamesModel {
  String? title;
  String? thumbnail;
  String? short_description;
  String? game_url;
  String? genre;
  String? platform;
  String? release_date;

  GamesModel({
    this.game_url,
    this.genre,
    this.platform,
    this.short_description,
    this.thumbnail,
    this.title,
    this.release_date,
  });

  factory GamesModel.fromJson(Map<String,dynamic> data){
    return GamesModel(
      title: data['title'],
      thumbnail: data['thumbnail'],
      short_description: data['short_description'],
      game_url: data['game_url'],
      genre: data['genre'],
      platform: data['platform'],
      release_date: data['release_date'],
    );
  }
}
