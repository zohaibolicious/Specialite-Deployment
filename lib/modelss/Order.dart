class Order{
  String orderID;
  List<String> name;
  List<int> quantity;
  List<int> price;
  DateTime dateTime;
  String restName;
  String userID;
  bool paid=false;

  Order({this.price, this.dateTime, this.name, this.quantity, this.restName, this.userID, this.orderID});
}