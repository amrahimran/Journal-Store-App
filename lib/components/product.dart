class Product {
  final String id;
  final String name;
  final double price;
  final String image;
  final String category;
  final List<String> color;
  final String description;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.category,
    required this.color,
    required this.description,
  });

}

  final Product product1 = Product(
  id: "A1",
  name: "Eternal Grace",
  price: 9500,
  image: "assets/products/wb1.webp",
  category: "wedding",
  color: ["pink", "white"],
  description: "A beautiful wedding bouquet featuring elegant roses in soft pink and white, symbolizing love and grace."
);

final Product product2 = Product(
  id: "A2",
  name: "Blushing Beauty",
  price: 8500,
  image: "assets/products/wb2.webp",
  category: "wedding",
  color: ["red", "white"],
  description: "An enchanting bouquet of red and white tulips, perfect for weddings and romantic occasions."
);

// List of products
final List<Product> products = [product1, product2];

