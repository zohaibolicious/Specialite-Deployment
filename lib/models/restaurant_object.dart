class RestaurantObject {
  final String title;
  final String subtitle;
  final String imageURL;
  final double baseDeliveryPrice;
  final double rating;
  final String pricing; //  $
  final int baseEstimate;
  final int id;
  bool isFavorite;
  final bool isNew;
  // final List<String> tags;

  RestaurantObject({
    this.title,
    this.subtitle,
    this.imageURL,
    this.baseDeliveryPrice,
    this.rating,
    this.pricing,
    this.baseEstimate,
    this.id,
    this.isFavorite,
    this.isNew,
    // this.tags
  });
}