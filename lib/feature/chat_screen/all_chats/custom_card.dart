import 'package:fix/component.dart';
import 'package:fix/feature/chat_screen/individual_chat_screen/individual_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CustomCard extends StatelessWidget {
   CustomCard(this.index, {Key? key}) : super(key: key);

  late int index;
  final int i =0;
   // MessageSocketModel? messageSocketModel;
   // List<MessageSocketModel> messages = [];
   @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        navigateTo(context, const IndividualChat( ));
      },
      child: Column(
        children: [
            ListTile(
              leading: const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/defaultUser.png'),
              ),
              title: Text(
                'Mohamed Ahmed',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              subtitle: Row(
                children: [
                  Icon(Icons.done_all,color:  const Color(0xFF7E8181),),
                  SizedBox(width: 3,),
                    Text(
                      'الغسالة بايظة تعالي صلحها',
                      style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 13),
                    )
                ],
              ),
              trailing: Text('١٢:٣٢',
                style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 13,color: Colors.white),) ,
            ),
        ],
      ),
    );
  }
}
