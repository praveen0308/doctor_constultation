import 'package:doctor_consultation/models/api/patient_address_model.dart';
import 'package:doctor_consultation/models/api/patient_detail_model.dart';
import 'package:doctor_consultation/models/relation_model.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/user/patient/add_patient/add_patient_cubit.dart';
import 'package:doctor_consultation/ui/widgets/btn/btn_outline_tab.dart';
import 'package:doctor_consultation/ui/widgets/btn/custom_btn.dart';
import 'package:doctor_consultation/ui/widgets/custom_dropdown.dart';
import 'package:doctor_consultation/ui/widgets/no_glow_behaviour.dart';
import 'package:doctor_consultation/ui/widgets/view_custom_dropdown.dart';
import 'package:doctor_consultation/util/app_constants.dart';
import 'package:doctor_consultation/util/util_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPatientInfo extends StatefulWidget {
  const AddPatientInfo({Key? key}) : super(key: key);

  @override
  _AddPatientInfoState createState() => _AddPatientInfoState();
}

class _AddPatientInfoState extends State<AddPatientInfo> {
  late AddPatientCubit _addPatientCubit;
  final _addPatientInfoFormKey = GlobalKey<FormState>();
  final List<RelationModel> relations = AppConstants.getRelations();
  final PatientDetailModel _patientDetailModel = PatientDetailModel();
  final PatientAddressModel _patientAddressModel = PatientAddressModel();

  @override
  void initState() {
    super.initState();
    _addPatientCubit = BlocProvider.of<AddPatientCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add Patient"),
        ),
        body: BlocBuilder<AddPatientCubit, AddPatientState>(
          builder: (context, state) {
            if (state is Error) {
              showToast(state.msg, ToastType.error);
            }
            if (state is PatientAddedSuccessfully) {
              showToast("Patient added successfully !!!", ToastType.success);

              _addPatientCubit.close();
              WidgetsBinding.instance!.addPostFrameCallback((_) {
                Navigator.pop(context);
              });
            }
            return Form(
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ScrollConfiguration(
                behavior: NoGlowBehaviour(),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            "Patient Details",
                            style: AppTextStyle.headline6(),
                          )),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomDropDown(
                          hint: "Select Relation",
                          itemList: relations,
                          isOutlined: true,
                          onItemSelected: (item) {
                            _patientDetailModel.RelationID =
                                (item as RelationModel).relationId;
                          }),
                      TextFormField(
                        onChanged: (text) =>
                            _patientDetailModel.FullName = text,
                        onFieldSubmitted: (text) =>
                            _patientDetailModel.FullName = text,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter patient\'s name',
                          labelText: 'Name',
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        onChanged: (text) =>
                            _patientDetailModel.Age = int.tryParse(text),
                        onFieldSubmitted: (text) =>
                            _patientDetailModel.Age = int.tryParse(text),
                        keyboardType: TextInputType.number,
                        maxLength: 3,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter patient\'s age',
                          labelText: 'Age',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: BtnOutlineTabView(
                          txtTab1: "Male",
                          txtTab2: "Female",
                          txtTab3: "Other",
                          onTabSelected: (int index) {
                            _patientDetailModel.GenderID = index + 1;
                          },
                        ),
                      ),
                      Container(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            "Address Details",
                            style: AppTextStyle.headline5(),
                          )),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        onChanged: (text) =>
                            _patientAddressModel.AddressLine1 = text,
                        onFieldSubmitted: (text) =>
                            _patientAddressModel.AddressLine1 = text,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your address',
                          labelText: 'Address',
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        onChanged: (text) => _patientAddressModel.City = text,
                        onFieldSubmitted: (text) =>
                            _patientAddressModel.City = text,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your city',
                          labelText: 'City',
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        onChanged: (text) => _patientAddressModel.State = text,
                        onFieldSubmitted: (text) =>
                            _patientAddressModel.State = text,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your state',
                          labelText: 'State',
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        onChanged: (text) =>
                            _patientAddressModel.PinCode = int.parse(text),
                        onFieldSubmitted: (text) =>
                            _patientAddressModel.PinCode = int.parse(text),
                        keyboardType: TextInputType.number,
                        maxLength: 6,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your pincode',
                          labelText: 'Pincode',
                        ),
                      ),
                      const SizedBox(
                        height: 64,
                      ),
                      CustomBtn(
                          title: "Submit",
                          onBtnPressed: () {
                            _addPatientCubit.addNewPatient(
                                _patientDetailModel, _patientAddressModel);
                          },
                          isLoading: state is Loading)
                    ],
                  ),
                ),
              ),
            ));
          },
        ),
      ),
    );
  }
}
