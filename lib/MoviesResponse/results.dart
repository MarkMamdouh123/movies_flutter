/// adult : false
/// backdrop_path : null
/// genre_ids : []
/// id : 1188379
/// original_language : "en"
/// original_title : "Alan O'Connor & Bobbie Reynolds Collection"
/// overview : "A couple solves crimes."
/// popularity : 0
/// poster_path : null
/// release_date : ""
/// title : "Alan O'Connor & Bobbie Reynolds Collection"
/// video : false
/// vote_average : 0
/// vote_count : 0

class Results {
  Results({
      this.adult, 
      this.backdropPath, 
      this.genreIds, 
      this.id, 
      this.originalLanguage, 
      this.originalTitle, 
      this.overview,
      this.posterPath, 
      this.releaseDate, 
      this.title, 
      this.video, 
     });

  Results.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];

    genreIds = json['genre_ids'] != null
        ? json['genre_ids'].cast<int>()
        : [];

    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];

  }
  bool? adult;
  dynamic backdropPath;
  List<dynamic>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  dynamic posterPath;
  String? releaseDate;
  String? title;
  bool? video;
Results copyWith({  bool? adult,
  dynamic backdropPath,
  List<dynamic>? genreIds,
  int? id,
  String? originalLanguage,
  String? originalTitle,
  String? overview,
  dynamic posterPath,
  String? releaseDate,
  String? title,
  bool? video,

}) => Results(  adult: adult ?? this.adult,
  backdropPath: backdropPath ?? this.backdropPath,
  genreIds: genreIds ?? this.genreIds,
  id: id ?? this.id,
  originalLanguage: originalLanguage ?? this.originalLanguage,
  originalTitle: originalTitle ?? this.originalTitle,
  overview: overview ?? this.overview,
  posterPath: posterPath ?? this.posterPath,
  releaseDate: releaseDate ?? this.releaseDate,
  title: title ?? this.title,
  video: video ?? this.video,

);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    if (genreIds != null) {
      map['genre_ids'] = genreIds?.map((v) => v.toJson()).toList();
    }
    map['id'] = id;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['poster_path'] = posterPath;
    map['release_date'] = releaseDate;
    map['title'] = title;
    map['video'] = video;

    return map;
  }

}