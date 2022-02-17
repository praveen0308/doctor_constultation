import 'package:doctor_consultation/models/country_model.dart';
import 'package:doctor_consultation/res/image_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountryPickerDdl extends StatefulWidget {
  final Function(CountryModel countryModel) onCountrySelected;
  const CountryPickerDdl({Key? key, required this.onCountrySelected})
      : super(key: key);

  @override
  _CountryPickerDdlState createState() => _CountryPickerDdlState();
}

class _CountryPickerDdlState extends State<CountryPickerDdl> {
  final List<CountryModel> countries = [];

  void populateCountries() {
    countries.clear();
    countries.add(CountryModel(1, "India", AppImages.imgBharatFlag, "+91"));
    countries.add(CountryModel(2, "USA", AppImages.imgUSFlag, "+1"));
    countries.add(CountryModel(3, "UK", AppImages.imgUKFlag, "+44"));
  }

  late CountryModel selectedCountry = countries[0];
  @override
  void initState() {
    super.initState();

    populateCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      child: DropdownButtonHideUnderline(
        child: DropdownButton<CountryModel>(
          value: selectedCountry,
          isExpanded: true,
          items: countries.map(buildDropDownMenuItem).toList(),
          onChanged: (value) {
            widget.onCountrySelected(value!);
            setState(() {
              selectedCountry = value;
            });
          },
        ),
      ),
    );
  }
}

DropdownMenuItem<CountryModel> buildDropDownMenuItem(CountryModel item) =>
    DropdownMenuItem(
        value: item,
        child: Image(
          image: AssetImage(item.imgUrl),
          height: 24,
        ));
