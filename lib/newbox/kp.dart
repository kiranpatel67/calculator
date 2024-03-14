import 'package:ani/core/extensions/string_extension.dart';
import 'package:flutter/material.dart';

class kp extends StatefulWidget {
  const kp({super.key});

  @override
  State<kp> createState() => _kpState();
}

class _kpState extends State<kp> {
  final TextEditingController valueControler1 = TextEditingController(text: "Enter your first equation: ");
  final regex= "xy".keepOnlyText();
  // final TextEditingController valueControler2= TextEditingController(text: "Enter your second equation: ");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
        title: Text("Scientific calculator",style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold
        ),
        ),
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop;
        },icon: Icon(Icons.assistant_direction),),
      ),
      body: SafeArea(
       child: Container(
         child: Column(
           children: [SizedBox(
             height: MediaQuery.of(context).size.height * 0.25,
             child: Align(
               alignment: Alignment.center,
               child: TextField(

                  controller: valueControler1,
                 textAlign: TextAlign.end,
                 decoration: InputDecoration(
               labelText: "Eq1",
                    border: UnderlineInputBorder(),
                   fillColor: Color(0x455B5BFC),


                 ),
               ),
             ),
           ),


    ElevatedButton(
               
               onPressed: () {

                 if(valueControler1.text.contains((regex)) ){
                   printfn("true");
                 }
                 else{
                   printfn("false");
                 }
               },
               child: Text('Looks like a RaisedButton'),
             )

           ]),

       ),
      ),
    );
  }
}

void printfn(arg){
  print(arg);
}