import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'components/my_button.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {

  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(userInput.toString(), style: const TextStyle(fontSize: 40, color: Colors.white),),
                        SizedBox(height: 10,),
                        Text(answer.toString(), style: const TextStyle(fontSize: 20, color: Colors.white),),

                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        MyButton(onpress: (){
                         userInput = '';
                         answer = '';
                         setState(() {

                         });
                        }, title: 'AC',),
                        MyButton(onpress: (){
                          userInput += '+/-';
                          setState(() {

                          });
                        }, title: '+/-',),
                        MyButton(onpress: (){
                          userInput += '%';
                          setState(() {

                          });
                        }, title: '%',),
                        MyButton(onpress: (){
                          userInput += '/';
                          setState(() {

                          });
                        }, title: '/', color: Colors.orange,),


                      ],
                    ),
                    Row(
                      children: [
                        MyButton(onpress: (){
                          userInput += '7';
                          setState(() {

                          });
                        }, title: '7',),
                        MyButton(onpress: (){
                          userInput += '8';
                          setState(() {

                          });
                        }, title: '8'),
                        MyButton(onpress: (){
                          userInput += '0';
                          setState(() {

                          });
                        }, title: '0',),
                        MyButton(onpress: (){
                          userInput += 'x';
                          setState(() {

                          });
                        }, title: 'x ', color: Colors.orange,),


                      ],
                    ),
                    Row(
                      children: [
                        MyButton(onpress: (){
                          userInput += '4';
                          setState(() {

                          });
                        }, title: '4',),
                        MyButton(onpress: (){
                          userInput += '5';
                          setState(() {

                          });
                        }, title: '5',),
                        MyButton(onpress: (){
                          userInput += '6';
                          setState(() {

                          });
                        }, title: '6',),
                        MyButton(onpress: (){
                          userInput += '-';
                          setState(() {

                          });
                        }, title: '-', color: Colors.orange,),


                      ],
                    ),
                    Row(
                      children: [
                        MyButton(onpress: (){
                          userInput += '1';
                          setState(() {

                          });
                        }, title: '1',),
                        MyButton(onpress: (){
                          userInput += '2';
                          setState(() {

                          });
                        }, title: '2',),
                        MyButton(onpress: (){
                          userInput += '3';
                          setState(() {

                          });
                        }, title: '3',),
                        MyButton(onpress: (){
                          userInput += '+';
                          setState(() {

                          });
                        }, title: '+', color: Colors.orange,),


                      ],
                    ),
                    Row(
                      children: [
                        MyButton(onpress: (){
                          userInput += '0';
                          setState(() {

                          });
                        }, title: '0',),
                        MyButton(onpress: (){
                          userInput += '.';
                          setState(() {

                          });
                        }, title: '.',),
                        MyButton(onpress: (){
                          userInput = userInput.substring(0, userInput.length -1);
                          setState(() {

                          });
                        }, title: 'DEL',),
                        MyButton(onpress: (){
                          equalPress();
                          setState(() {

                          });
                        }, title: '=', color: Colors.orange,),


                      ],
                    ),
                  ],
                ),
              ),

            ],
          ),
        )
      ),
    );
  }

  void equalPress(){
    String finalUserInput = userInput.replaceAll("x", '*');
    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}
