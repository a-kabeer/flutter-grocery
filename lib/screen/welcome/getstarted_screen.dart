import 'package:grocerystacked/app/app.router.dart';
import 'package:grocerystacked/screen/welcome/getstarted_viewmodel.dart';
import 'package:grocerystacked/screen/widgets/global_theme_toggle_button.dart';
import 'package:grocerystacked/utils/app_color.dart';
import 'package:grocerystacked/utils/app_images.dart';
import 'package:grocerystacked/screen/widgets/global_elevated_button.dart';
import 'package:grocerystacked/screen/widgets/global_text.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    AppColor.initialize(context);

    return ViewModelBuilder.reactive(
      viewModelBuilder: () => GetStartedViewModel(),
      onViewModelReady: (viewModel) => viewModel.init(context),
      builder: (context, viewModel, child) => Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.getStartedImg),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: GlobalText(
                      text: 'Welcome to our Store',
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  Center(
                    child: GlobalText(
                      text: 'Ger your groceries in as fast as one hour',
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  const GlobalThemeToggleButton(),
                  TextField(
                    decoration: InputDecoration(hintText: 'testing'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width *
                            0.75 /
                            2, // Divide by 2 to accommodate two buttons

                        child: GlobalElevatedButton(
                            buttonText: 'Login',
                            onPressed: () {
                              viewModel.navigationService.navigateToLoginView();
                            }),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width *
                            0.75 /
                            2, // Divide by 2 to accommodate two buttons

                        child: GlobalElevatedButton(
                          buttonText: 'Signup',
                          onPressed: () {
                            viewModel.navigationService.navigateToSignupView();
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
