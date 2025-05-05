class WebtoonModels {
  final String title, thumb, id;

  WebtoonModels.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        id = json['id'];
}
