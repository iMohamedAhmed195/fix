import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fix/component.dart';
import 'package:fix/feature/chat_screen/all_chats/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: ListView.separated(
          itemBuilder: (context , index)=> Dismissible(
              onDismissed: (direction){
              },
              key: Key(''),
              child: CustomCard(index)),
          separatorBuilder: (BuildContext context, int index)=>Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: myDividor2(),
          ),
          itemCount: 10,

        )
    ) ;
  }
}
