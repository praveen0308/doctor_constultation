import 'dart:io';

import 'package:doctor_consultation/models/api/address_model.dart';
import 'package:doctor_consultation/models/api/patient_detail_model.dart';
import 'package:doctor_consultation/models/relation_model.dart';
import 'package:doctor_consultation/res/app_colors.dart';
import 'package:doctor_consultation/res/style_text.dart';
import 'package:doctor_consultation/ui/user/patient/add_patient/add_patient_cubit.dart';
import 'package:doctor_consultation/ui/widgets/btn/btn_outline_tab.dart';
import 'package:doctor_consultation/ui/widgets/btn/custom_btn.dart';
import 'package:doctor_consultation/ui/widgets/custom_dropdown.dart';
import 'package:doctor_consultation/ui/widgets/no_glow_behaviour.dart';
import 'package:doctor_consultation/ui/widgets/view_custom_dropdown.dart';
import 'package:doctor_consultation/util/app_constants.dart';
import 'package:doctor_consultation/util/util_methods.dart';
import 'package:file_picker/file_picker.dart';
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
  final AddressModel _addressModel = AddressModel();


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
            if(state is ProfileAddedSuccessfully){
              showToast("Patient added successfully !!!", ToastType.success);

              _addPatientCubit.close();
              WidgetsBinding.instance!.addPostFrameCallback((_) {
                Navigator.pop(context,true);
              });
            }
            if (state is PatientAddedSuccessfully) {
              if(_addPatientCubit.selectedProfileImage!=null){
                _addPatientCubit.uploadProfileImage();
              }
              else{
                showToast("Patient added successfully !!!", ToastType.success);

                _addPatientCubit.close();
                WidgetsBinding.instance!.addPostFrameCallback((_) {
                  Navigator.pop(context,true);
                });
              }

            }
            return Form(
              key: _addPatientInfoFormKey,
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ScrollConfiguration(
                behavior: NoGlowBehaviour(),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                      GestureDetector(
                        onTap: (){
                          pickFiles();
                        },
                        child: Container(
                          width: 150.0,
                          height: 150.0,
                          decoration: BoxDecoration(
                            color:AppColors.greyLight,
                            shape: BoxShape.circle,
                            image: _addPatientCubit.selectedProfileImage==null ? null : DecorationImage(image: FileImage(_addPatientCubit.selectedProfileImage!),
                              fit: BoxFit.cover,)
                          ),
                          child: const Icon(Icons.add,size: 36,),
                        ),
                      ),

                      const SizedBox(
                        height: 32,
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
                        validator: (String? value){
                          return (value==null || value.isEmpty) ? "Name cannot be empty!" : null;
                        },
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
                        validator: (String? value){
                          return (value==null || value.isEmpty) ? "Age cannot be empty!" : null;
                        },
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
                      /*Container(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            "Address Details",
                            style: AppTextStyle.headline5(),
                          )),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        onChanged: (text) => _addressModel.AddressLine1 = text,
                        onFieldSubmitted: (text) =>
                            _addressModel.AddressLine1 = text,
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
                        onChanged: (text) => _addressModel.City = text,
                        onFieldSubmitted: (text) => _addressModel.City = text,
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
                        onChanged: (text) => _addressModel.State = text,
                        onFieldSubmitted: (text) => _addressModel.State = text,
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
                            _addressModel.PinCode = int.parse(text),
                        onFieldSubmitted: (text) =>
                            _addressModel.PinCode = int.parse(text),
                        keyboardType: TextInputType.number,
                        maxLength: 6,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your pincode',
                          labelText: 'Pincode',
                        ),
                      ),*/
                      const SizedBox(
                        height: 64,
                      ),
                      CustomBtn(
                          title: "Submit",
                          onBtnPressed: () {
                            if(_addPatientInfoFormKey.currentState!.validate()){

                              _addPatientCubit.addNewPatient(_patientDetailModel);
                            }

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


  void pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,

    );

    if (result != null) {
      setState(() {
        _addPatientCubit.selectedProfileImage = File(result.files.single.path!);
      });

      
    } else {
      // User canceled the picker
    }
  }
}
