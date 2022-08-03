import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: demo(),
  ));
}

class demo extends StatefulWidget {
  const demo({Key? key}) : super(key: key);

  @override
  State<demo> createState() => _demoState();
}

class _demoState extends State<demo> {


  String p1 = "X";
  String p2 = "O";
  int cnt = 0;
  String w = "Game is Running....";
  int v = 0;

  List<String> l = List.filled(9, "");


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Tic Tac"),
      ),
      body: Column(
        children: [

          Container(

            child: Text(w,

              style: TextStyle(fontSize: 50, color: Colors.black),


            ),


          ),
          Expanded(
              child: Row(
                children: [


                  abc(0),
                  abc(1),
                  abc(2),


                ],
              )),

          Expanded(
              child: Row(
                children: [


                  abc(3),
                  abc(4),
                  abc(5),


                ],
              )),

          Expanded(
              child: Row(
                children: [


                  abc(6),
                  abc(7),
                  abc(8),


                ],
              )),


          ElevatedButton(onPressed: () {
            l = List.filled(9, "");
            cnt = 0;
            v = 0;
            w = "Game is Running....";

            setState(() {

            });
          },


              child: Text("Restart")),

        ],
      ),
    );
  }

  Widget abc(int i) {
    return Expanded(child: InkWell(

      onTap: () {
        if (l[i] == "" && v == 0) {
          if (cnt % 2 == 0) {
            l[i] = p1;
          }
          else {
            l[i] = p2;
          }

          cnt++;
        }
        win();
        setState(() {

        });
      },

      child: Container(

        height: double.infinity,
        color: Colors.blue,
        margin: EdgeInsets.all(30),
        alignment: Alignment.center,

        child: Text(l[i],

          style: TextStyle(fontSize: 100, color: Colors.deepOrange),

        ),

      ),


    ));
  }

  void win() {
    if ((l[0] == p1 && l[1] == p1 && l[2] == p1) ||
        (l[3] == p1 && l[4] == p1 && l[5] == p1) ||
        (l[6] == p1 && l[7] == p1 && l[8] == p1) ||
        (l[0] == p1 && l[3] == p1 && l[6] == p1) ||
        (l[1] == p1 && l[4] == p1 && l[7] == p1) ||
        (l[2] == p1 && l[5] == p1 && l[8] == p1) ||
        (l[0] == p1 && l[4] == p1 && l[8] == p1) ||
        (l[2] == p1 && l[4] == p1 && l[6] == p1)) {
      w = "$p1 is Winner...";
      v = 1;
    }
    else if ((l[0] == p2  && l[1] == p2 && l[2] == p2) ||
             (l[3] == p2  && l[4] == p2 && l[5] == p2) ||
             (l[6] == p2  && l[7] == p2 && l[8] == p2) ||
             (l[0] == p2  && l[3] == p2 && l[6] == p2) ||
             (l[1] == p2  && l[4] == p2 && l[7] == p2) ||
             (l[2] == p2  && l[5] == p2 && l[8] == p2) ||
             (l[0] == p2  && l[4] == p2 && l[8] == p2) ||
             (l[2] == p2  && l[4] == p2 && l[6] == p2)  )
      {
        w = "$p2 is Winner...";
        v = 1;
      }
      else if(cnt == 9)
        {
          w = "Match is Draw..";
        }
  }


}
