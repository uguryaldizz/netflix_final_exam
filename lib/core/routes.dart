import 'package:go_router/go_router.dart';

import '../screens/client/edit-profile.dart';
import '../screens/client/register.dart';
import '../screens/client/login.dart';
import '../screens/client/profile.dart';
import '../screens/core/error.dart';
import '../screens/core/loader.dart';
import '../screens/core/settings.dart';
import '../screens/home.dart';
import '../screens/payment/payment.dart';
import '../screens/product/brands.dart';
import '../screens/product/cart.dart';
import '../screens/product/favorites.dart';
import '../screens/product/product.dart';
import '../screens/product/products.dart';
import '../screens/product/search.dart';
import '../screens/static/about.dart';
import '../screens/static/boarding.dart';
import '../screens/static/contact.dart';
import '../screens/static/ip.dart';
import '../screens/static/preview.dart';
import '../screens/static/translator.dart';

// GoRouter configuration
final routes = GoRouter(
  errorBuilder: (context, state) => const ErrorScreen(),
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoaderScreen(),
    ),
    GoRoute(
      path: '/preview',
      builder: (context, state) => const PreviewScreen(),
    ),
    GoRoute(
      path: '/ip',
      builder: (context, state) => const IPScreen(),
    ),
    GoRoute(
      path: '/translate',
      builder: (context, state) => const TranslateScreen(),
    ),
    GoRoute(
      path: '/payment',
      builder: (context, state) => const PaymentScreen(),
    ),
    GoRoute(
      path: '/brands',
      builder: (context, state) => const BrandsScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/edit-profile',
      builder: (context, state) => const EditProfileScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: '/boarding',
      builder: (context, state) => const BoardingScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/about',
      builder: (context, state) => const AboutScreen(),
    ),
    GoRoute(
      path: '/contact',
      builder: (context, state) => const ContactScreen(),
    ),
    GoRoute(
      path: '/product',
      builder: (context, state) => const ProductScreen(),
    ),
    GoRoute(
      path: "/products",
      builder: (context, state) => const ProductsScreen(),
    ),
    GoRoute(
      path: "/favorites",
      builder: (context, state) => const FavoritesScreen(),
    ),
    GoRoute(
      path: "/cart",
      builder: (context, state) => const CartScreen(),
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) => const SearchScreen(),
    ),
  ],
);
