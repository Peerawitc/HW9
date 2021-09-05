import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class locker extends StatelessWidget {

  const locker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(

           child : Column(
             mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                    children: [
                      Icon(Icons.lock_outline, size: 150,color: Colors.grey,),
                      Text(
                        'กรุณาใส่รหัสผ่าน',
                        style: TextStyle(fontSize: 20, color: Colors.red),
                      ),
                    ],
                  ),
              ],
            ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [1,2,3].map((item) => _buildButton4(item)).toList(),

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [_buildButton4(4), _buildButton4(5), _buildButton4(6)],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [_buildButton4(7), _buildButton4(8), _buildButton4(9)],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [_buildButton5(),_buildButton4(0),_buildButton3()],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(onPressed:  () {}, child: Text('ลืมรหัสผ่าน',style:TextStyle(fontSize: 15,color: Colors.red ) ,)),
                )
              ],

            ),
          ],
        ),
      ),
    );
  }
}
// child: Icon(Icons.lock,size: 200),
//Icon(Icons.lock_outline, size: 200),

Widget _buildButton4([int? i]) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: 75.0,
      height: 75.0,
      //color: Colors.white, // ห้ามกำหนด color ตรงนี้ ถ้าหากกำหนดใน BoxDecoration แล้ว
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey, width: 4.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // สีเงา
              offset: Offset(2, 4), // ทิศทางของเงาในแนวนอนและแนวตั้ง ตามลำดับ
              blurRadius: 4.0,
              spreadRadius: 2.0,
            )
          ]),
      child: Center(child: Text("${i}",style: TextStyle(fontSize: 25 ),)),
    ),
  );
}

Widget _buildButton3() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: 75.0,
      height: 75.0,
      //color: Colors.green, // ห้ามกำหนด color ตรงนี้ ถ้าหากกำหนดใน BoxDecoration แล้ว
     child: Icon(Icons.backspace_outlined,size: 35,)
    ),
  );
}
Widget _buildButton5() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
        width: 75.0,
        height: 75.0,
        //color: Colors.green, // ห้ามกำหนด color ตรงนี้ ถ้าหากกำหนดใน BoxDecoration แล้ว

    ),
  );
}