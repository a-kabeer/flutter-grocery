import 'package:grocerystacked/screen/cart/cart_view.dart';
import 'package:grocerystacked/screen/favorite/favorite_view.dart';
import 'package:grocerystacked/screen/home/home_view.dart';
import 'package:grocerystacked/screen/login/login_view.dart';
import 'package:grocerystacked/screen/signup/signup_view.dart';
import 'package:grocerystacked/screen/splashscreen/splash_view.dart';
import 'package:grocerystacked/screen/welcome/getstarted_screen.dart';
import 'package:grocerystacked/services/cart_model.dart';
import 'package:grocerystacked/services/favorite_model.dart';
import 'package:grocerystacked/screen/widgets/global_theme_switch.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@FormView(fields: [
  FormTextField(name: 'name'),
  FormTextField(name: 'phone'),
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
])
@StackedApp(
  routes: [
    MaterialRoute(page: SplashView, initial: true),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: GetStartedView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: SignupView),
    MaterialRoute(page: CartView),
    MaterialRoute(page: FavoriteView),
  ],
  dependencies: [
    Singleton(classType: NavigationService),
    Singleton(classType: CartService),
    Singleton(classType: FavoriteService),
    Singleton(classType: ThemeViewModel),
    
  ],
)
class App {}
