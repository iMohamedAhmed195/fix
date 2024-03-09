
import 'package:fix/core/services/dio_helper.dart';
import 'package:fix/core/services/services_locator.dart';
import 'package:fix/core/utils/constants/strings.dart';
import 'package:fix/models/End_Points.dart';
import 'package:fix/models/profileModel.dart';
import 'package:fix/models/timeline_user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'timeline_user_state.dart';

class TimeLineUserCubit extends Cubit<TimeLineUserState> {
  TimeLineUserCubit() : super(InitialGetWorkerState());

  static TimeLineUserCubit get(context) => BlocProvider.of(context);
  WorkerTimeLineModel?  getDataWorker;
  ProfileModel? profileSendTo;

  void goToProfilePerson(String? uId) {
    emit(GoToProfileWorkerLoadingState());
    sl<DioHelper>().postData(
        url: GOTOPROFILEPERSON,
        data: {
          "usId":uId
        })
        .then((value) {
         print('ana kddddddddddddddddda wdet 1');
      profileSendTo= ProfileModel.fromJson(value.data);
      print(profileSendTo!.data!.userData!.name);
      print(profileSendTo!.data!.userData!.photo);
      print(profileSendTo!.data!.userData!.name);
         print('ana kddddddddddddddddda wdet 2');
      emit(GoToProfileWorkerSuccessState(profileSendTo));
         print('ana kddddddddddddddddda wdet 2');
    })
        .catchError((error) {
      print('ana kddddddddddddddddda error 3');
      emit(GoToProfileWorkerErrorState(error.toString()));
    });
  }

  void GetDataWorker() {
    emit(GetWorkerLoadingState());

    sl<DioHelper>().getData(
        url: GETWORKER,
        token: Strings.token
    ).then((value) {
      getDataWorker = WorkerTimeLineModel.fromJson(value.data);

      emit(GetWorkerSuccessState(getDataWorker));
    }).catchError((error) {
      emit(GetWorkerErrorState(error.toString()));
    });
  }

  // void goToProfilePerson(index) {
  //   emit(GoToProfilePersonLoadingState());
  //   DioHelper.postData(
  //       url: GOTOPROFILEPERSON,
  //       data: {
  //         "usId": getPost!.postData![index].userDataPost!.id
  //       })
  //       .then((value) {
  //     getProfileSender= WorkerSendUser.fromJson(value.data);
  //     emit(GoToProfilePersonSuccessState(getProfileSender));
  //   })
  //       .catchError((error) {
  //     emit(GoToProfilePersonErrorState(error.toString()));
  //   });
  // }

  // void SavePost({required String postId}) {
  //   DioHelper.postData(
  //       url: SAVEPOST,
  //       data: {
  //         "postId":postId
  //       })
  //       .then((value) {
  //     saved= SavedPostFromTimeLineModel.fromJson(value.data);
  //     emit(SavePostSuccessState(saved));
  //   })
  //       .catchError((error) {
  //     emit(SavePostErrorState(error.toString()));
  //   });
  // }
}
