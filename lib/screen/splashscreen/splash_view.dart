import 'package:grocerystacked/screen/splashscreen/splash_viewmodel.dart';
import 'package:grocerystacked/utils/app_color.dart';
import 'package:grocerystacked/utils/app_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    AppColor.initialize(context);

    return ViewModelBuilder<SplashViewmodel>.reactive(
      viewModelBuilder: () => SplashViewmodel(),
      onViewModelReady: (viewModel) => viewModel.init(context),
      builder: (context, viewModel, child) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(AppSvg.logo),
            ],
          ),
        ),
        backgroundColor: AppColor.primary,
      ),
    );
  }
}
