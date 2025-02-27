class Product {
  final String name;
  final int price;
  final int originalPrice;
  final String discount;
  final double rating;
  final int reviews;
  final String imageUrl;
  final String deliveryDate;
  final List<String> colors;
  final String placement;
  final String id;
  final String category;

  Product({
    required this.name,
    required this.price,
    required this.originalPrice,
    required this.discount,
    required this.rating,
    required this.reviews,
    required this.imageUrl,
    required this.deliveryDate,
    this.colors = const [],
    required this.placement,
    required this.id,
    required this.category,
  });
}

List<Product> getProductList(String category) {
  if (category == "Electronics") {
    return [
      Product(
        name: 'Retro Robot - 3D Model',
        price: 4504,
        originalPrice: 9010,
        discount: '50% off',
        rating: 4.5,
        reviews: 8645,
        imageUrl: 'assets/assets/robot.glb',
        deliveryDate: 'Sat, 1 Mar',
        colors: ['Gray'],
        placement: "floor",
        id: "1",
        category: "Electronics",
      ),
    ];
  } else if (category == "Home Decor") {
    return [
      Product(
        name: 'Chair',
        price: 879,
        originalPrice: 1499,
        discount: '41% off',
        rating: 4.2,
        reviews: 672,
        imageUrl: 'assets/assets/chair.glb',
        deliveryDate: 'Wed, 26 Feb',
        colors: ['Black', 'Navy', 'Pink', 'Green'],
        placement: "floor",
        id: "2",
        category: "Home Decor",
      ),
    ];
  } else if (category == "The Leafy Corner") {
    return [
      Product(
        name: 'Money Plant',
        price: 339,
        originalPrice: 599,
        discount: '43% off',
        rating: 4.2,
        reviews: 290,
        imageUrl: 'assets/assets/money_plant.glb',
        deliveryDate: 'Sat, 1 Mar',
        colors: ['green', 'Black', 'Gray'],
        placement: "floor",
        id: "4",
        category: "The Leafy Corner",
      ),
    ];
  } else if (category == "The Gift Spot") {
    return [
      Product(
        name: 'Gift Box',
        price: 389,
        originalPrice: 499,
        discount: '22% off',
        rating: 3.8,
        reviews: 14505,
        imageUrl: 'assets/assets/gift_box.glb',
        deliveryDate: 'Wed, 26 Feb',
        placement: "floor",
        id: "3",
        category: "The Gift Spot",
      ),
    ];
  } else {
    return [
      Product(
        name: 'Chair',
        price: 879,
        originalPrice: 1499,
        discount: '41% off',
        rating: 4.2,
        reviews: 672,
        imageUrl: 'assets/assets/chair.glb',
        deliveryDate: 'Wed, 26 Feb',
        colors: ['Black', 'Navy', 'Pink', 'Green'],
        placement: "floor",
        id: "2",
        category: "Home Decor",
      ),
      Product(
        name: 'Gift Box',
        price: 389,
        originalPrice: 499,
        discount: '22% off',
        rating: 3.8,
        reviews: 14505,
        imageUrl: 'assets/assets/gift_box.glb',
        deliveryDate: 'Wed, 26 Feb',
        placement: "floor",
        id: "3",
        category: "The Gift Spot",
      ),
      Product(
        name: 'Retro Robot - 3D Model',
        price: 4504,
        originalPrice: 9010,
        discount: '50% off',
        rating: 4.5,
        reviews: 8645,
        imageUrl: 'assets/assets/robot.glb',
        deliveryDate: 'Sat, 1 Mar',
        colors: ['Gray'],
        placement: "floor",
        id: "1",
        category: "Electronics",
      ),

      Product(
        name: 'Money Plant',
        price: 339,
        originalPrice: 599,
        discount: '43% off',
        rating: 4.2,
        reviews: 290,
        imageUrl: 'assets/assets/money_plant.glb',
        deliveryDate: 'Sat, 1 Mar',
        colors: ['green', 'Black', 'Gray'],
        placement: "floor",
        id: "4",
        category: "The Leafy Corner",
      ),
    ];
  }
}
