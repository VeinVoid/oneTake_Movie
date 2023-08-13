class Movie {
  final int id;
  final String title;
  final String genre;
  final String release;
  final dynamic rate; 
  final String sinopsis;
  final String poster;

  Movie({
    required this.id,
    required this.title,
    required this.genre,
    required this.release,
    required this.rate,
    required this.sinopsis,
    required this.poster
  });

  factory Movie.fromJson(Map<String, dynamic> json){
    return Movie(id: json['id'], title: json['title'], genre: json['genre'], release: json['release'], rate: json['rate'], sinopsis: json['sinopsis'], poster: json['poster']);
  }
}
