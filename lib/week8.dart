import 'package:flutter/material.dart';

class GAME20 extends StatefulWidget {
  const GAME20({Key? key}) : super(key: key);

  @override
  _GAME20State createState() => _GAME20State();
}

class _GAME20State extends State<GAME20> {
  int c = 0;
  var starbouder = 20;
  bool Red = false;
  bool Blue = true;
  bool checkwin = true;
  _count(int d, int round) {
    setState(() {
      c += d;
      if (round == 1) {
        Red = false;
        Blue = true;
      }
      if (round == 2) {
        Red = true;
        Blue = false;
      }
      if (c >= 20) {
        c = 20;

        checkwin = false;
      }
      ;
    });
  }

  _reset() {
    setState(() {
      Red = false;
      Blue = true;
      checkwin = true;
      c = 0;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            image: const DecorationImage(
              image: const AssetImage("assets/images/bg.jpg"),
              fit: BoxFit
                  .fill, // ยืดเต็มพื้นที่โดยไม่สนใจสัดส่วนของภาพ หรือใช้ BoxFit.cover เพื่อยืดให้เต็มและคงสัดส่วนของภาพไว้ แต่บางส่วนของภาพอาจถูก crop
            ),
          ),
          child: SafeArea(
            // ไม่ให้ layout ไปอยู่ตรงส่วน status bar หรือ notch
            child: Container(
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int i = 3; i >= 1; --i)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed:
                                  Red && checkwin ? () => _count(i, 1) : null,
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.red,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 40.0, vertical: 10.0)),
                              child: Text(
                                i.toString(),
                                style: TextStyle(fontSize: 40.0),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      if (checkwin == true)
                        Column(
                          children: [
                            for (int k = 0; k < c; k++)
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Icon(
                                  Icons.star_outlined,
                                  color: Colors.purple,
                                ),
                              ),
                            for (int i = 0; i < starbouder - c; i++)
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Icon(
                                  Icons.star_border_outlined,
                                  color: Colors.purple,
                                ),
                              )
                          ],
                        ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (checkwin == true)
                              Column(
                                children: [
                                  Icon(
                                    Icons.keyboard_arrow_up,
                                    size: 50,
                                    color: Red && checkwin
                                        ? Colors.black
                                        : Colors.black.withAlpha(40),
                                  ),
                                  Text(
                                    c.toString(),
                                    style: TextStyle(fontSize: 100),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 50,
                                    color: Blue && checkwin
                                        ? Colors.black
                                        : Colors.black.withAlpha(40),
                                  ),
                                ],
                              )
                            else
                              Column(
                                children: [
                                  if (Red)
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "RED \n Win !",
                                          style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  if (Blue)
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "BLUE \n Win !",
                                          style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  TextButton(
                                      onPressed: _reset,
                                      child: Text("NEW GAME"))
                                ],
                              )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        for (int i = 1; i <= 3; ++i)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              onPressed:
                                  Blue && checkwin ? () => _count(i, 2) : null,
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 40.0, vertical: 10.0)),
                              child: Text(
                                i.toString(),
                                style: TextStyle(fontSize: 40.0),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ],
              ),
            ), // Your widget tree
          )),
    );
  }
}
