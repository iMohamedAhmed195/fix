import 'dart:convert';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fix/component.dart';
import 'package:fix/feature/layout/cubit/cubit_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

class IndividualChat extends StatefulWidget {
  const IndividualChat({super.key});

  @override
  State<IndividualChat> createState() =>
      _IndividualChatState();
}

class _IndividualChatState extends State<IndividualChat> {
  _IndividualChatState();
  bool sendButton = false;
  bool isSocket = false;
  ScrollController scrollController = new ScrollController();
  ImagePicker _Picker = ImagePicker();
  XFile? file;
  int popTime = 0;
//   MessageSocketModel? messageSocketModel;
//   late String chatId;
//
//   late int index;
//   int indexMessage = 0;
  TextEditingController messageController = TextEditingController();
//   IO.Socket? socket;
//
//   late List<MessageSocketModel> messages = [];
//
//   @override
//   void initState() {
//     connectSocket();
//
//
//     // TODO: implement initState
//     super.initState();
//   }
//
//   void connectSocket() {
//     socket = IO.io(
//         'https://san3aapp.onrender.com',
//         OptionBuilder().setTransports(['websocket']) // for Flutter or Dart VM
//             .setExtraHeaders({'foo': 'bar'}) // optional
//             .build());
//     socket!.connect();
//
//     socket!.onConnect((_) {
//
//       socket!.emit("join", chatId);
//     });
//
//     socket!.on('res', (data) {
//
//       setMessage("receiver", data["content"], data["time"]);
//       scrollController.animateTo(scrollController.position.maxScrollExtent,
//           duration: Duration(milliseconds: 300), curve: Curves.easeOut);
//     });
//   }
//
//   void setMessage(String type, String message, String time) {
//     messageSocketModel =
//         MessageSocketModel(type: type, message: message, time: time);
//     setState(() {
//       messages
//           .add(messageSocketModel!);
//       print("Hello ${messages.length}");
//     });
//   }
//
//   void sendMessage(String message) {
//
//     socket!.emit("msg", {
//       "content": message,
//       "chat": chatId,
//       "time": DateTime.now().toString().substring(10, 16)
//     });
//
//     setMessage("sender", message, DateTime.now().toString().substring(10, 16));
// ;
//   }

  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 75,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 5,
              ),
              const Icon(
                Icons.arrow_back_outlined,
                color: Colors.black,
                size: 24,
              ),
              const SizedBox(
                width: 5,
              ),
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/defaultUser.png'),
                ),
            ],
          ),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Text(
                'Mohamed Ahmed',
                style: const TextStyle(
                    fontSize: 18.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            Text(
              San3aLayoutCubit.get(context).isArabic1?"آخر ظهور اليوم الساعة 12:30": 'last seen today at 12:30',
              style: TextStyle(fontSize: 13, color: Colors.black),
            ),
          ],
        ),
        actions: [
          PopupMenuButton<String>(
              icon: const Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
              itemBuilder: (context) {
                return  [
                  PopupMenuItem(
                    value: San3aLayoutCubit.get(context).isArabic1?"عرض الصفحة الشخصية":  "View Profile",

                    child: Text(San3aLayoutCubit.get(context).isArabic1?"عرض الصفحة الشخصية":  "View Profile",),
                  ),
                  PopupMenuItem(
                    value:San3aLayoutCubit.get(context).isArabic1?"الوسائط والروابط والمستندات": "Media,links,and docs",
                    child: Text(San3aLayoutCubit.get(context).isArabic1?"الوسائط والروابط والمستندات": "Media,links,and docs",),
                  ),
                  PopupMenuItem(
                    value: San3aLayoutCubit.get(context).isArabic1?"كتم صوت الاشعارات": "Mute Notification",
                    child: Text(San3aLayoutCubit.get(context).isArabic1?"كتم صوت الاشعارات": "Mute Notification",),
                  ),
                ];
              }),
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: ConditionalBuilder(
                  condition: true  ,
                  builder: (context) {
                    return ListView.builder(
                      controller: scrollController,
                      itemBuilder: (context, index) {
                        if (index%2==0) {
                          return OwnMessageSocketCard(index);

                        } else if (index%2==1) {
                          return ReplyMessageSocketCard(index);

                        }
                      },
                      itemCount: 30,
                    );
                  },
                  fallback: (context) =>
                      Center(child: CircularProgressIndicator())),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 70,
                color: Colors.transparent,
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 60,
                      height: 50,
                      child: Card(
                          margin: const EdgeInsets.only(
                              left: 2, right: 2, bottom: 8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          child: TextFormField(
                            keyboardType: TextInputType.multiline,
                            controller: messageController,
                            maxLines: 3,
                            minLines: 1,
                            onChanged: (value) {
                              if (value.length > 0) {
                                setState(() {
                                  sendButton = true;
                                });
                              } else {
                                setState(() {
                                  sendButton = false;
                                });
                              }
                            },
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: San3aLayoutCubit.get(context).isArabic1?"اكتب رسالتك":"Type a Message",
                                hintStyle: const TextStyle(fontSize: 15),
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      width: 30,
                                      child: IconButton(
                                        onPressed: () {
                                          showModalBottomSheet(
                                              backgroundColor:
                                              Colors.transparent,
                                              context: context,
                                              builder: (builder) =>
                                                  bottomSheet());
                                        },
                                        icon:
                                        const Icon(Icons.attach_file),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 50,
                                      child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            popTime = 2;
                                          });
                                          // navigateTo(
                                          //     context,
                                          //     const CameraScreen(
                                          //       // onImageSend: onImageSend
                                          //     ));
                                        },
                                        icon:
                                        const Icon(Icons.camera_alt),
                                      ),
                                    ),
                                  ],
                                ),
                                contentPadding:
                                const EdgeInsetsDirectional.only(
                                    start: 20, end: 20)),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 8, right: 5, left: 2),
                      child: CircleAvatar(
                        radius: 25,
                        child: IconButton(
                          onPressed: () {
                            // if (sendButton) {
                            //   scrollController.animateTo(
                            //       scrollController
                            //           .position.maxScrollExtent,
                            //       duration:
                            //       const Duration(milliseconds: 300),
                            //       curve: Curves.easeOut);
                            //
                            //   Cubit.PostMessageChats(content: messageController.text);
                            //   sendMessage(messageController.text);
                            //   messageController.clear();
                            //   isSocket = true;
                            //   setState(() {
                            //     sendButton = false;
                            //   });
                            // }
                          },
                          icon: Icon(sendButton ? Icons.send : Icons.mic),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget attach(Function() function, IconData icon, Color color, String text) {
    return InkWell(
      child: Column(
        children: [
          CircleAvatar(
              backgroundColor: color,
              radius: 30,
              child: IconButton(
                  onPressed: function,
                  icon: Icon(icon, size: 29, color: Colors.white))

              // ,

              ),
          const SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget bottomSheet() {
    return SizedBox(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  attach(() {}, Icons.insert_drive_file, Colors.indigo,
                      San3aLayoutCubit.get(context).isArabic1?"المستندات": 'Document'),
                  const SizedBox(
                    width: 40.0,
                  ),
                  attach(() {
                    setState(() {
                      popTime = 3;
                    });
                    // navigateTo(
                    //     context,
                    //     const CameraScreen(
                    //         // onImageSend: onImageSend
                    //         ));
                  }, Icons.camera_alt, Colors.pink,  San3aLayoutCubit.get(context).isArabic1?"الكاميرا":'Camera'),
                  const SizedBox(
                    width: 40.0,
                  ),
                  attach(() async {
                    // XFile? file = await _Picker.pickImage(source: ImageSource.gallery);
                    setState(() {
                      popTime = 2;
                    });
                    XFile? file =
                        await _Picker.pickImage(source: ImageSource.gallery);
                    // navigateTo(context, CameraViewPage(path: file!.path,onImageSend: onImageSend,));
                  }, Icons.insert_photo, Colors.purple,  San3aLayoutCubit.get(context).isArabic1?"الصور":'Photo'),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  attach(() {}, Icons.headset, Colors.orange,  San3aLayoutCubit.get(context).isArabic1?"المقاطع الصوتية":'Audio'),
                  const SizedBox(
                    width: 40.0,
                  ),
                  attach(() {
                    // navigateTo(context, MapsScreen());
                  }, Icons.location_pin, Colors.teal, San3aLayoutCubit.get(context).isArabic1?"الموقع":'Location'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget OwnMessageSocketCard(index) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width - 225,
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child: Container(
          child: Card(
            elevation: 1,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: Color(0xffdcf8c6),
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 60, top: 10, bottom: 20),
                  child: Text(
                    'ممكن حضرتك تيجي تخلصلي التلاجة عشان مستعجل',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Positioned(
                  bottom: 4,
                  right: 10,
                  child: Row(
                    children: [
                      Text(
                        '١٢:٤٨',
                        style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.done_all,
                        size: 20,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget ReplyMessageSocketCard(index) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: Color(0xffE9EBECFF),
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Stack(
            children: [
              Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 60, top: 10, bottom: 20),
                  child: Text(
                    'تمام هخلصهم تمام',
                    style: TextStyle(fontSize: 16),
                  )),
              Positioned(
                bottom: 4,
                right: 10,
                child: Text(
                  '٠٥:٣٠',
                  style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}
