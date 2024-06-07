import 'package:grocerystacked/app/app.form.dart';
import 'package:grocerystacked/screen/widgets/custom_button.dart';
import 'package:grocerystacked/screen/widgets/custom_form_text_field.dart';
import 'package:grocerystacked/screen/widgets/custom_text.dart';
import 'package:grocerystacked/utils/app_color.dart';
import 'package:grocerystacked/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'login_viewmodel.dart';

class LoginView extends StatelessWidget with $App {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      // onViewModelReady: (viewModel) => viewModel.init(context),
      builder: (context, model, child) => Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.loginBackgroundImg),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: model.formKey,
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                        ),
                        height: 50,
                        child: Center(
                          child: CustomText(
                            text: 'Get your groceries with nectar',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      CustomTextFormField(
                        controller: emailController,
                        hintText: 'Enter your email',
                        validator: model.validationModel.emailValidator,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        focusNode: model.emailFocusNode,
                      ),
                      SizedBox(height: 20),
                      CustomTextFormField(
                        controller: passwordController,
                        obscureText: true,
                        hintText: 'Enter your password',
                        validator: model.validationModel.passwordValidator,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        focusNode: model.passwordFocusNode,
                      ),
                      SizedBox(height: 20),
                      CustomButton(
                        buttonText: 'Login',
                        onPressed: () {
                          model.submitForm();
                        },
                      ),
                      SizedBox(height: 20),
                      Text('Or connect with social media'),
                      SizedBox(height: 20),
                      CustomButton(
                        buttonText: 'login with Google',
                        onPressed: model.loginWithGoogle,
                        icon: const Icon(
                          Icons.g_translate,
                        ),
                      ),
                      SizedBox(height: 10),
                      CustomButton(
                        buttonText: 'login with Facebook',
                        onPressed: model.loginWithFacebook,
                        icon: const Icon(
                          Icons.facebook,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}    
        
        
        // Stack(
        //   children: [
        //     Positioned(
        //       child: Image.asset(
        //         AppImages.loginBackgroundImg,
        //         fit: BoxFit.cover,
        //       ),
        //     ),
        //     SingleChildScrollView(
        //       child: 
        //     ),
        //   ],
        // ),
    
