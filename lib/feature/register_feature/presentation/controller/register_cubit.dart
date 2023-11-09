import 'dart:io';

import 'package:fix/core/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);


  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var phoneController = TextEditingController();
  var dayController = TextEditingController();
  var monthController = TextEditingController();
  var yearController = TextEditingController();
  var cityController = TextEditingController();
  var Nidcontroller = TextEditingController();

  var registerKey = GlobalKey<FormState>();


  final List<String> craftList = [
    "Choose Your Craft",
    "Metalworking",
    "Jewelry",
    "Pottery",
    "Sculpture",
    "Woodworking",
    "Cabinet making",
    "Marquetry",
    "Lacquerware",
    "Wood burning",
    "Wood turningx",
    "Balloon animal",
    "Beadwork",
    "Doll making",
    "Dollhouse construction and furnishing",
    "Egg decorating",
    "Etching",
    "Glassblowing",
    "Lapidary",
    "Mosaics",
    "Stained glass",
    "Toy making",
    "Polymer clay",
  ];

  final ImagePicker picker = ImagePicker();

  File? profileImage;
  XFile? pickedFile;

  Future<void> getImageProfileFromGallery() async {
    pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile!.path);
      emit(ProfileImageSuccessStates());
    } else {
      print('no image selceted');
      emit(ProfileImageErrorStates());
    }
  }

  File? profileImageCa;

  Future<void> getImageProfileFromCamera() async {
    pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      profileImageCa = File(pickedFile!.path);
      emit(ProfileImageSuccessStates());
    } else {
      print('no image selceted');
      emit(ProfileImageErrorStates());
    }
  }

  File? nIDImage;
  XFile? nIDFile;

  Future<void> getImageNIDFromGallery() async {
    nIDFile = await picker.pickImage(source: ImageSource.gallery);

    if (nIDFile != null) {
      nIDImage = File(nIDFile!.path);
      emit(ProfileImageSuccessStates());
    } else {
      print('no image selceted');
      emit(ProfileImageErrorStates());
    }
  }

  File? nIDImageC;

  Future<void> getImageNIDFromCamera() async {
    nIDFile = await picker.pickImage(source: ImageSource.camera);

    if (nIDFile != null) {
      nIDImageC = File(nIDFile!.path);
      emit(ProfileImageSuccessStates());
    } else {
      print('no image selceted');
      emit(ProfileImageErrorStates());
    }
  }

  String phone = "";

  void changePhone(String text){
    phone = text;
    emit(ChangePhoneState());
  }


  String type = "";

  bool isWorker = false;

  String optionValue = "";

  bool isCheckedAgree = false;

  void selectValue(String value) {
    type = value;
    if (type == "worker") {
      isWorker = true;
    } else {
      isWorker = false;
    }
    emit(UserTypeOptionState());
  }

  void changeOption(String selectLevel) async {
    optionValue = selectLevel;

    emit(ChangeOptionState());
  }

  bool isWorkerSelected(UserTypes option) {
    if (option == UserTypes.Worker) {
      return isWorker = true;
    } else {
      return isWorker = false;
    }
  }

  void changeAgreementCheck() {
    isCheckedAgree = !isCheckedAgree;
    emit(AgreementStateDone());
  }
}
