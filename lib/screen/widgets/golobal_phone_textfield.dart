import 'package:flutter/material.dart';
import 'package:grocerystacked/utils/app_color.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:stacked/stacked.dart';

class PhoneNumberViewModel extends BaseViewModel {
  PhoneNumber initialPhoneNumber;
  TextEditingController phoneController;
  FocusNode? focusNode;

  PhoneNumberViewModel({PhoneNumber? initialValue})
      : initialPhoneNumber = initialValue ?? PhoneNumber(isoCode: 'PK'),
        phoneController =
            TextEditingController(text: initialValue?.phoneNumber ?? '');

  void onPhoneNumberChanged(PhoneNumber number) {
    initialPhoneNumber = number;
    notifyListeners();
  }
}

class GlobalPhoneTextField extends StatelessWidget {
  final TextEditingController phoneController;
  final PhoneNumber? initialValue;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final AutovalidateMode autoValidateMode;
  const GlobalPhoneTextField(
      {super.key,
      required this.phoneController,
      this.focusNode,
      this.validator,
      this.autoValidateMode = AutovalidateMode.disabled,
      this.initialValue});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PhoneNumberViewModel>.reactive(
      viewModelBuilder: () => PhoneNumberViewModel(initialValue: initialValue),
      builder: (context, viewModel, child) => TextFormField(
        controller: viewModel.phoneController,
        focusNode: focusNode ?? viewModel.focusNode,
        autovalidateMode: autoValidateMode,
        validator: validator,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: AppColor.secondary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: AppColor.primary,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: AppColor.error,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: AppColor.outline,
            ),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: InternationalPhoneNumberInput(
              maxLength: 15,
              selectorConfig: const SelectorConfig(
                selectorType: PhoneInputSelectorType.DIALOG,
                showFlags: true,
                useEmoji: false,
              ),
              selectorTextStyle: TextStyle(color: AppColor.onSurface),
              initialValue: viewModel.initialPhoneNumber,
              textFieldController: viewModel.phoneController,
              validator: (_) => null, // Disable validation

              formatInput: false,
              inputDecoration: InputDecoration(
                border: InputBorder.none, // Remove the default border
                hintText: 'Enter your phone number',
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
              ),
              onInputChanged: viewModel.onPhoneNumberChanged,
              onSaved: (PhoneNumber number) {
                print('On Saved: $number');
              },
            ),
          ),
        ),
      ),
    );
  }
}
