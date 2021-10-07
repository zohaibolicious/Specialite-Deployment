class User {
  final String uid;
  String firstName;
  String lastName;
  int orderAmount;
  int tokenAmount;
  double creditsLeft;
  String imageUrl;

  User({this.uid,this.firstName,
        this.lastName,
        this.orderAmount,
        this.tokenAmount,
        this.creditsLeft,
        this.imageUrl});
}
