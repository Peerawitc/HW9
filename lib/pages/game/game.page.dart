import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GamePage extends StatelessWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var num = Random().nextInt(100);
    var iconList = [
      Icon(
        Icons.star_rate, // รูปไอคอน
        size: 20.0, // ขนาดไอคอน
        color: Colors.amberAccent, // สีไอคอน
      ),
      Icon(
        Icons.star_rate, // รูปไอคอน
        size: 20.0, // ขนาดไอคอน
        color: Colors.amberAccent, // สีไอคอน
      ),
      Icon(
        Icons.star_rate, // รูปไอคอน
        size: 20.0, // ขนาดไอคอน
        color: Colors.amberAccent, // สีไอคอน
      ),
      Icon(
        Icons.star_rate, // รูปไอคอน
        size: 20.0, // ขนาดไอคอน
        color: Colors.amberAccent, // สีไอคอน
      ),
      Icon(
        Icons.star_border, // รูปไอคอน
        size: 20.0, // ขนาดไอคอน
        color: Colors.amberAccent, // สีไอคอน
      ),
    ];


    return Scaffold(
      appBar: AppBar(
        title: Text('GUESS THE NUMBER'),
      ),
      body: Container(
        color: Colors.yellow.shade50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Icon(
                  Icons.person, // รูปไอคอน
                  size: 120.0, // ขนาดไอคอน
                  color: Colors.pink.shade500, // สีไอคอน
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "พีรวิชญ์ ชินาวงษ์",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 25.0, color: Colors.black),
                    ),
                    Row(
                      children:
                      iconList
                      ,
                    ),
                  ],
                ),
              ],
            ),
            Text(
              '$num',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 120.0, color: Colors.amber.shade600),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {},
                child: Text('RANDOM'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
