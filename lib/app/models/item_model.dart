class Item {
  final String image;
  final String name;

  Item({required this.image, required this.name});

  // Method to convert an instance to a Map
  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'name': name,
    };
  }

  // Factory method to create an instance from a Map
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      image: map['image'],
      name: map['name'],
    );
  }
}

List<Item> items = [
  Item(image: 'assets/images/category_images/pants.jpeg', name: 'Pants'),
  Item(image: 'assets/images/category_images/jeans.jpg', name: 'Jeans'),
  Item(image: 'assets/images/category_images/shorts.jpg', name: 'Shorts'),
  Item(image: 'assets/images/category_images/skirt.jpeg', name: 'Skirts'),
  Item(
      image: 'assets/images/category_images/pleated.jpg',
      name: 'Pleated Skirts'),
  Item(image: 'assets/images/category_images/doctor.jpg', name: 'Doctor Coat'),
  Item(
      image: 'assets/images/category_images/sports_suit.jpg',
      name: 'Sports Suit'),
  Item(image: 'assets/images/category_images/safari.png', name: 'Safari Suit'),
  Item(
      image: 'assets/images/category_images/denim_jacket.png',
      name: 'Jean Jacket'),
  Item(image: 'assets/images/category_images/suit.png', name: 'Suit'),
  Item(image: 'assets/images/category_images/blazer.jpg', name: 'Blazers'),
  Item(image: 'assets/images/category_images/kurta.jpg', name: 'Kurtas'),
  Item(image: 'assets/images/category_images/abaya.jpg', name: 'Abaya'),
];
