import '../models/product.dart';

/// Categories used for the filter chips on the Home screen.
const List<String> productCategories = [
  'All',
  'Electronics',
  'Fashion',
  'Home & Living',
  'Beauty',
  'Books',
];

/// Local mock product catalogue.
/// Images are loaded from picsum.photos (free placeholder image service)
/// since this app uses no backend — every product is hard-coded here.
final List<Product> mockProducts = [
  const Product(
    id: 'p1',
    name: 'Wireless Over-Ear Headphones',
    category: 'Electronics',
    price: 8990,
    rating: 4.5,
    reviewCount: 218,
    imageUrl: 'https://picsum.photos/seed/cyphmart1/600/600',
    description:
        'Premium wireless headphones with active noise cancellation, a 30-hour battery life, and plush memory-foam ear cushions for all-day comfort.',
  ),
  const Product(
    id: 'p2',
    name: 'Smart Fitness Band',
    category: 'Electronics',
    price: 6490,
    rating: 4.2,
    reviewCount: 156,
    imageUrl: 'https://picsum.photos/seed/cyphmart2/600/600',
    description:
        'Track your steps, heart rate, and sleep with this lightweight fitness band. Water-resistant and pairs easily with your phone.',
  ),
  const Product(
    id: 'p3',
    name: 'Portable Bluetooth Speaker',
    category: 'Electronics',
    price: 5290,
    rating: 4.6,
    reviewCount: 312,
    imageUrl: 'https://picsum.photos/seed/cyphmart3/600/600',
    description:
        'Compact speaker with rich bass and crisp highs. Splash-proof design makes it perfect for the beach, the shower, or a backyard party.',
  ),
  const Product(
    id: 'p4',
    name: '65W Fast Charger Adapter',
    category: 'Electronics',
    price: 2490,
    rating: 4.3,
    reviewCount: 98,
    imageUrl: 'https://picsum.photos/seed/cyphmart4/600/600',
    description:
        'Charge your laptop and phone at the same time with this dual-port 65W GaN charger. Small enough to fit in any pocket or bag.',
  ),
  const Product(
    id: 'p5',
    name: "Men's Slim Fit Cotton Shirt",
    category: 'Fashion',
    price: 3290,
    rating: 4.1,
    reviewCount: 87,
    imageUrl: 'https://picsum.photos/seed/cyphmart5/600/600',
    description:
        'Breathable 100% cotton shirt with a modern slim fit. Easy to iron and great for both office wear and casual outings.',
  ),
  const Product(
    id: 'p6',
    name: "Women's Summer Floral Dress",
    category: 'Fashion',
    price: 4590,
    rating: 4.4,
    reviewCount: 143,
    imageUrl: 'https://picsum.photos/seed/cyphmart6/600/600',
    description:
        'A light, flowy floral dress made for warm days. Soft fabric, flattering fit, and a print that pairs well with sandals or sneakers.',
  ),
  const Product(
    id: 'p7',
    name: 'Classic Leather Wallet',
    category: 'Fashion',
    price: 2890,
    rating: 4.0,
    reviewCount: 64,
    imageUrl: 'https://picsum.photos/seed/cyphmart7/600/600',
    description:
        'Genuine leather bi-fold wallet with six card slots and a coin pocket. Ages beautifully with daily use.',
  ),
  const Product(
    id: 'p8',
    name: 'Unisex Canvas Sneakers',
    category: 'Fashion',
    price: 5990,
    rating: 4.3,
    reviewCount: 201,
    imageUrl: 'https://picsum.photos/seed/cyphmart8/600/600',
    description:
        'Lightweight canvas sneakers with a cushioned sole. A versatile everyday shoe that goes with almost any outfit.',
  ),
  const Product(
    id: 'p9',
    name: 'Ceramic Coffee Mug Set (4 pcs)',
    category: 'Home & Living',
    price: 1990,
    rating: 4.5,
    reviewCount: 76,
    imageUrl: 'https://picsum.photos/seed/cyphmart9/600/600',
    description:
        'A set of four matte-finish ceramic mugs, microwave and dishwasher safe. Looks great on any kitchen shelf.',
  ),
  const Product(
    id: 'p10',
    name: 'Scented Soy Candle',
    category: 'Home & Living',
    price: 1490,
    rating: 4.2,
    reviewCount: 54,
    imageUrl: 'https://picsum.photos/seed/cyphmart10/600/600',
    description:
        'Hand-poured soy wax candle with a warm vanilla-sandalwood scent. Burns cleanly for up to 40 hours.',
  ),
  const Product(
    id: 'p11',
    name: 'Non-Stick Frying Pan 26cm',
    category: 'Home & Living',
    price: 3590,
    rating: 4.4,
    reviewCount: 112,
    imageUrl: 'https://picsum.photos/seed/cyphmart11/600/600',
    description:
        'Durable non-stick frying pan with an ergonomic handle and even heat distribution. Suitable for gas, induction, and electric stoves.',
  ),
  const Product(
    id: 'p12',
    name: 'Hydrating Face Serum',
    category: 'Beauty',
    price: 2290,
    rating: 4.6,
    reviewCount: 189,
    imageUrl: 'https://picsum.photos/seed/cyphmart12/600/600',
    description:
        'A lightweight serum with hyaluronic acid that hydrates and smooths skin. Suitable for all skin types, fragrance-free.',
  ),
  const Product(
    id: 'p13',
    name: 'Natural Bamboo Toothbrush Set',
    category: 'Beauty',
    price: 890,
    rating: 4.1,
    reviewCount: 45,
    imageUrl: 'https://picsum.photos/seed/cyphmart13/600/600',
    description:
        'A pack of 4 biodegradable bamboo toothbrushes with soft bristles — an eco-friendly swap for your bathroom routine.',
  ),
  const Product(
    id: 'p14',
    name: 'Atomic Habits (Paperback)',
    category: 'Books',
    price: 1690,
    rating: 4.8,
    reviewCount: 502,
    imageUrl: 'https://picsum.photos/seed/cyphmart14/600/600',
    description:
        'James Clear\'s bestselling guide to building good habits and breaking bad ones, one small change at a time.',
  ),
  const Product(
    id: 'p15',
    name: 'Modern Sri Lankan Cookbook',
    category: 'Books',
    price: 2190,
    rating: 4.5,
    reviewCount: 67,
    imageUrl: 'https://picsum.photos/seed/cyphmart15/600/600',
    description:
        'A beautifully illustrated cookbook with over 60 traditional and modern Sri Lankan recipes, from rice & curry to short eats.',
  ),
];
