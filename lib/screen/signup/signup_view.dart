import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:grocerystacked/app/app.form.dart';
import 'package:grocerystacked/screen/signup/signup_viewmodel.dart';
import 'package:grocerystacked/screen/widgets/custom_dropdown.dart';
import 'package:grocerystacked/utils/app_images.dart';
import 'package:grocerystacked/screen/widgets/custom_button.dart';
import 'package:grocerystacked/screen/widgets/custom_form_text_field.dart';
import 'package:grocerystacked/screen/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
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
                          child: CustomText(
                            text: 'Get your groceries with nectar',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    CustomTextFormField(
                      controller: nameController,
                      hintText: 'Enter your name',
                      validator: viewModel.validationModel.nameValidator,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      focusNode: viewModel.nameFocusNode,
                    ),
                    SizedBox(height: 20),
                    CustomTextFormField(
                      controller: emailController,
                      hintText: 'Enter your email',
                      validator: viewModel.validationModel.emailValidator,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      focusNode: viewModel.emailFocusNode,
                    ),
                    SizedBox(height: 20),
                    CustomTextFormField(
                      controller: passwordController,
                      obscureText: true,
                      hintText: 'Enter your password',
                      validator: viewModel.validationModel.passwordValidator,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      focusNode: viewModel.passwordFocusNode,
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white, // Adjust according to your theme
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: Theme.of(context).colorScheme.surface),
                      ),
                      child: InternationalPhoneNumberInput(
                        onInputChanged: (PhoneNumber number) {},
                        selectorConfig: SelectorConfig(
                          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                          showFlags: true,
                          useEmoji: false,
                        ),
                        selectorTextStyle: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface),
                        initialValue: PhoneNumber(isoCode: 'PK'),
                        textFieldController: phoneController,
                        formatInput: false,
                        keyboardType: TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                        inputDecoration: InputDecoration(
                          border: InputBorder.none, // Remove the default border
                          hintText: 'Enter your phone number',
                        ),
                        onSaved: (PhoneNumber number) {
                          print('On Saved: $number');
                        },
                      ),
                    ),
                    SizedBox(height: 20),

                    // Container(
                    //   padding: EdgeInsets.symmetric(horizontal: 16),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(8),
                    //   ),
                    //   child: Row(
                    //     children: [
                    //       DropdownButton<Country>(
                    //         value: viewModel.countrymodel.selectedCountry,
                    //         hint: Text("Select a country"),
                    //         onChanged: (Country? newValue) {
                    //           viewModel.countrymodel.selectCountry(newValue);
                    //         },
                    //         items: viewModel.countrymodel.countries
                    //             .map<DropdownMenuItem<Country>>(
                    //                 (Country country) {
                    //           return DropdownMenuItem<Country>(
                    //             value: country,
                    //             child: Row(
                    //               children: [
                    //                 CountryFlag.fromCountryCode(
                    //                   country.code,
                    //                   width: 32,
                    //                   height: 32,
                    //                 ),
                    //                 SizedBox(width: 1),
                    //                 Text(country.phoneCode,
                    //                     style: TextStyle(fontSize: 18)),
                    //               ],
                    //             ),
                    //           );
                    //         }).toList(),
                    //       ),
                    //       SizedBox(width: 2),
                    //       Expanded(
                    //         child: TextFormField(
                    //           controller: phoneController,
                    //           decoration: InputDecoration(
                    //             border: InputBorder.none,
                    //             hintText: 'Phone number',
                    //           ),
                    //           keyboardType: TextInputType.phone,
                    //           validator: viewModel.validationModel.phoneValidator,
                    //           autovalidateMode:
                    //               AutovalidateMode.onUserInteraction,
                    //           focusNode: viewModel.phoneFocusNode,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    CustomPhoneInput(
                        phoneController: phoneController,
                        phoneFocusNode: phoneFocusNode,
                        countryModel: viewModel.countryModel),
                    SizedBox(height: 20),
                    CustomButton(
                      buttonText: 'Signup',
                      onPressed: () {
                        viewModel.submitForm();
                      },
                    ),
                    SizedBox(height: 20),
                    Text('Or connect with social media'),
                    SizedBox(height: 20),
                    CustomButton(
                      buttonText: 'Signup with Google',
                      onPressed: viewModel.loginWithGoogle,
                      icon: const Icon(
                        Icons.g_translate,
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomButton(
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
