import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart';
import 'package:specialite/models/restaurant_object.dart';

class RestaurantService {
  // TODO add tags to restaurants
  List<String> _tagList = [
    'Side',
    'Chicken',
    'Lamb',
    'Goat',
    'Beef',
    'Breakfast',
    'Seafood',
    'Pasta',
    'Vegetarian',
    'Pork',
    'Starter',
    'Dessert',
    'Miscellaneous',
    'Vegan'
  ];

  List<RestaurantObject> _restoList = [
    RestaurantObject(
        title: 'Restaurant ',
        subtitle: 'We have great food',
        imageURL:
            'https://cdn.pixabay.com/photo/2017/02/15/10/39/salad-2068220_1280.jpg',
        baseDeliveryPrice: 1.9,
        rating: 8.8,
        pricing: '¥¥',
        baseEstimate: 40,
        isFavorite: true,
        isNew: false),
    RestaurantObject(
        title: 'Pizza plaza',
        subtitle: 'Best pizza in town',
        imageURL:
            'https://d1902livswy8rb.cloudfront.net/dimg/670x670/dimg/pizza-hut-5p0204cr1v2_1.jpg',
        baseDeliveryPrice: 0,
        rating: 9.5,
        pricing: '¥',
        baseEstimate: 20,
        isFavorite: false,
        isNew: true),
    RestaurantObject(
        title: 'Waffles',
        subtitle: 'You deserve it',
        imageURL:
            'https://cdn.pixabay.com/photo/2017/03/31/10/56/waffles-2190961_1280.jpg',
        baseDeliveryPrice: 0,
        rating: 8.4,
        pricing: '¥¥¥',
        baseEstimate: 45,
        isFavorite: true,
        isNew: false),
    RestaurantObject(
        title: 'Let\'s make a Cake',
        subtitle: 'Nom nom nom',
        imageURL:
            'https://cdn.pixabay.com/photo/2017/01/11/11/33/cake-1971552_1280.jpg',
        baseDeliveryPrice: 0,
        rating: 9.2,
        pricing: '¥¥',
        baseEstimate: 30,
        isFavorite: true,
        isNew: true),
    RestaurantObject(
        title: 'Burger king',
        subtitle: 'Not that king',
        imageURL:
            'https://cdn.pixabay.com/photo/2014/10/19/20/59/hamburger-494706_1280.jpg',
        baseDeliveryPrice: 0,
        rating: 9.2,
        pricing: '¥¥',
        baseEstimate: 30,
        isFavorite: true,
        isNew: false),
    RestaurantObject(
        title: 'Sushiplaza',
        subtitle: 'They see me rollin',
        imageURL:
            'https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/articles/health_tools/best_and_worst_sushi_slideshow/1800ss_thinkstock_rf_assorted_sushi_pieces.jpg?resize=650px:*',
        baseDeliveryPrice: 0,
        rating: 9.2,
        pricing: '¥¥',
        baseEstimate: 30,
        isFavorite: true,
        isNew: false),
    RestaurantObject(
        title: 'Pancake factory',
        subtitle: 'Love it - from every client',
        imageURL:
            'https://cdn.pixabay.com/photo/2017/05/07/08/56/pancakes-2291908_1280.jpg',
        baseDeliveryPrice: 0,
        rating: 7.9,
        pricing: '¥',
        baseEstimate: 30,
        isFavorite: false,
        isNew: true),
    RestaurantObject(
        title: 'Breakfast palace',
        subtitle: 'Masterpiece!',
        imageURL:
            'https://cdn.pixabay.com/photo/2016/11/06/23/31/breakfast-1804457_1280.jpg',
        baseDeliveryPrice: 0,
        rating: 9.5,
        pricing: '¥¥¥',
        baseEstimate: 30,
        isFavorite: false,
        isNew: true),
    RestaurantObject(
        title: 'Coffee shop!',
        subtitle: 'Brilliant!',
        imageURL:
            'https://cdn.pixabay.com/photo/2015/10/12/14/54/coffee-983955_1280.jpg',
        baseDeliveryPrice: 0,
        rating: 9.2,
        pricing: '¥¥',
        baseEstimate: 10,
        isFavorite: false,
        isNew: false),
    RestaurantObject(
        title: 'Zohaib\'s pizza!',
        subtitle: 'You already know!',
        imageURL:
            'https://foodnerd.s3.eu-west-1.amazonaws.com/production/blog/cover_image/5/foodnerd-pizza-restaurants-islamabad-food.jpg',
        baseDeliveryPrice: 0,
        rating: 9.0,
        pricing: '¥¥',
        baseEstimate: 36,
        isFavorite: false,
        isNew: true),
    RestaurantObject(
        title: 'Zohaib\'s grill!',
        subtitle: 'I can also grill',
        imageURL:
            'https://cdn.pixabay.com/photo/2014/08/14/14/21/shish-kebab-417994_1280.jpg',
        baseDeliveryPrice: 0,
        rating: 7.5,
        pricing: '¥¥',
        baseEstimate: 20,
        isFavorite: false,
        isNew: false),
    RestaurantObject(
        title: 'This one!',
        subtitle: 'You will be surprised',
        imageURL:
            'https://cdn.pixabay.com/photo/2017/01/26/02/06/platter-2009590_1280.jpg',
        baseDeliveryPrice: 0,
        rating: 9.9,
        pricing: '¥¥¥',
        baseEstimate: 40,
        isFavorite: false,
        isNew: true),
    RestaurantObject(
        title: 'Papa\'s Pizza Oven',
        subtitle: 'Must try!',
        imageURL:
            'https://cdn.pixabay.com/photo/2017/07/25/09/08/pizza-oven-2537308_1280.jpg',
        baseDeliveryPrice: 0,
        rating: 9.1,
        pricing: '¥¥¥',
        baseEstimate: 35,
        isFavorite: false,
        isNew: false),
  ];

  List<RestaurantObject> getRestaurants() {
    print("get calledd");
    //getData();
    _restoList.shuffle();
    return _restoList;
  }

  void getData() async {
    await Firebase.initializeApp();
    final firestoreInstance = FirebaseFirestore.instance;
    firestoreInstance.collection("Users").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        print(result.data());
      });
    });
  }

  List<RestaurantObject> getNumberOfRestaurants(int number) {
    _restoList.shuffle();
    return _restoList.sublist(0, number);
  }

  List<String> getRestaurantNames() {
    return _restoList.map((e) => e.title.toLowerCase()).toList();
  }

  List<String> getTags() {
    return _tagList.map((r) => r.toLowerCase()).toList();
  }
}
