import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'message.dart';

class Chatpage extends StatefulWidget {
  String email;
  Chatpage({Key? key, required this.email}) : super(key: key);
  @override
  _ChatpageState createState() => _ChatpageState(email: email);
}

class _ChatpageState extends State<Chatpage> {
  String email;
  _ChatpageState({required this.email});

  final fs = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final TextEditingController message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[200],
        title:const Text(
          'Chat Room',
        ),
        actions: [
          IconButton(onPressed: (){
              _auth.signOut().whenComplete(() {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>const Home(),
                  ),
                );
              });
          }, icon:const Icon(Icons.logout_rounded))
          
        
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.79,
              child: messages(
                email: email,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: message,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.purple[100],
                      hintText: 'Type a message..',
                      enabled: true,
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.purple),
                        borderRadius:  BorderRadius.circular(10),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: const BorderSide(color: Colors.purple),
                        borderRadius:  BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      return null;
                    },
                    onSaved: (value) {
                      message.text = value!;
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (message.text.isNotEmpty) {
                      fs.collection('Messages').doc().set({
                        'message': message.text.trim(),
                        'time': DateTime.now(),
                        'email': email,
                      });

                      message.clear();
                    }
                  },
                  icon:const Icon(Icons.send_sharp,color: Colors.purple,),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
