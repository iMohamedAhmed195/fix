import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fix/component.dart';
import 'package:fix/feature/chat_screen/individual_chat_screen/individual_chat.dart';
import 'package:fix/feature/timeline/timeline_worker/timeline_cubit/timeLine_cubit.dart';
import 'package:fix/feature/timeline/timeline_worker/timeline_cubit/timeLine_states.dart';
import 'package:fix/models/WorkerSendUserModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProUser extends StatelessWidget {
    ProUser( this.index, this.index1,{Key? key,  getProfileSender}) : super(key: key);
   late  int index ;
   late  String index1 ;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => TimeLineCubit()..goToProfilePerson(index1),
  child: BlocConsumer<TimeLineCubit, TimeLineState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {

    return    Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFfafafa),
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon:const Icon(Icons.arrow_back,color: Colors.black,),),
        title: const Text('Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { },
        child: const Icon(Icons.edit),
      ),
      body: ConditionalBuilder(
        condition: state is GoToProfilePersonSuccessState ,
        builder: (context)=>SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 120.0,
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: 50.0,
                            backgroundImage: NetworkImage(TimeLineCubit.get(context).getProfileSender!.data!.userData!.photo!),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                TimeLineCubit.get(context).getProfileSender!.data!.userData!.name!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Color(0xffe59819),
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Color(0xffe59819),
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Color(0xffe59819),
                                  ),
                                  Icon(
                                    Icons.star_border,
                                    color: Color(0xffe59819),
                                  ),
                                  Icon(
                                    Icons.star_border,
                                    color: Color(0xffe59819),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5,),
                              Container(
                                width: 115
                                ,
                                height: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.blue,
                                ),
                                child: MaterialButton(
                                  onPressed: ()async{
                                    navigateTo(context, const IndividualChat());
                                  },
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          'Send Message',
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),

                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                     Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Text(
                            TimeLineCubit.get(context).getProfileSender!.data!.userData!.bio ??'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae elementum nulla, at ornare est',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 12.0),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                     Column(
                      children: [
                        const Row(
                          children: [
                            Text('Details',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    letterSpacing: 2.0,
                                    fontSize: 18)),
                          ],
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          children: [
                            const Row(
                              children: [
                                Icon(Icons.home),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text('Lives in',
                                    style: TextStyle(color: Colors.black, fontSize: 18)),
                              ],
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Row(
                              children: [
                                Text(TimeLineCubit.get(context).getProfileSender!.data!.userData!.city ??'AlHaram street',
                                    style: const TextStyle(
                                      color: Colors.black,
                                    )),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                         Row(
                          children: [
                            const Row(
                              children: [
                                Icon(Icons.add_location_alt_sharp),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text('From',
                                    style: TextStyle(color: Colors.black, fontSize: 18)),
                              ],
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Row(
                              children: [
                                Text(TimeLineCubit.get(context).getProfileSender!.data!.userData!.countryCode ??'Giza',
                                    style: const TextStyle(
                                      color: Colors.black,
                                    )),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                      ],
                    ),

                  ],
                ),
              ),
              ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context,index){
                    this.index= index;
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProfilePostWorkerSendUserItem(TimeLineCubit.get(context).getProfileSender!,context , index),
                    );},
                  separatorBuilder: (context,index)=>const SizedBox(height: 10,),
                  itemCount: TimeLineCubit.get(context).getProfileSender!.data!.posts!.length),
            ],
          ),
        ),
        fallback:(context)=> const Center(child: CircularProgressIndicator()),
      ),
    ) ;
  },
),
);
  }
}
