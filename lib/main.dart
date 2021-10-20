import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';
void main()=>runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: DiceHome(),
));
class DiceHome extends StatefulWidget {
  const DiceHome({Key? key}) : super(key: key);

  @override
  _DiceHomeState createState() => _DiceHomeState();
}

class _DiceHomeState extends State<DiceHome> {
  int leftDice=1,leftScore=0;
  int rightDice=5,rightScore=0;
  var _color=Colors.teal;
  var _textstyle=TextStyle(
    color: Colors.white,
    fontSize: 23,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: _color,
        title: Text("Dice Game",style: _textstyle,),
      ),
      drawer:Drawer(
        child: Container(
          color: Colors.teal,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0,bottom: 10),
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/vk.jpg"),
                  radius: 89,
                ),
              ),
              Text("Vineet Kumar Sharma",style: TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontFamily: "Pacifico",
              ),),
              Text("Flutter Developer",style: TextStyle(
                fontSize: 17,
                color: Colors.teal[100],
                fontFamily: "Anton",
                letterSpacing: 2.3,
              ),),
              SizedBox(
                width: 150,
                child: Divider(
                  color: Colors.teal[100],

                ),
              ),
            ],
          ),
        ),
      ) ,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Player A: $leftScore"),
                  ),
                ),
                Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Player B: $rightScore"),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                        onPressed:()=> changeDice(0),
                        child: Image.asset("assets/dice$leftDice.png",color: _color,)),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: ()=>changeDice(1),
                        child: Image.asset("assets/dice$rightDice.png",color: _color,)),
                  ),
                ),

              ],
            ),
            ElevatedButton(onPressed: (){
              setState(() {
                leftScore=rightScore=0;
                leftDice=rightDice=6;
              });
            }, child: Text("Reset Score"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(_color)
              ),
            )

          ],
        ),
      ),
    );
  }
  void changeDice(int n){
    int right;
    int left;
    if(n==1){
       right = Random().nextInt(5) + 2;
       left = Random().nextInt(6) + 1;
    }
    else{
       left = Random().nextInt(5) + 2;
    right = Random().nextInt(6) + 1;
    };

      Future.delayed(Duration(seconds: 0), () {
        print(" This line is execute after 5 seconds$left");
        setState(() {
          leftDice=left;
          rightDice=right;
          if(left>right)
            leftScore++;
          else
            if(right>left)
            rightScore++;

        });
      });

      // Timer(Duration(seconds: 1), () {
      //   print("Yeah, this line is printed after 3 secondsand i:$left");
      //
      // });
  }
}
