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
  });
}

List<Product> getProductList(String category) {
  if (category == "Electronics") {
    return [
      Product(
        name: 'Laptop',
        price: 54090,
        originalPrice: 70090,
        discount: '23% off',
        rating: 4.5,
        reviews: 419,
        imageUrl: 'assets/laptop_real.glb',
        deliveryDate: 'Fri, 28 Feb',
        colors: ['Black', 'Brown', 'Gray'],
        placement: "floor",
      ),
      Product(
        name: 'Retro Robot - 3D Model',
        price: 4504,
        originalPrice: 9010,
        discount: '50% off',
        rating: 4.5,
        reviews: 8645,
        imageUrl: 'assets/robot.glb',
        deliveryDate: 'Sat, 1 Mar',
        colors: ['Gray'],
        placement: "floor",
      ),
      Product(
        name: 'POSMachine',
        price: 999,
        originalPrice: 1399,
        discount: '29% off',
        rating: 4.5,
        reviews: 293,
        imageUrl: 'assets/POSMachine.gltf',
        deliveryDate: 'Sat, 1 Mar',
        colors: ['Pink', 'Black', 'Gray'],
        placement: "floor",
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
        imageUrl: 'assets/chair.glb',
        deliveryDate: 'Wed, 26 Feb',
        colors: ['Black', 'Navy', 'Pink', 'Green'],
        placement: "floor",
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
        imageUrl: 'assets/money_plant.glb',
        deliveryDate: 'Sat, 1 Mar',
        colors: ['green', 'Black', 'Gray'],
        placement: "floor",
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
        imageUrl: 'assets/gift_box.glb',
        deliveryDate: 'Wed, 26 Feb',
        placement: "floor",
      ),
    ];
  } else {
    return [
      Product(
        name: 'Laptop',
        price: 54090,
        originalPrice: 70090,
        discount: '23% off',
        rating: 4.5,
        reviews: 419,
        imageUrl: 'assets/laptop_real.glb',
        deliveryDate: 'Fri, 28 Feb',
        colors: ['Black', 'Brown', 'Gray'],
        placement: "floor",
      ),
      Product(
        name: 'Chair',
        price: 879,
        originalPrice: 1499,
        discount: '41% off',
        rating: 4.2,
        reviews: 672,
        imageUrl: 'assets/chair.glb',
        deliveryDate: 'Wed, 26 Feb',
        colors: ['Black', 'Navy', 'Pink', 'Green'],
        placement: "floor",
      ),
      Product(
        name: 'Gift Box',
        price: 389,
        originalPrice: 499,
        discount: '22% off',
        rating: 3.8,
        reviews: 14505,
        imageUrl: 'assets/gift_box.glb',
        deliveryDate: 'Wed, 26 Feb',
        placement: "floor",
      ),
      Product(
        name: 'Retro Robot - 3D Model',
        price: 4504,
        originalPrice: 9010,
        discount: '50% off',
        rating: 4.5,
        reviews: 8645,
        imageUrl: 'assets/robot.glb',
        deliveryDate: 'Sat, 1 Mar',
        colors: ['Gray'],
        placement: "floor",
      ),

      Product(
        name: 'Money Plant',
        price: 339,
        originalPrice: 599,
        discount: '43% off',
        rating: 4.2,
        reviews: 290,
        imageUrl: 'assets/money_plant.glb',
        deliveryDate: 'Sat, 1 Mar',
        colors: ['green', 'Black', 'Gray'],
        placement: "floor",
      ),
      Product(
        name: 'POSMachine',
        price: 999,
        originalPrice: 1399,
        discount: '29% off',
        rating: 4.5,
        reviews: 293,
        imageUrl: 'assets/POSMachine.gltf',
        deliveryDate: 'Sat, 1 Mar',
        colors: ['Pink', 'Black', 'Gray'],
        placement: "floor",
      ),
    ];
  }
}
