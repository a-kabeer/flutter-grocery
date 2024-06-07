import 'package:country_flags/country_flags.dart';
import 'package:grocerystacked/app/app.form.dart';
import 'package:grocerystacked/screen/signup/signup_viewmodel.dart';
import 'package:grocerystacked/services/country_model.dart';
import 'package:grocerystacked/utils/app_color.dart';
import 'package:grocerystacked/utils/app_images.dart';
import 'package:grocerystacked/screen/widgets/custom_button.dart';
import 'package:grocerystacked/screen/widgets/custom_form_text_field.dart';
import 'package:grocerystacked/screen/widgets/custom_text.dart';
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
            child: SingleChildScrollView(
              child: Form(
                key: model.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 100),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          color: AppColor.greenSwatch,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        height: 50,
                        child: Center(
                          child: CustomText(
                            text: 'Get your groceries with nectar',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomTextFormField(
                      controller: nameController,
                      hintText: 'Enter your name',
                      validator: model.validationModel.nameValidator,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      focusNode: model.nameFocusNode,
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
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: AppColor.greenSwatch),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          DropdownButton<Country>(
                            value: model.countrymodel.selectedCountry,
                            hint: Text("Select a country"),
                            onChanged: (Country? newValue) {
                              model.countrymodel.selectCountry(newValue);
                            },
                            items: model.countrymodel.countries
                                .map<DropdownMenuItem<Country>>(
                                    (Country country) {
                              return DropdownMenuItem<Country>(
                                value: country,
                                child: Row(
                                  children: [
                                    CountryFlag.fromCountryCode(
                                      country.code,
                                      width: 32,
                                      height: 32,
                                    ),
                                    SizedBox(width: 1),
                                    Text(country.phoneCode,
                                        style: TextStyle(fontSize: 18)),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                          SizedBox(width: 2),
                          Expanded(
                            child: TextFormField(
                              controller: phoneController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Phone number',
                              ),
                              keyboardType: TextInputType.phone,
                              validator: model.validationModel.phoneValidator,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              focusNode: model.phoneFocusNode,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomButton(
                      buttonText: 'Signup',
                      onPressed: () {
                        model.submitForm();
                      },
                    ),
                    SizedBox(height: 20),
                    Text('Or connect with social media'),
                    SizedBox(height: 20),
                    CustomButton(
                      buttonText: 'Signup with Google',
                      onPressed: model.loginWithGoogle,
                      icon: const Icon(
                        Icons.g_translate,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomButton(
                      buttonText: 'Signup with Facebook',
                      onPressed: model.loginWithFacebook,
                      icon: const Icon(
                        Icons.facebook,
                        color: Colors.white,
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
