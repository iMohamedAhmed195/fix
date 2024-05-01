
import 'package:fix/component.dart';
import 'package:fix/core/utils/constants/strings.dart';
import 'package:fix/feature/layout/cubit/cubit_layout.dart';
import 'package:fix/feature/layout/cubit/states_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';


class San3aLayout extends StatelessWidget {
 San3aLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<San3aLayoutCubit, San3aLayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = San3aLayoutCubit.get(context);
          final PageStorageBucket bucket = PageStorageBucket();

          String nameAppBar = San3aLayoutCubit.get(context).isArabic1 ? cubit.nameAppArabic[cubit.currentIndex] : cubit.nameAppEnglish[cubit.currentIndex];
          return Scaffold(
              backgroundColor:   San3aLayoutCubit.get(context).isOpen ? Colors.black : Colors.white,
            appBar:cubit.currentIndex==3? defaultAppBar(
                text: nameAppBar,
                func1 : (){},
                func2 :(){},
                icon1:null ,
                icon2:Icons.search

            ): defaultAppBar(
              text: nameAppBar,
              func1 : (){},
              func2 :(){
                if(ZoomDrawer.of(context)!.isOpen()){
                  ZoomDrawer.of(context)!.close();
                }else{ZoomDrawer.of(context)!.open();}
              },
              icon1: Icons.search,
              icon2: Icons.filter_list_alt,

            ),
             body: PageStorage(
              bucket: bucket,
              child:  Strings.role == 'customer' ? cubit.bottomScreens2[cubit.currentIndex]: cubit.bottomScreens1[cubit.currentIndex],

            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                // navigateTo(context, AddScreen());
              },
              child: const Icon(
                Icons.add,
              ),

            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniCenterDocked,
            bottomNavigationBar: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: 10,
              child: SizedBox(
                height: 65.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MaterialButton(
                          minWidth: 40.0,
                          onPressed: () {
                            cubit.currentIndex = 0;
                            cubit.changeBottom(cubit.currentIndex);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.home,
                                color: cubit.currentIndex == 0
                                    ? Colors.blue
                                    : Colors.grey,
                                size: 25.0,
                              ),
                              Text(
                                San3aLayoutCubit.get(context).isArabic1? "الرئيسية":'Home',
                                style: TextStyle(fontSize: 12,
                                    color: cubit.currentIndex == 0
                                        ? Colors.blue
                                        : Colors.grey),
                              )
                            ],
                          ),
                        ),
                        MaterialButton(
                          minWidth: 40.0,
                          onPressed: () {
                            cubit.currentIndex = 1;
                            cubit.changeBottom(cubit.currentIndex);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.notification_add,
                                color: cubit.currentIndex == 1
                                    ? Colors.blue
                                    : Colors.grey,
                                size: 25.0,
                              ),
                              Text(
                                San3aLayoutCubit.get(context).isArabic1? "الاشعارات ":  'Notifi' ,

                                style: TextStyle(fontSize: 12,
                                    color: cubit.currentIndex == 1
                                        ? Colors.blue
                                        : Colors.grey),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MaterialButton(
                          minWidth: 40.0,
                          onPressed: () {
                            cubit.currentIndex = 2;
                            cubit.changeBottom(cubit.currentIndex);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                alignment: AlignmentDirectional.bottomEnd,
                                children: [
                                  Icon(
                                    Icons.chat_outlined,
                                    size: 25.0,
                                    color: cubit.currentIndex == 2
                                        ? Colors.blue
                                        : Colors.grey,
                                  ),
                                  const CircleAvatar(
                                    backgroundColor: Colors.red,
                                    radius: 6,
                                    child: Text(
                                      '5',
                                      style: TextStyle(
                                        fontSize: 10.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                San3aLayoutCubit.get(context).isArabic1? "الدردشة ":  'Chat'  ,

                                style: TextStyle(fontSize: 12,
                                    color: cubit.currentIndex == 2
                                        ? Colors.blue
                                        : Colors.grey),
                              )
                            ],
                          ),
                        ),
                        MaterialButton(
                          minWidth: 40.0,
                          onPressed: () {
                            cubit.currentIndex = 3;
                            cubit.changeBottom(cubit.currentIndex);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.settings,
                                color: cubit.currentIndex == 3
                                    ? Colors.blue
                                    : Colors.grey,
                                size: 25.0,
                              ),
                              Text(San3aLayoutCubit.get(context).isArabic1? "الاعدادات ": 'Setting',
                                  style: TextStyle(fontSize: 12,
                                    color: cubit.currentIndex == 3
                                        ? Colors.blue
                                        : Colors.grey),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      );
  }
}
