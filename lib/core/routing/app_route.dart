import 'package:ecommerce_app_huma_volve/core/routing/route_const.dart';
import 'package:ecommerce_app_huma_volve/features/details/presentation/ui/screens/product_details_screen.dart';

import 'package:ecommerce_app_huma_volve/features/details/presentation/ui/widgets/share_product_button.dart';
import 'package:ecommerce_app_huma_volve/features/splash/screens/splash_screen.dart';

import 'package:go_router/go_router.dart';

GoRouter goRouter = GoRouter(
  initialLocation: RoutePath.splashscreen,
  routes: [
    GoRoute(
      path: RoutePath.productDetailsPath,
      name: RouteName.productDetailsName,

      builder: (context, state) {
        final productId = state.extra as int;
        return ProductDetailsScreen(productId: productId);
      },
    ),
    GoRoute(
      path: RoutePath.splashscreen,
      name: RouteName.splashscreen,
      builder: (context, state) => SplashScreen(),
    ),
  ],
);
