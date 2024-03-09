
import 'package:fix/core/services/dio_helper.dart';
import 'package:fix/core/services/services_locator.dart';
import 'package:fix/core/utils/constants/strings.dart';
import 'package:fix/feature/timeline/timeline_worker/timeline_cubit/timeLine_states.dart';
import 'package:fix/models/End_Points.dart';
import 'package:fix/models/WorkerSendUserModel.dart';
import 'package:fix/models/post_model.dart';
import 'package:fix/models/save_post_from_timeLine_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class TimeLineCubit extends Cubit<TimeLineState> {
  TimeLineCubit() : super(InitialPostState());

  static TimeLineCubit get(context) => BlocProvider.of(context);
  PostModel? getPost;
  WorkerSendUser? getProfileSender;
  SavedPostFromTimeLineModel? saved;
  void GetPosts() {
    emit(GetPostLoadingState());

    sl<DioHelper>().getData(url: GETPOSTS, token: Strings.token).then((value) {
      getPost = PostModel.fromJson(value.data);

      emit(GetPostSuccessState(getPost));
    }).catchError((error) {
      emit(GetPostErrorState(error.toString()));
    });
  }

  void goToProfilePerson(index) {
    emit(GoToProfilePersonLoadingState());
    sl<DioHelper>().postData(
        url: GOTOPROFILEPERSON,
        data: {
          "usId": getPost!.postData![index].userDataPost!.id
        })
        .then((value) {
      getProfileSender= WorkerSendUser.fromJson(value.data);
      emit(GoToProfilePersonSuccessState(getProfileSender));
    })
        .catchError((error) {
      emit(GoToProfilePersonErrorState(error.toString()));
    });
  }

  void SavePost({required String postId}) {
    sl<DioHelper>().postData(
        url: SAVEPOST,
        data: {
          "postId":postId
        })
        .then((value) {
      saved= SavedPostFromTimeLineModel.fromJson(value.data);
      emit(SavePostSuccessState(saved));
    })
        .catchError((error) {
      emit(SavePostErrorState(error.toString()));
    });
  }
}
