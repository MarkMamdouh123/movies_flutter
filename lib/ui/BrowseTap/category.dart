
class Category{
  String id;
  String title;
  String imageName;
  Category(this.id,this.title,this.imageName);

  static List<Category> getAllCategories(){
    return[
      Category('Action', 'Action', 'action.png'),
      Category('Adventure', 'Adventure', 'adventure.png'),
      Category('Animation', 'Animation', 'animation.png' ),
      Category('Comedy', 'Comedy', 'comedy.png'),
      Category('Crime', 'Crime', 'crime.png'),
      Category('Documentary', 'Documentary', 'documentary.png'),
      Category('Drama', 'Drama', 'drama.png'),
      Category('Family', 'Family', 'family.png'),
      Category('Fantasy', 'Fantasy', 'fantasy.png' ),
      Category('History', 'History', 'history.png'),
      Category('Horror', 'Horror', 'horror.png'),
      Category('Music', 'Music', 'music.png'),
      Category('Mystery', 'Mystery', 'mystery.png'),
      Category('Romance', 'Romance', 'romance.png'),
      Category('Science Fiction', 'Science Fiction', 'scienceFiction.png' ),
      Category('TV Movie', 'TV Movie', 'tvMovies.png'),
      Category('Thriller', 'Thriller', 'thriller.png'),
      Category('War', 'War', 'war.png' ),
      Category('Western', 'Western', 'western.png'),



    ];
  }
}