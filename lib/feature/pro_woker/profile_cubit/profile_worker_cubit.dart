import 'package:bloc/bloc.dart';
import 'package:fix/core/services/dio_helper.dart';
import 'package:fix/core/services/services_locator.dart';
import 'package:fix/core/utils/constants/strings.dart';
import 'package:fix/feature/pro_woker/profile_cubit/profile_worker_states.dart';
import 'package:fix/models/End_Points.dart';
import 'package:fix/models/profileModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProfileWorkerCubit extends Cubit<ProfileWorkerState>{

  ProfileWorkerCubit():super(ProfileWorkerInitialState());

 static ProfileWorkerCubit get(context)=> BlocProvider.of(context);

  ProfileModel? profile;
  // DeletePostModel? deletePost;
  // UpdatePostModel? updatePost;

  // ProfileModel? get profile => _profile;

  // Future<void> getProfileIfnotExists() async {
  //   if(_profile == null){
  //     return GetProfilePostsWorker(token: token??'');
  //   }
  //   return;
  // }

  void GetProfilePostsWorker() {
    emit(GetProfilePostWorkerLoadingState());

    sl<DioHelper>().getData(
        url: GETPROFILEPAGE,
        token: Strings.token
    )
        .then((value) {

      profile=ProfileModel.fromJson(value.data);


      emit(GetProfilePostWorkerSuccessState(profile));
    })
        .catchError((error) {

      emit(GetProfilePostWorkerErrorState(error.toString()));
    });
  }

  // void DeletePost({required String postId,required String userId}) {
  //   emit(DeleltePostLoadingState());
  //
  //   DioHelper.postData(
  //       url: DELETEPOST,
  //       token: token,
  //       data: {
  //         'postId':postId,
  //         'userId':userId
  //       })
  //       .then((value) {
  //
  //     deletePost=DeletePostModel.fromJson(value.data);
  //
  //
  //     emit(DeleltePostSuccessState(deletePost));
  //   })
  //       .catchError((error) {
  //
  //     emit(DeleltePostErrorState(error.toString()));
  //   });
  // }
  //
  // void UpdatePost({required String postId,required String userId , String? text , String? image}) {
  //   emit(UpdatePostLoadingState());
  //
  //   DioHelper.postData(
  //       url: UPDATEPOST,
  //       token: token,
  //       data: {
  //         'postId':postId,
  //         'userId':userId
  //       })
  //       .then((value) {
  //
  //     updatePost=UpdatePostModel.fromJson(value.data);
  //
  //
  //     emit(UpdatePostSuccessState(updatePost));
  //   })
  //       .catchError((error) {
  //
  //     emit(UpdatePostErrorState(error.toString()));
  //   });
  // }

}