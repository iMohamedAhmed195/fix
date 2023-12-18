import 'dart:io';

import 'package:fix/core/services/show_toast.dart';
import 'package:fix/core/utils/enums/craft_type.dart';
import 'package:fix/core/utils/enums/user_type.dart';
import 'package:fix/feature/register_feature/domain/use_case/register_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterUseCase registerUseCase;
  RegisterCubit(this.registerUseCase) : super(RegisterInitial());

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();
  final dateController = TextEditingController();
  final cityController = TextEditingController();
  final addressController = TextEditingController();
  final nIdController = TextEditingController();

  var registerKey = GlobalKey<FormState>();

  final ImagePicker picker = ImagePicker();

  File profileImage = File('assets/images/defaultUser.png');
  XFile? pickedFile;

  Future<void> getImageProfileFromGallery() async {
    pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile!.path);
      emit(ProfileImageSuccessStates());
    } else {
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
      emit(ProfileImageErrorStates());
    }
  }

  Future<void> getImageNIDFromCamera() async {
    nIDFile = await picker.pickImage(source: ImageSource.camera);

    if (nIDFile != null) {
      nIDImage = File(nIDFile!.path);
      emit(ProfileImageSuccessStates());
    } else {
      emit(ProfileImageErrorStates());
    }
  }

  UserType? userType;
  CraftType? craftType;

  bool isCheckedAgree = false;

  void selectValue({required UserType? userType}) {
    this.userType = userType;
    emit(ChangeUserTypeOptionState());
  }

  void changeCraftType({required CraftType? craftType}) async {
    this.craftType = craftType;
    emit(ChangeCraftTypeOptionState());
  }

  void changeAgreementCheck() {
    isCheckedAgree = !isCheckedAgree;
    emit(AgreementStateDone());
  }

  void fetchRegister() async {
    emit(RegisterLoadingState());
    final result = await registerUseCase.call(RegisterParameters(
        email: emailController.text,
        role: userType!.value,
        birthDate: dateController.text,
        city: cityController.text,
        nationalId: nIdController.text,
        photo: profileImageCa ?? profileImage,
        idPhoto: nIDImage!,
        address: addressController.text,
        name: nameController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
        phone: phoneController.text));

    result.fold(
        (leftError) =>
            emit(RegisterErrorState(errorMessage: leftError.message)),
        (rightRegisterEntity) {
          print("doneeeeeeeeeeeeeeeee");
          emit(RegisterSuccessState());
        } );
  }

  bool isValidEmail() {
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(emailController.text);
  }

  bool checkPassword() {
    if (confirmPasswordController.text == passwordController.text) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> selectDate(BuildContext context) async {
    emit(SelectDateLoadingState());
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    ).then((value) {
      if (value != null) {
        dateController.text = _formatDate(value);
        emit(SelectDateSuccessState());
      }
    }).catchError((onError) {
      emit(SelectDateErrorState());
    });
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month}-${date.day}';
  }

  DateTime _parseDate(String dateString) {
    return DateTime.parse(dateString);
  }

  bool passwordVisible = false;
  bool confirmPasswordVisible = false;

  changePasswordVisibility() {
    passwordVisible = !passwordVisible;
    emit(ChangePasswordVisibilityState());
  }

  changeConfirmPasswordVisibility() {
    confirmPasswordVisible = !confirmPasswordVisible;
    emit(ChangeConfirmPasswordVisibilityState());
  }

  validateUserTypeAndWorkerCraft() {
    switch (userType) {
      case null:
        showToast(
            text: "Please choose your type as customer or worker",
            state: ToastState.warning);
      case UserType.worker:
        if (craftType != null) {
          fetchRegister();
        } else {
          showToast(
              text: "Please choose your craft type", state: ToastState.warning);
        }
      case UserType.customer:
        fetchRegister();
    }
  }
}
