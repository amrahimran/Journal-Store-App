class Product {
  final String id;
  final String name;
  final double price;
  final String image;
  final String category;
  final String color;
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

    Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'image': image,
    'price': price,
    'category':category,
    'color':color,
    'description':description
  };

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json['id'],
    name: json['name'],
    image: json['image'],
    price: json['price'],
    category: json['category'],
    color: json['color'],
    description: json['desscription'],
  );

}

final List<Product> allProducts = [
  Product(
    id: "LC1BLACK",
    name: "Moon Phases",
    price: 5500,
    image: "assets/products/L1CBLACK.webp",
    category: "journal",
    color: "BLACK",
    description: "A stylish hard-cover journal featuring a mystical moon phase design. Perfect for planning, dreaming, and manifesting.",
  ),
  Product(
    id: "L1CBLUE",
    name: "Moon Phases",
    price: 5500,
    image: "assets/products/L1CBLUE.webp",
    category: "journal",
    color: "BLUE",
    description: "A stylish hard-cover journal featuring a mystical moon phase design. Perfect for planning, dreaming, and manifesting.",
  ),
  Product(
    id: "L1CPINK",
    name: "Moon Phases",
    price: 5500,
    image: "assets/products/L1CPINK.webp",
    category: "journal",
    color: "PINK",
    description: "A stylish hard-cover journal featuring a mystical moon phase design. Perfect for planning, dreaming, and manifesting.",
  ),
  Product(
    id: "M1CBLACK",
    name: "Moon Phases",
    price: 3600,
    image: "assets/products/M1CBLACK.webp",
    category: "journal",
    color: "BLACK",
    description: "A stylish hard-cover journal featuring a mystical moon phase design. Perfect for planning, dreaming, and manifesting.",
  ),
  Product(
    id: "M1CBLUE",
    name: "Moon Phases",
    price: 3600,
    image: "assets/products/M1CBLUE.webp",
    category: "journal",
    color: "BLUE",
    description: "A stylish hard-cover journal featuring a mystical moon phase design. Perfect for planning, dreaming, and manifesting.",
  ),
  Product(
    id: "M1CPINK",
    name: "Moon Phases",
    price: 3600,
    image: "assets/products/M1CPINK.webp",
    category: "journal",
    color: "PINK",
    description: "A stylish hard-cover journal featuring a mystical moon phase design. Perfect for planning, dreaming, and manifesting.",
  ),
  Product(
    id: "L2",
    name: "Victorian Beauty",
    price: 4000,
    image: "assets/products/L2.webp",
    category: "vintage",
    color: "MIXED",
    description: "A graceful blend of vintage tones and floral elegance. Ideal for gifting or special journaling moments.",
  ),
  Product(
    id: "M2",
    name: "Victorian Beauty",
    price: 2000,
    image: "assets/products/M2.webp",
    category: "vintage",
    color: "MIXED",
    description: "A charming medium-sized version of the Victorian Beauty—stylish and practical.",
  ),
  Product(
    id: "L3",
    name: "Swan Lake",
    price: 7350,
    image: "assets/products/L3.webp",
    category: "vintage",
    color: "GREEN",
    description: "Inspired by the elegance of ballet, this set brings peace and grace to your writing. A delicate blend of design and comfort—perfect for light journaling and gifting.",
  ),
  Product(
    id: "M3",
    name: "Swan Lake",
    price: 5640,
    image: "assets/products/M3.webp",
    category: "vintage",
    color: "GREEN",
    description: "Inspired by the elegance of ballet, this set brings peace and grace to your writing. A delicate blend of design and comfort—perfect for light journaling and gifting.",
  ),
  Product(
    id: "L4",
    name: "Mosaic Of Life",
    price: 6000,
    image: "assets/products/L4.webp",
    category: "cute",
    color: "GREEN",
    description: "A journal set celebrating life's colorful moments with intricate patterns and flair.",
  ),
  Product(
    id: "M4",
    name: "Mosaic Of Life",
    price: 3700,
    image: "assets/products/M4.webp",
    category: "cute",
    color: "GREEN",
    description: "A journal set celebrating life's colorful moments with intricate patterns and flair.",
  ),
  Product(
    id: "L5",
    name: "North Star",
    price: 2900,
    image: "assets/products/L5.webp",
    category: "journal",
    color: "BLUE",
    description: "Let this journal guide your thoughts like a star through the night—calm, cool, and collected.",
  ),
  Product(
    id: "M5",
    name: "North Star",
    price: 1800,
    image: "assets/products/M5.webp",
    category: "journal",
    color: "BLUE",
    description: "Let this journal guide your thoughts like a star through the night—calm, cool, and collected.",
  ),
  Product(
    id: "L6CBLACK",
    name: "Classic Notebook",
    price: 2200,
    image: "assets/products/L6CBLACK.webp",
    category: "cute",
    color: "BLACK",
    description: "A timeless notebook design with soft-touch covers and smooth paper, available in both large and medium sizes. Comes in black, blue, green, and pink."
  ),
  Product(
    id: "L6CBLUE",
    name: "Classic Notebook",
    price: 2200,
    image: "assets/products/L6CBLUE.webp",
    category: "cute",
    color: "BLUE",
    description: "A timeless notebook design with soft-touch covers and smooth paper, available in both large and medium sizes. Comes in black, blue, green, and pink."
  ),
  Product(
    id: "L6CGREEN",
    name: "Classic Notebook",
    price: 2200,
    image: "assets/products/L6CGREEN.webp",
    category: "cute",
    color: "GREEN",
    description: "A timeless notebook design with soft-touch covers and smooth paper, available in both large and medium sizes. Comes in black, blue, green, and pink."
  ),
  Product(
    id: "L6CPINK",
    name: "Classic Notebook",
    price: 2200,
    image: "assets/products/L6CPINK.webp",
    category: "cute",
    color: "PINK",
    description: "A timeless notebook design with soft-touch covers and smooth paper, available in both large and medium sizes. Comes in black, blue, green, and pink."
  ),
  Product(
    id: "M6CBLACK",
    name: "Classic Notebook",
    price: 1500,
    image: "assets/products/M6CBLACK.webp",
    category: "cute",
    color: "BLACK",
    description: "A timeless notebook design with soft-touch covers and smooth paper, available in both large and medium sizes. Comes in black, blue, green, and pink."
  ),
  Product(
    id: "M6CBLUE",
    name: "Classic Notebook",
    price: 1500,
    image: "assets/products/M6CBLUE.webp",
    category: "cute",
    color: "BLUE",
    description: "A timeless notebook design with soft-touch covers and smooth paper, available in both large and medium sizes. Comes in black, blue, green, and pink."
  ),
  Product(
    id: "M6CGREEN",
    name: "Classic Notebook",
    price: 1500,
    image: "assets/products/M6CGREEN.webp",
    category: "cute",
    color: "GREEN",
    description: "A timeless notebook design with soft-touch covers and smooth paper, available in both large and medium sizes. Comes in black, blue, green, and pink."
  ),
  Product(
    id: "M6CPINK",
    name: "Classic Notebook",
    price: 1500,
    image: "assets/products/M6CPINK.webp",
    category: "cute",
    color: "PINK",
    description: "A timeless notebook design with soft-touch covers and smooth paper, available in both large and medium sizes. Comes in black, blue, green, and pink."
  ),
  Product(
    id: "L7",
    name: "The Flower Garden",
    price: 7750,
    image: "assets/products/L7.webp",
    category: "vintage",
    color: "WHITE",
    description: "A floral-themed, notebook that brings a breath of fresh air to your writing sessions."
  ),
  Product(
    id: "M7",
    name: "The Flower Garden",
    price: 6900,
    image: "vintage",
    category: "assets/products/M7.webp",
    color: "WHITE",
    description: "A floral-themed, medium notebook that brings a breath of fresh air to your writing sessions."
  ),
  Product(
    id: "L8",
    name: "Panda And Friends",
    price: 3000,
    image: "assets/products/L8.webp",
    category: "cute",
    color: "BLUE",
    description: "A cheerful design filled with playful panda vibes—great for kids and fun-loving adults."
  ),
  Product(
    id: "M8",
    name: "Panda And Friends",
    price: 1500,
    image: "assets/products/M8.webp",
    category: "",
    color: "BLUE",
    description: "A cheerful design filled with playful panda vibes—great for kids and fun-loving adults."
  ),
  Product(
    id: "L9CBLACK",
    name: "Tsuki Journal",
    price: 2200,
    image: "assets/products/L9CBLACK.webp",
    category: "journal",
    color: "BLACK",
    description: "The Tsuki Journal combines minimalism with charm. Whether you're bullet journaling or sketching, it's available in both large and medium sizes in black, blue, green, and pink."
  ),
  Product(
    id: "L9CBLUE",
    name: "Tsuki Journal",
    price: 2200,
    image: "assets/products/L9CBLUE.webp",
    category: "journal",
    color: "BLUE",
    description: "The Tsuki Journal combines minimalism with charm. Whether you're bullet journaling or sketching, it's available in both large and medium sizes in black, blue, green, and pink."
  ),
  Product(
    id: "L9CGREEN",
    name: "Tsuki Journal",
    price: 2200,
    image: "assets/products/L9CGREEN.webp",
    category: "journal",
    color: "GREEN",
    description: "The Tsuki Journal combines minimalism with charm. Whether you're bullet journaling or sketching, it's available in both large and medium sizes in black, blue, green, and pink."
  ),
  Product(
    id: "L9CPINK",
    name: "Tsuki Journal",
    price: 2200,
    image: "assets/products/L9CPINK.webp",
    category: "journal",
    color: "PINK",
    description: "The Tsuki Journal combines minimalism with charm. Whether you're bullet journaling or sketching, it's available in both large and medium sizes in black, blue, green, and pink."
  ),
  Product(
    id: "M9CBLACK",
    name: "Tsuki Journal",
    price: 1650,
    image: "assets/products/M9CBLACK.webp",
    category: "journal",
    color: "BLACK",
    description: "The Tsuki Journal combines minimalism with charm. Whether you're bullet journaling or sketching, it's available in both large and medium sizes in black, blue, green, and pink."
  ),
  Product(
    id: "M9CBLUE",
    name: "Tsuki Journal",
    price: 1650,
    image: "assets/products/M9CBLUE.webp",
    category: "journal",
    color: "BLUE",
    description: "The Tsuki Journal combines minimalism with charm. Whether you're bullet journaling or sketching, it's available in both large and medium sizes in black, blue, green, and pink."
  ),
  Product(
    id: "M9CGREEN",
    name: "Tsuki Journal",
    price: 1650,
    image: "assets/products/M9CGREEN.webp",
    category: "journal",
    color: "GREEN",
    description: "The Tsuki Journal combines minimalism with charm. Whether you're bullet journaling or sketching, it's available in both large and medium sizes in black, blue, green, and pink."
  ),
  Product(
    id: "M9CPINK",
    name: "Tsuki Journal",
    price: 1650,
    image: "assets/products/M9CPINK.webp",
    category: "journal",
    color: "PINK",
    description: "The Tsuki Journal combines minimalism with charm. Whether you're bullet journaling or sketching, it's available in both large and medium sizes in black, blue, green, and pink."
  ),
  Product(
    id: "L10",
    name: "Chen Chin Ling",
    price: 4000,
    image: "assets/products/L10.webp",
    category: "eastern",
    color: "WHITE",
    description: "A serene and elegant journal inspired by traditional Eastern artistry."
  ),
  Product(
    id: "M10",
    name: "Chen Chin Ling",
    price: 3100,
    image: "assets/products/M10.webp",
    category: "eastern",
    color: "WHITE",
    description: "A serene and elegant journal inspired by traditional Eastern artistry."
  ),
  Product(
    id: "L11",
    name: "Celestial Chinese",
    price: 5000,
    image: "assets/products/L11.webp",
    category: "eastern",
    color: "RED",
    description: "Celebrate the stars and ancient mystique with this richly designed notebook."
  ),
  Product(
    id: "M11",
    name: "Celestial Chinese",
    price: 4250,
    image: "assets/products/M11.webp",
    category: "eastern",
    color: "RED",
    description: "Celebrate the stars and ancient mystique with this richly designed notebook."
  ),
  Product(
    id: "L12",
    name: "Butterfly Stickers",
    price: 1300,
    image: "assets/products/L12.webp",
    category: "other",
    color: "MIXED",
    description: "Add a magical touch to your notebooks, letters, or devices with these colorful butterfly stickers."
  ),
  Product(
    id: "L13",
    name: "Sunflower Stickers",
    price: 1300,
    image: "assets/products/L13.webp",
    category: "other",
    color: "MIXED",
    description: "Bright and cheerful sunflower-themed stickers to decorate anything that brings you joy."
  ),
  Product(
      id: "L14",
    name: "Secret Garden",
    price: 1300,
    image: "assets/products/L14.webp",
    category: "other",
    color: "MIXED",
    description: "A whimsical set of nature-inspired stickers—perfect for bullet journaling and scrapbooking."
  ),
  Product(
    id: "L15",
    name: "Crystal Pen Set",
    price: 5000,
    image: "assets/products/L15.webp",
    category: "other",
    color: "MIXED",
    description: "A premium pen set with intricate detailing and smooth ink flow—ideal for both collectors and daily writers."
  ),
  Product(
    id: "L16",
    name: "Fountain Pen",
    price: 8000,
    image: "assets/products/L16.webp",
    category: "other",
    color: "BLUE",
    description: "Masterfully crafted with a traditional Japanese aesthetic, this fountain pen delivers elegance and performance."
  ),
  
];





