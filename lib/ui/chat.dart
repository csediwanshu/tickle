import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tickle/buttons/send_button.dart';
import 'package:tickle/models/message.dart';
// import 'package:tickle/models/user.dart';
// import 'package:tickle/resources/firebase_provider.dart';
import 'package:tickle/resources/repository.dart';

class Chat extends StatefulWidget{
  final String email;
   final FirebaseUser user ;
  const Chat({Key key,this.email,this.user}):super(key: key);

  _ChatState createState() => _ChatState();
}
class _ChatState extends State<Chat>{

  final Firestore _firestore = Firestore.instance;
  TextEditingController _messageController = TextEditingController();
  ScrollController scrollController = ScrollController();
  _ChatState(){
    initState();
  }
  void initState(){
    super.initState();
    // scrollController.jumpTo(scrollController.position.maxScrollExtent);
    //  scrollController.animateTo(
    //     scrollController.position.maxScrollExtent,
    //     curve: Curves.easeOut,
    //     duration: const Duration(milliseconds: 300),
    //   );
  }
  Widget build(context){
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.orange,
        title: Text('TICKLE Chat'),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0.0,15.0,15.0,0.0),
            child:  Container(
              child: Text('${widget.user.displayName}',style: TextStyle(fontSize: 20.0),),
           ), 
          )  
        ],
      ),
      
      body: SafeArea(  
        child: Column(
          children: <Widget>[
            Expanded(
              child: StreamBuilder(
                stream: _firestore.collection('messages').document(widget.user.email).collection(widget.email).snapshots(),
               builder: (BuildContext context,  snapshot) {
                //  print('${snapshot.data.documents.length}=================hwawaaa');
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                      controller: scrollController,
                      padding: EdgeInsets.all(10.0),
                      itemBuilder: (context, index) => chatMessageItem(snapshot.data.documents[index]),
                      itemCount: snapshot.data.documents.length,
                    );
                  }
                },
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onSubmitted: (value) => callback(),
                      decoration: InputDecoration(
                        hintText: "Enter a Message...",
                        border: const OutlineInputBorder(),
                      ),
                      controller: _messageController,
                    ),
                  ),
                  SendButton(
                    text: "Send",
                    callback: callback,
                  )
                ],
              ),
            ),
          ],
        ),
      )
    );
  }

  Future<void> callback() async {
      var text = _messageController.text;
    print(text);
    Message _message = Message(
        receiverEmail: widget.email,
        senderEmail: widget.user.email,
        message: text,
        type: 'text');
   
    print("receiverUid: ${widget.email} , senderUid : ${widget.user.email} , message: $text");
    print("timestamp: ${DateTime.now().millisecond}, type: ${text != null ? 'text' : 'image'}");

        repository.addMessages(widget.email, _message);
      _messageController.clear();
       scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    }
  
  Widget chatMessageItem(DocumentSnapshot snapshot) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: snapshot['senderEmail'] == widget.user.email? MainAxisAlignment.end: MainAxisAlignment.start,
            children: <Widget>[
              snapshot['senderEmail'] == widget.user.email? senderLayout(snapshot): receiverLayout(snapshot)
            ],
          ),
        )
      ],
    );
  }

  Widget senderLayout(DocumentSnapshot snapshot) {
    return  Container(
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent[100],
              borderRadius: BorderRadius.circular(22.0),
            ),
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(snapshot['message'],style: TextStyle(color: Colors.black, fontSize: 16.0))),
          );
  }

  Widget receiverLayout(DocumentSnapshot snapshot) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.orangeAccent,
          borderRadius: BorderRadius.circular(24.0),
          border: Border.all(color: Colors.grey)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(snapshot['message'],style: TextStyle(color: Colors.black, fontSize: 16.0))     
      ),
    );
  }
}



