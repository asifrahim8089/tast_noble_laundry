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
  Item(image: 'assets/images/category_images/trd8.png', name: 'Qatari Thobe'),
  Item(image: 'assets/images/category_images/trd7.png', name: 'Winter Thobe'),
  Item(image: 'assets/images/category_images/trd9.png', name: 'Ghutra'),
  Item(image: 'assets/images/category_images/trd10.png', name: 'Shimagh'),
  Item(image: 'assets/images/category_images/trd5.png', name: 'Abaya'),
  Item(image: 'assets/images/category_images/trd4.png', name: 'Gown'),
  Item(image: 'assets/images/category_images/trd3.png', name: 'Besht'),
  Item(image: 'assets/images/category_images/trd2.png', name: 'Jalebiah'),
  Item(image: 'assets/images/category_images/trd1.png', name: 'Sarwal'),
];
