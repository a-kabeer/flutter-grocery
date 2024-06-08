import 'package:grocerystacked/app/app.form.dart';
import 'package:grocerystacked/screen/signup/signup_viewmodel.dart';
import 'package:grocerystacked/screen/widgets/global_text.dart';
import 'package:grocerystacked/screen/widgets/golobal_phone_textfield.dart';
import 'package:grocerystacked/utils/app_images.dart';
import 'package:grocerystacked/screen/widgets/global_elevated_button.dart';
import 'package:grocerystacked/screen/widgets/global_form_text_field.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SignupView extends StatelessWidget with $App {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignupViewModel>.reactive(
      viewModelBuilder: () => SignupViewModel(),
      onViewModelReady: (viewModel) {
        syncFormWithViewModel(viewModel);
      },
      builder: (context, viewModel, child) => Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.loginBackgroundImg),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Form(
                key: viewModel.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 100),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        height: 50,
                        child: Center(
                          child: GlobalText(
                            text: 'Get your groceries with nectar',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    GlobalTextFormField(
                      controller: nameController,
                      hintText: 'Enter your name',
                      validator: viewModel.validationModel.nameValidator,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      focusNode: viewModel.nameFocusNode,
                    ),
                    SizedBox(height: 20),
                    GlobalTextFormField(
                      controller: emailController,
                      hintText: 'Enter your email',
                      validator: viewModel.validationModel.emailValidator,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      focusNode: viewModel.emailFocusNode,
                    ),
                    SizedBox(height: 20),
                    GlobalTextFormField(
                      controller: passwordController,
                      obscureText: true,
                      hintText: 'Enter your password',
                      validator: viewModel.validationModel.passwordValidator,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      focusNode: viewModel.passwordFocusNode,
                    ),
                    SizedBox(height: 20),
                    GlobalPhoneTextField(
                      phoneController: phoneController,
                      focusNode: viewModel.phoneFocusNode,
                      validator: viewModel.validationModel.phoneValidator,
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    SizedBox(height: 20),
                    GlobalElevatedButton(
                      buttonText: 'Signup',
                      onPressed: () {
                        viewModel.submitForm();
                      },
                    ),
                    SizedBox(height: 20),
                    Text('Or connect with social media'),
                    SizedBox(height: 20),
                    GlobalElevatedButton(
                      buttonText: 'Signup with Google',
                      onPressed: viewModel.loginWithGoogle,
                      icon: const Icon(
                        Icons.g_translate,
                      ),
                    ),
                    SizedBox(height: 10),
                    GlobalElevatedButton(
                      buttonText: 'Signup with Facebook',
                      onPressed: viewModel.loginWithFacebook,
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
    );
  }
}
