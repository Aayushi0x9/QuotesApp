class QuoteModel {
  //Attributes
  String quote, author, category;
  int likesCount, sharesCount, commentsCount;
  int likes = 0;
  bool isLiked = false;

  //Parameterized constructor
  QuoteModel(this.quote, this.author, this.category, this.commentsCount,
      this.likesCount, this.sharesCount);

  //Factory constructor:  Map =>  Current Class Object
  factory QuoteModel.fromMap({required Map data}) => QuoteModel(
      data['quote'],
      data['author'],
      data['category'],
      data['commentsCount'],
      data['likesCount'],
      data['sharesCount']);

  // Object => Map
  Map<String, dynamic> get toMap => {
        'quote': quote,
        'author': author,
        'category': category,
        'commentsCount': commentsCount,
        'likesCount': likesCount,
        'sharesCount': sharesCount,
        'likes': likes,
        'isLiked': isLiked,
      };
}
