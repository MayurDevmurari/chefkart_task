import 'package:chefkart_task/UI/dishes/dishes_screen.dart';
import 'package:chefkart_task/UI/dishes/view/dishes_detail_screen.dart';
import 'package:chefkart_task/UI/splash_screen/splash_screen.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  static const initialRoute = Routes.splashScreen;

  static final routes = [
    GetPage(
      name: Routes.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.dishesScreen,
      page: () => const DishesScreen(),
    ),
    GetPage(
      name: Routes.dishesDetailScreen,
      page: () => const DishesDetailScreen(),
    ),
  ];
}
