import 'package:fix/component.dart';
import 'package:fix/models/profileModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


enum  _MenuValue{
  Save,
  Report,
}
class OpenPostFromProfileSender extends StatelessWidget {
  OpenPostFromProfileSender(this.index,this.model ,{ Key? key}) : super(key: key);
  ProfileModel? model;
  late int index;

  @override
  Widget build(BuildContext context) {

    return   Scaffold(

      appBar: AppBar(title: Text("Post"),centerTitle: true),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 25,
                        backgroundImage: NetworkImage(
                            model!.data!.userData!.photo!),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  model!.data!.userData!.name!,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  model!.data!.posts![index].date!,
                                  style: Theme.of(context).textTheme.caption,
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  model!.data!.posts![index].job!,
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      PopupMenuButton<String>(
                          icon: const Icon(
                            Icons.more,
                            color: Colors.black,
                          ),
                          itemBuilder: (context) {
                            return [
                              PopupMenuItem(
                                value: "Edit",
                                child: Text("Edit"),
                                padding: EdgeInsets.symmetric(vertical: 10.0 ,horizontal: 10.0),
                                onTap: (){
                                  // TimeLineCubit.get(context).SavePost(postId: model!.data!.posts![index].id!);
                                },
                              ),
                              PopupMenuItem(
                                value: "Delete",
                                child: Text("Delete"),
                                padding: EdgeInsets.symmetric(vertical: 10.0 ,horizontal: 10.0),
                                onTap: (){
                                  print('value');
                                },
                              ),

                            ];
                          }),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: myDividor2(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    flex: 0,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(start: 10.0),
                      child: Text(
                        model!.data!.posts![index].description!,
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(fontSize: 14),
                      ),
                    ),
                  ),
                  if (model!.data!.posts![index].image!.isNotEmpty)
                    if(model!.data!.posts![index].image!.length == 1)
                      Card(
                        elevation: 50.0,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(top: 15.0),
                          child: Container(
                              height: 200.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          model!.data!.posts![index].image![0])))),
                        ),
                      ),
                  const SizedBox(
                    height: 10,
                  ),
                  if(model!.data!.posts![index].image!.length > 1)
                    Column(
                      children:<Widget> [
                           Container(
                             //height: 400,
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context , index1){
                                return Card(
                                  elevation: 50.0,
                                  child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Image(image: NetworkImage('${model!.data!.posts![index].image![index1]}'),fit: BoxFit.fill,),
                              ),
                                );},
                              itemCount: model!.data!.posts![index].image!.length,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:1 ),
                            ),
                          ),

                      ],
                    ),
                  if (model!.data!.posts![index].image!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: myDividor2(),
                    ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
    defaultButtonWithIcon(
    icon: Icons.send,
    background: Colors.blue,
    text: 'Send Message',
    function: () async {
    // await ChatCubit.get(context).GetChatsFromPost(
    // idUser: model!.data!.userData!.id!);
    //
    // navigateTo(context, IndividualChatFromUserSendWorker(TimeLineUserCubit.get(context).profileSendTo));
    },
    width: 120.0,
    radius: 30.0,
    height: 30.0,
    )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
