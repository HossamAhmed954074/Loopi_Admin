
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loopi_admin/features/home/cubits/messages_cubit/cubit/message_cubit.dart';
import 'package:loopi_admin/features/home/models/message_model.dart';



class DriverMessagesList extends StatefulWidget {
  const DriverMessagesList({super.key});

  @override
  State<DriverMessagesList> createState() => _DriverMessagesListState();
}

class _DriverMessagesListState extends State<DriverMessagesList> {
   String? val ='';
  @override
  Widget build(BuildContext context) {
   
    return BlocProvider(
      create: (context) => MessageCubit(),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: 4,
              child: val!.isEmpty ? SizedBox() : MessageScreen(parameter: val ?? ''),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 2,
              child: BlocProvider(
                create: (context) => MessageCubit(),
                child: DriversMessagesListName(
                  messageIndex: (messageindex) {
                    val = messageindex;
                    
                    setState(() {
                      
                    });
                  },
                ),
              ),
            ),

            // Placeholder for driver messages
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class DriversMessagesListName extends StatelessWidget {
  DriversMessagesListName({super.key, required this.messageIndex});
  final Function(String messageindex) messageIndex;

  List<String> messageList = [];

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MessageCubit>(context).getAllDate();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'كل رسائل السائقين',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),

        SizedBox(height: 10),
        Divider(height: 1, color: Colors.grey),
        SizedBox(height: 10),
        // Placeholder for driver messages list
        BlocConsumer<MessageCubit, MessageState>(
          listener: (context, state) {
            if (state is MessageAllDriverSuccess) {
              messageList = state.allDrivermessages;
            }
          },
          builder: (context, state) {
            return Expanded(
              child: ListView.builder(
                itemCount: messageList.length, // Example count
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      messageIndex(messageList[index]);
                      
                      
                    },
                    child: DriverMessageItem(
                      messageDriver: messageList[index],
                     
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}

class DriverMessageItem extends StatelessWidget {
  const DriverMessageItem({
    super.key,
    required this.messageDriver,
  
  });
  final String messageDriver;
 
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(
          Icons.arrow_left_outlined,
          color: Colors.blue,
          size: 30,
        ),
        title: Text(
          messageDriver,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// todo flblfmbflb

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key, required this.parameter});
  final String parameter;
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    // ignore: no_leading_underscores_for_local_identifiers
    final _controller = ScrollController();
    List<MessageModel> messageList = [];
    // todo here add email of driver to get the message
    BlocProvider.of<MessageCubit>(context).getDate(auth: parameter);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(parameter,style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),),
                )
              ],
            ),
          ),
          Expanded(
            child: BlocConsumer<MessageCubit, MessageState>(
              listener: (context, state) {
                if (state is MessageLoaded) {
                  messageList = state.messages;
                }
              },
              builder: (context, state) {
                if (state is MessageLoaded) {
                  return ListView.builder(
                    reverse: true,
                    controller: _controller,
                    physics: BouncingScrollPhysics(),
                    itemCount: messageList.length,
                    itemBuilder: (context, index) =>
                        'admin1@gmail.com' == messageList[index].id
                        ? BubbleChatGet(masseage: messageList[index].message)
                        : BubbleChatPost(masseage: messageList[index].message),
                  );
                }
                return Center(child: Text('Not have message'));
              },
            ),
          ),
          SizedBox(height: 100),
          SendMasseageTextFaildCustomWidget(
            parameter: parameter,
            controller: controller,
            scrollController: _controller,
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class SendMasseageTextFaildCustomWidget extends StatelessWidget {
  SendMasseageTextFaildCustomWidget({
    super.key,
    required this.controller,
    required this.scrollController,
    required this.parameter,
  });
  final ScrollController scrollController;
  final TextEditingController controller;
  final String parameter;
  // final CollectionReference<Object?> messages;
  // ignore: prefer_typing_uninitialized_variables

  String? message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, top: 16, right: 8, left: 8),
      child: TextFormField(
        controller: controller,
        onChanged: (value) {
          message = value;
        },
        decoration: InputDecoration(
          hintText: 'Send Massege',
          suffixIcon: IconButton(
            onPressed: () {
              if (message != null) {
                BlocProvider.of<MessageCubit>(context).postMessageData(
                  message: message!,
                  driverdoc: parameter,
                  auth: 'admin1@gmail.com',
                );
                //todo and here add driver email to post the message
                controller.clear();
                scrollController.animateTo(
                  0,
                  duration: Duration(milliseconds: 200),
                  curve: Curves.fastOutSlowIn,
                );
              }
            },
            icon: Icon(Icons.send, color: Colors.blue),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.blueAccent),
          ),
        ),
      ),
    );
  }
}

class BubbleChatGet extends StatelessWidget {
  BubbleChatGet({required this.masseage, super.key});
  String masseage;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        padding: EdgeInsets.only(top: 14, bottom: 14, right: 10, left: 14),
        decoration: BoxDecoration(
          color: Color(0xff2B475E),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
        child: Text(masseage, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

class BubbleChatPost extends StatelessWidget {
  const BubbleChatPost({required this.masseage, super.key});
  final String masseage;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        padding: EdgeInsets.only(top: 14, bottom: 14, right: 10, left: 14),
        decoration: BoxDecoration(
          color: Color(0xff006D84),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
            bottomLeft: Radius.circular(16),
          ),
        ),
        child: Text(masseage, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
