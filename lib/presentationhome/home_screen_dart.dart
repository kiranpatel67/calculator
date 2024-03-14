import 'package:ani/constant/string_constants.dart';
import 'package:ani/newbox/kp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:ani/core/extensions/int_extention.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController valueController = TextEditingController(text: '0');
  double firstValue = 0;
  double secondValue = 0;
  String? operator="";
  String loc1=StringConstant.loc1;
  String loc2= StringConstant.loc2;
  String swap=StringConstant.img_swap;
  @override
  void initState(){
    super.initState();
    swap=loc1;
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("calculator",style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.lightBlue,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(loc1),
              fit: BoxFit.fill,
            ),
          ),
          padding: 16.addPadding(),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: TextField(
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                    controller: valueController,
                    keyboardType: TextInputType.none,
                    textAlign: TextAlign.end,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                    ),
                  ),
                ),),
              SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        numberWidget(context, number: 7),
                        numberWidget(context, number: 8),
                        numberWidget(context,number: 9),
                        numberWidget(context,action: "*"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        numberWidget(context,number: 4),
                        numberWidget(context,number: 5),
                        numberWidget(context,number: 6),
                        numberWidget(context,action:"-"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        numberWidget(context,number: 1),
                        numberWidget(context,number: 2),
                        numberWidget(context,number: 3),
                        numberWidget(context,action: "+"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        numberWidget(context,number: 0),
                        numberWidget(context, action: "AC"),
                        numberWidget(context,action: "/"),
                        numberWidget(context,action: "="),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget numberWidget(BuildContext context, {int? number, String? action}){
    return GestureDetector(
        onTap: (){
            if(valueController.text == "0" && action == null){
              valueController.text = "$number";
            }
            else if(action == null){
            valueController.text = valueController.text + "$number";
          }else{
            switch(action){
              case '+':
                calculation();
                operator = '+';
                break;
              case '*':
                calculation();
                operator = '*';
                break;
              case '/':
                calculation();
                operator = '/';
                break;

              case '-':
                calculation();
                operator = '-';
                break;
              case 'AC':
                calculation();
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>kp()));
                valueController.text='0';
                operator = '-';
                break;
              case '=':
                calculation();
                valueController.text = "$firstValue";
            }
          }
          secondValue = double.tryParse(valueController.text) ?? 0;
        },
          child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
          width: MediaQuery.of(context).size.width * 0.2,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/summer.jpg"),
              fit: BoxFit.fill,
            ),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.black),
          ),
          child: Center(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('${number ?? action}',style: TextStyle(
            fontSize: 25,
           fontWeight: FontWeight.bold,
          ),),
          )),
          ),
          ),
          );
        }

        // function to Calculate
        void calculation() {
      print("-------------------------------------------");
      print("firstValue $firstValue");
      print("secondValue $secondValue");
      print("-------------------------------------------");

      // calculate value based on opeator, then reset value for second and operator
      if(firstValue != 0 && operator != null){
        switch(operator){
          case '+':
            firstValue = firstValue + secondValue;
            break;
          case '-':
            firstValue = firstValue - secondValue;
            break;
        }
        secondValue = 0;
        operator = null;
      }else{
        firstValue = secondValue;
      }
      valueController.text = '';
    }
  }




