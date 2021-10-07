class CategoryObject {
  String title;
  int numberOfVenues;
  String imgUrl;

  CategoryObject({this.title, this.numberOfVenues, this.imgUrl});

  factory CategoryObject.fromJson(Map<String, dynamic> json) {
    return CategoryObject(
      title: json['strCategory'],
      imgUrl: json['strCategoryThumb'],
    );
  }
}
