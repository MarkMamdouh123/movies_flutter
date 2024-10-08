import 'results.dart';

/// page : 1
/// results : [{"adult":false,"backdrop_path":null,"genre_ids":[],"id":1188379,"original_language":"en","original_title":"Alan O'Connor & Bobbie Reynolds Collection","overview":"A couple solves crimes.","popularity":0,"poster_path":null,"release_date":"","title":"Alan O'Connor & Bobbie Reynolds Collection","video":false,"vote_average":0,"vote_count":0},{"adult":false,"backdrop_path":null,"genre_ids":[],"id":1161271,"original_language":"en","original_title":"Corporal Rod Webb & Chinook Collection","overview":"Corporal Rod Webb and his faithful dog Chinook were the major characters in a series of films made by the American studio Monogram Pictures between 1949 and 1954.","popularity":0,"poster_path":null,"release_date":"","title":"Corporal Rod Webb & Chinook Collection","video":false,"vote_average":0,"vote_count":0},{"adult":false,"backdrop_path":null,"genre_ids":[],"id":1161276,"original_language":"en","original_title":"Wild Bill Hickok Collection","overview":"Columbia series based on Wild Bill Hickok, a folk hero of the American Old West known for his life on the frontier as a soldier, scout, lawman, cattle rustler, gunslinger, gambler, showman, and actor, and for his involvement in many famous gunfights.","popularity":0,"poster_path":null,"release_date":"","title":"Wild Bill Hickok Collection","video":false,"vote_average":0,"vote_count":0},{"adult":false,"backdrop_path":null,"genre_ids":[],"id":1149580,"original_language":"en","original_title":"Daredevil / Electra Collection","overview":"Daredevil / Electra Collection","popularity":0,"poster_path":null,"release_date":"","title":"Daredevil / Electra Collection","video":false,"vote_average":0,"vote_count":0},{"adult":false,"backdrop_path":null,"genre_ids":[],"id":1066627,"original_language":"en","original_title":"The League of Gentlemen Collection","overview":"The League of Gentlemen is a surreal British comedy horror sitcom that premiered on BBC Two in 1999. The programme is set in Royston Vasey, a fictional town in northern England, originally based on Alston, Cumbria, and follows the lives of bizarre characters, most of whom are played by three of the show's four writers – Mark Gatiss, Steve Pemberton, and Reece Shearsmith – who, along with Jeremy Dyson, formed the League of Gentlemen comedy troupe in 1995. The series originally aired for three series from 1999 until 2002, and was followed by a film The League of Gentlemen's Apocalypse and a stage production The League of Gentlemen Are Behind You!, both in 2005.","popularity":0,"poster_path":null,"release_date":"","title":"The League of Gentlemen Collection","video":false,"vote_average":0,"vote_count":0},{"adult":false,"backdrop_path":null,"genre_ids":[],"id":1038672,"original_language":"en","original_title":"A man called - Collection","overview":"A man called Ove, A man called Otto","popularity":0,"poster_path":null,"release_date":"","title":"A man called - Collection","video":false,"vote_average":0,"vote_count":0},{"adult":false,"backdrop_path":null,"genre_ids":[],"id":1037538,"original_language":"fr","original_title":"La duologie Sudéris","overview":"","popularity":0,"poster_path":null,"release_date":"","title":"La duologie Sudéris","video":false,"vote_average":0,"vote_count":0},{"adult":false,"backdrop_path":null,"genre_ids":[],"id":1042197,"original_language":"en","original_title":"Star Trek: Enterprise Collection","overview":"Set 114 Years prior to Kirk's iconic 5-year mission in 2265, and 88 Years after the First Contact with the Vulans on April 5, 2063, Enterprise follows the first United Earth ship setting out to seek out new life, new civilizations, to boldly go where no man has gone before...","popularity":0,"poster_path":null,"release_date":"","title":"Star Trek: Enterprise Collection","video":false,"vote_average":0,"vote_count":0},{"adult":false,"backdrop_path":null,"genre_ids":[],"id":1043144,"original_language":"en","original_title":"Marvel Universe Collection","overview":"The complete Marvel collection","popularity":0,"poster_path":null,"release_date":"","title":"Marvel Universe Collection","video":false,"vote_average":0,"vote_count":0},{"adult":false,"backdrop_path":null,"genre_ids":[],"id":1043953,"original_language":"en","original_title":"The Marx Brothers Collection","overview":"Marx Brothers Movies","popularity":0,"poster_path":null,"release_date":"","title":"The Marx Brothers Collection","video":false,"vote_average":0,"vote_count":0},{"adult":false,"backdrop_path":null,"genre_ids":[],"id":1044420,"original_language":"fr","original_title":"La Trilogie du Dollar","overview":"","popularity":0,"poster_path":null,"release_date":"","title":"La Trilogie du Dollar","video":false,"vote_average":0,"vote_count":0},{"adult":false,"backdrop_path":null,"genre_ids":[],"id":1044562,"original_language":"en","original_title":"From Our Family to Yours","overview":"Disney celebrates the Holiday season spanning 3 years, in partnership with Make-A-Wish.","popularity":0,"poster_path":"/ghBTtkCpbeHqad52ytv0aSs5FFi.jpg","release_date":"","title":"From Our Family to Yours","video":false,"vote_average":0,"vote_count":0},{"adult":false,"backdrop_path":null,"genre_ids":[],"id":1044823,"original_language":"en","original_title":"FIA Formula One World Championship Season Review Collection","overview":"Sit back, strap in and relive the moments that made the FIA Formula One World Championship one of the most memorable in racing history.","popularity":0,"poster_path":null,"release_date":"","title":"FIA Formula One World Championship Season Review Collection","video":false,"vote_average":0,"vote_count":0},{"adult":false,"backdrop_path":null,"genre_ids":[],"id":1046137,"original_language":"en","original_title":"FIA Formula One World Championship Season Review Collection","overview":"End of Season Review","popularity":0,"poster_path":null,"release_date":"","title":"FIA Formula One World Championship Season Review Collection","video":false,"vote_average":0,"vote_count":0},{"adult":false,"backdrop_path":null,"genre_ids":[],"id":1046858,"original_language":"en","original_title":"Doctor Who: The Tenth Doctor Collection","overview":"The Tenth Doctor is the Eleventh and Twelfth Incarnation of the Time Lord only known as the Doctor.","popularity":0,"poster_path":null,"release_date":"","title":"Doctor Who: The Tenth Doctor Collection","video":false,"vote_average":0,"vote_count":0},{"adult":false,"backdrop_path":null,"genre_ids":[],"id":1055071,"original_language":"en","original_title":"Jackass","overview":"Jackass Movie Collection","popularity":0,"poster_path":null,"release_date":"","title":"Jackass","video":false,"vote_average":0,"vote_count":0}]
/// total_pages : 40835
/// total_results : 816695

class MovieCategory {
  MovieCategory({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  MovieCategory.fromJson(dynamic json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;
  MovieCategory copyWith({
    int? page,
    List<Results>? results,
    int? totalPages,
    int? totalResults,
  }) =>
      MovieCategory(
        page: page ?? this.page,
        results: results ?? this.results,
        totalPages: totalPages ?? this.totalPages,
        totalResults: totalResults ?? this.totalResults,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }
}
