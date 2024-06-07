import 'package:grocerystacked/screen/home/home_view.dart';
import 'package:grocerystacked/screen/login/login_view.dart';
import 'package:grocerystacked/screen/signup/signup_view.dart';
import 'package:grocerystacked/screen/splashscreen/splash_view.dart';
import 'package:grocerystacked/screen/welcome/getstarted_screen.dart';
import 'package:grocerystacked/services/cart_model.dart';
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
  ],
  dependencies: [
    Singleton(classType: NavigationService),
    Singleton(classType: CartService)
  ],
)
class App {}
