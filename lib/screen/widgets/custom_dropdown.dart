import 'package:flutter/material.dart';
import 'package:grocerystacked/services/country_model.dart';
import 'package:country_flags/country_flags.dart'; // Import your country flag widget

class CustomPhoneInput extends StatelessWidget {
  final TextEditingController phoneController;
  final FocusNode phoneFocusNode;
  final CountryModel countryModel;

  const CustomPhoneInput({
    super.key,
    required this.phoneController,
    required this.phoneFocusNode,
    required this.countryModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).inputDecorationTheme.fillColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context)
                  .inputDecorationTheme
                  .enabledBorder
                  ?.borderSide
                  .color ??
              Colors.grey,
        ),
      ),
      child: Row(
        children: [
          DropdownButton<Country>(
            value: countryModel.selectedCountry,
            hint: const Text("Select a country"),
            onChanged: (Country? newValue) {
              countryModel.selectCountry(newValue);
            },
            items: countryModel.countries
                .map<DropdownMenuItem<Country>>((Country country) {
              return DropdownMenuItem<Country>(
                value: country,
                child: Row(
                  children: [
                    CountryFlag.fromCountryCode(
                      country.code,
                      width: 32,
                      height: 32,
                    ),
                    const SizedBox(width: 8),
                    Text(country.phoneCode,
                        style: const TextStyle(fontSize: 18)),
                  ],
                ),
              );
            }).toList(),
            underline: Container(), // Remove the underline
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              controller: phoneController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Phone number',
                hintStyle: TextStyle(color: Theme.of(context).hintColor),
              ),
              style: TextStyle(
                  color: Theme.of(context).textTheme.bodyLarge?.color),
              keyboardType: TextInputType.phone,
              validator: (value) {
                // Add your phone number validation logic here
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone number';
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              focusNode: phoneFocusNode,
            ),
          ),
        ],
      ),
    );
  }
}
