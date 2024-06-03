
import 'package:fix/core/services/cache_helper.dart';
import 'package:fix/feature/chat_screen/all_chats/chat_screen.dart';
import 'package:fix/feature/layout/cubit/states_layout.dart';
import 'package:fix/feature/layout/menu_screen/menu_screen.dart';
import 'package:fix/feature/layout/notification_screen/notification_screen.dart';
import 'package:fix/feature/timeline/timeline_user/timeline_user.dart';
import 'package:fix/feature/timeline/timeline_worker/timeline_worker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class San3aLayoutCubit extends Cubit<San3aLayoutStates> {
  San3aLayoutCubit() : super(San3aInitialState());
  static San3aLayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> bottomScreens1 = [
    // OpenPost(),
    TimeLineForWorker(),
    NotificationsScreen(),
    ChatScreen(),
    MenuScreen(),
  ];
  List<Widget> bottomScreens2 = [
    // OpenPost(),
    TimeLineForUser(),
    NotificationsScreen(),
    ChatScreen(),
    MenuScreen(),
  ];

  List<String> nameAppEnglish = ['TimeLine', 'Notifications', 'Chats', 'Setting'];
  List<String> nameAppArabic = ['المنشورات', 'الاشعارات', 'المحادثات', 'الاعدادات'];

  void changeBottom(int index) {
    currentIndex = index;
    emit(San3aChangeBootomNavState());
  }

  bool isDark = false;
  bool isOpen = false;


  void changeMode({bool? fromShared,bool? fromShared1})async {
    if(fromShared!=null && fromShared1!=null){
      isDark = fromShared;
      isOpen = fromShared1;


      emit(AppChangeModeState());
    }
    else{
      isDark = !isDark ;
      isOpen = !isOpen;

      print(isDark);
      print(isOpen);


      emit(AppChangeModeState());
      await CacheHelper.saveData(key: 'isDark', value: isDark).then((value) => null);
      await CacheHelper.saveData(key: 'isOpen', value: isOpen).then((value) => null);

    }
  }

  bool isArabic1 = true;
  void changeLang({bool? fromSharedLang})async {
    if(  fromSharedLang !=null){
      isArabic1 = fromSharedLang;

      emit(AppChangeModeState());
    }
    else{
      isArabic1 = !isArabic1;
      print(isArabic1);
      emit(AppChangeModeState());
      await CacheHelper.saveData(key: 'isArabic', value: isArabic1).then((value) => null);
    }
  }
}
