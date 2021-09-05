import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Game1 extends StatefulWidget {
  const Game1({Key? key}) : super(key: key);

  @override
  _Game1State createState() => _Game1State();
}

class _Game1State extends State<Game1> {
  var i = 0;
  var list = [1, 2, 3];
  bool showNumber = true;

  _handleclickButton() {
    setState(() {
     i++;
    });
  }

  _resetButton() {
    setState(() {
      showNumber = !showNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: showNumber
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Text(
                    //   i.toString(),
                    //   style: TextStyle(fontSize: 30),
                    // ),
                    for (var item in list)
                      Text(item.toString(), style: TextStyle(fontSize: 30)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: _handleclickButton, child: Text('TEST')),
                        SizedBox(
                          width: 20,
                        ),
                        TextButton(
                            onPressed: _resetButton, child: Text('TEST2')),
                      ],
                    ),
                    Image(
                      image: AssetImage('assets/images/p.jpg'),
                      width:  100.0,
                    )
                  ],
                )
              : null,
        ),
      ),
    );
  }
}
// TextButton(onPressed:  handleclickButton ,  child: Text('TEST')),
// TextButton(onPressed: () {
// setState(() {
// i = i + 1;
// });
// },
// child: Text('TEST')),
// list.map((e) => Text(e.toString())).toList(),
