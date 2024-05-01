
import 'package:fix/models/profileModel.dart';


abstract class ProfileWorkerState {}

class ProfileWorkerInitialState extends ProfileWorkerState{}

class GetProfilePostWorkerLoadingState extends ProfileWorkerState{}
class GetProfilePostWorkerSuccessState extends ProfileWorkerState{
  ProfileModel? getProfile;
  GetProfilePostWorkerSuccessState(this.getProfile);
}
class GetProfilePostWorkerErrorState extends ProfileWorkerState {
  final String error;

  GetProfilePostWorkerErrorState(this.error);
}

// class DeleltePostLoadingState extends ProfileWorkerState{}
// class DeleltePostSuccessState extends ProfileWorkerState{
//   DeletePostModel? deletePost;
//   DeleltePostSuccessState(this.deletePost);
// }
// class DeleltePostErrorState extends ProfileWorkerState {
//   final String error;
//
//   DeleltePostErrorState(this.error);
// }
// class UpdatePostLoadingState extends ProfileWorkerState{}
// class UpdatePostSuccessState extends ProfileWorkerState{
//   UpdatePostModel? updatePost;
//   UpdatePostSuccessState(this.updatePost);
// }
// class UpdatePostErrorState extends ProfileWorkerState {
//   final String error;
//
//   UpdatePostErrorState(this.error);
// }