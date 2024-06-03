import 'dart:ui';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:conditional_builder_null_safety/example/example.dart';
import 'package:fix/component.dart';
import 'package:fix/core/utils/constants/strings.dart';
import 'package:fix/feature/layout/cubit/cubit_layout.dart';
import 'package:fix/feature/layout/cubit/states_layout.dart';
import 'package:fix/feature/login_feature/presentation/controller/login_cubit.dart';
import 'package:fix/feature/pro_woker/pro_worker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuState();
}

class _MenuState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<San3aLayoutCubit, San3aLayoutStates>(
      listener: (context, state) {
    // TODO: implement listener
      },
      builder: (context, state) {
    return Scaffold(
      backgroundColor:   San3aLayoutCubit.get(context).isOpen ? Colors.black : Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: ListView(
            children: [
              Column(
                children: [
                  ConditionalBuilder(
                      condition: true,
                      builder: (context) => Column(
                            children: [
                              const SizedBox(height: 30),
                              SizedBox(
                                  height: 100.0,
                                  width: 100.0,
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        Strings.image ),
                                  )),
                              const SizedBox(height: 5),
                              Text(
                                Strings.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.dark_mode_outlined,
                                      size: 40,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16.0),
                                      child: Text(
                                        San3aLayoutCubit.get(context).isArabic1? 'الوضع الداكن': 'Dark Mode',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 20.0),
                                      child: FlutterSwitch(
                                        width: 50.0,
                                        height: 25.0,
                                        toggleSize: 20.0,
                                        value: San3aLayoutCubit.get(context)
                                            .isOpen,
                                        borderRadius: 30.0,
                                        padding: 1.0,
                                        onToggle: (val) {
                                          San3aLayoutCubit.get(context)
                                              .changeMode();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              MenuPage(
                                  fun: () {
                                    navigateTo(context, const ProWorker());
                                  },
                                  color: Colors.orange,
                                  icon: Icons.camera_alt_outlined,
                                  text: San3aLayoutCubit.get(context).isArabic1
                                      ? 'الصفحة الشخصية'
                                      : 'Profile',
                                  context: context),
                              San3aLayoutCubit.get(context).isOpen
                                  ? myDivider()
                                  : myDividor2(),
                              MenuPage(
                                  fun: () {},
                                  color: Colors.blue,
                                  icon: Icons.save_outlined,
                                  text: San3aLayoutCubit.get(context).isArabic1
                                      ? "المنشورات المحفوظة"
                                      : 'Saved Posts',
                                  context: context),
                              if (Strings.role != 'customer')
                                San3aLayoutCubit.get(context).isOpen
                                    ? myDivider()
                                    : myDividor2(),
                              if (Strings.role != 'customer')
                                MenuPage(
                                    color: Colors.pink,
                                    icon: Icons.payments_outlined,
                                    text:
                                        San3aLayoutCubit.get(context).isArabic1
                                            ? 'الدفع'
                                            : 'Payment',
                                    fun: () {},
                                    context: context),
                              if (Strings.role != 'customer')
                                San3aLayoutCubit.get(context).isOpen
                                    ? myDivider()
                                    : myDividor2(),
                              MenuPage(
                                  color: Colors.purple,
                                  icon: Icons.edit_note_outlined,
                                  text: San3aLayoutCubit.get(context).isArabic1
                                      ? "تعديل الحساب"
                                      : 'Edit Profile',
                                  fun: () {},
                                  context: context),
                              San3aLayoutCubit.get(context).isOpen
                                  ? myDivider()
                                  : myDividor2(),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16.0),
                                      child: Text(
                                        San3aLayoutCubit.get(context).isArabic1
                                            ? 'اللغة'
                                            : 'Language',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const Spacer(),
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(right: 16.0),
                                        child: IconButton(
                                          icon: const Icon(Icons.language),
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return BackdropFilter(
                                                    filter: ImageFilter.blur(
                                                        sigmaX: 6, sigmaY: 6),
                                                    child: AlertDialog(
                                                      insetPadding:
                                                          const EdgeInsets.all(10),
                                                      title: Text(San3aLayoutCubit
                                                                  .get(context)
                                                              .isArabic1
                                                          ? 'تغيير اللغة'
                                                          : " Change Language"),
                                                      actions: <Widget>[
                                                        Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(14),
                                                          child: Row(
                                                            children: [
                                                              TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    San3aLayoutCubit.get(context).changeLang();
                                                                    Navigator.pop(context);
                                                                  },
                                                                  child: Text(San3aLayoutCubit.get(
                                                                              context)
                                                                          .isArabic1
                                                                      ? "الغة العربية"
                                                                      : "Arabic")),
                                                              const Spacer(),
                                                              TextButton(
                                                                  onPressed:
                                                                      () {
                                                                    San3aLayoutCubit.get(context).changeLang();
                                                                    Navigator.pop(context);
                                                                  },
                                                                  child: Text(San3aLayoutCubit.get(
                                                                              context)
                                                                          .isArabic1
                                                                      ? "اللغة الانجليزية"
                                                                      : "English")),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                });
                                          },
                                        )),
                                  ],
                                ),
                              ),
                              San3aLayoutCubit.get(context).isOpen
                                  ? myDivider()
                                  : myDividor2(),
                              MenuPage(
                                  color: Colors.teal,
                                  icon: Icons.help_outline_outlined,
                                  text: San3aLayoutCubit.get(context).isArabic1
                                      ? "المساعدة"
                                      : 'Help',
                                  fun: () {},
                                  context: context),
                              San3aLayoutCubit.get(context).isOpen
                                  ? myDivider()
                                  : myDividor2(),
                              MenuPage(
                                  color: Colors.red,
                                  icon: Icons.logout,
                                  text: San3aLayoutCubit.get(context).isArabic1
                                      ? "تسجيل الخروج"
                                      : 'LogOut',
                                  fun: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return BackdropFilter(
                                            filter: ImageFilter.blur(
                                                sigmaY: 6, sigmaX: 6),
                                            child: AlertDialog(
                                              title: Row(
                                                children: [
                                                  Text(San3aLayoutCubit.get(
                                                              context)
                                                          .isArabic1
                                                      ? "تسجيل الخروج"
                                                      : 'LogOut'),
                                                  const SizedBox(
                                                    height: 15,
                                                  ),
                                                  const Icon(
                                                    Icons.logout,
                                                    size: 20,
                                                  )
                                                ],
                                              ),
                                              content: Text(
                                                  San3aLayoutCubit.get(context)
                                                          .isArabic1
                                                      ? "هل أنت متأكد ؟"
                                                      : "Are you sure ?"),
                                              actions: <Widget>[
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      TextButton(
                                                          onPressed: () {},
                                                          child: Text(
                                                              San3aLayoutCubit.get(
                                                                          context)
                                                                      .isArabic1
                                                                  ? "لا"
                                                                  : "No")),
                                                      const Spacer(),
                                                      TextButton(
                                                          onPressed: () {},
                                                          child: Text(
                                                              San3aLayoutCubit.get(
                                                                          context)
                                                                      .isArabic1
                                                                  ? "نعم"
                                                                  : "Yes")),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        });
                                  },
                                  context: context),
                            ],
                          ),
                      fallback: (context) =>
                          const Center(child: CircularProgressIndicator()))
                ],
              ),
            ],
          ),
        ),
      ),
    );
      },
    );
  }
}
