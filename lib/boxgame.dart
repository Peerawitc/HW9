import 'package:flutter/material.dart';

class GAMEBOX extends StatefulWidget {
  const GAMEBOX({Key? key}) : super(key: key);

  @override
  _GAMEBOXState createState() => _GAMEBOXState();
}

class _GAMEBOXState extends State<GAMEBOX> {
  int scoreteam1 = 0;
  int scoreteam2 = 0;
  int round = 0;
  int count1 = 0;
  int count2 = 0;

  List<Widget> show = [];
  _reset() {
    setState(() {
      scoreteam1 = 0;
      scoreteam2 = 0;
      round = 0;
      count1 = 0;
      count2 = 0;
      show = [];
    });
  }

  _round(bool team) {
    setState(() {
      if (team == true) {
        scoreteam1 = 10;
        scoreteam2 = 10;
        round++;
        count1 += scoreteam1;
        count2 += scoreteam2;
      }
      if (team == false) {
        scoreteam1 = 9;
        scoreteam2 = 10;
        round++;
        count1 += scoreteam1;
        count2 += scoreteam2;
      }
      show.add(
        Column(
          children: [
            Text("Rouund $round"),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      scoreteam1.toString(),
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      scoreteam2.toString(),
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                Container(
                  height: 10.0,
                  child: Divider(
                    thickness: 1.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            if (round == 3)
              Column(
                children: [
                  Text("TOTAL"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        count1.toString(),
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        count2.toString(),
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  Container(
                    height: 10.0,
                    child: Divider(
                      thickness: 1.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OLYMPIC BOXING SCORING'),
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: Column(
          children: [
            Image(
              image: const AssetImage('assets/images/logo.png'),
            ),
            Container(
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Women's Light (57-60kg) Semi-final",
                      style: TextStyle(color: Colors.white))
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.person, // รูปไอคอน
                          size: 80.0, // ขนาดไอคอน
                          color: Colors.red, // สีไอคอน
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image(
                                  image: AssetImage(
                                      'assets/images/flag_ireland.png'),
                                  width: 50,
                                ),
                                Text(
                                  " IRAELAND",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                            Text(
                              "HARRINGTON Kellie Anne",
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ],
                    ),
                    if (count1 > count2 && round == 3)
                      Icon(
                        Icons.check, // รูปไอคอน
                        size: 20.0, // ขนาดไอคอน
                        color: Colors.blue, // สีไอคอน
                      ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.person, // รูปไอคอน
                          size: 80.0, // ขนาดไอคอน
                          color: Colors.blue, // สีไอคอน
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image(
                                  image: AssetImage(
                                      'assets/images/flag_thailand.png'),
                                  width: 50,
                                ),
                                Text(
                                  " THAILAND",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                            Text(
                              "SEESONDEE Sudaporn",
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ],
                    ),
                    if (count1 < count2 && round == 3)
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.check, // รูปไอคอน
                          size: 20.0, // ขนาดไอคอน
                          color: Colors.blue, // สีไอคอน
                        ),
                      ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 20.0,
                    child: Divider(
                      thickness: 8.0,
                      color: Colors.red,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 20.0,
                    child: Divider(
                      thickness: 8.0,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                children: show,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (round != 3)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () => _round(true),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 40.0, vertical: 10.0)),
                          child: Icon(
                            Icons.person, // รูปไอคอน
                            size: 30.0, // ขนาดไอคอน
                            color: Colors.white, // สีไอคอน
                          )),
                    ),
                  ),
                if (round != 3)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: () => _round(false),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 40.0, vertical: 10.0)),
                          child: Icon(
                            Icons.person, // รูปไอคอน
                            size: 30.0, // ขนาดไอคอน
                            color: Colors.white, // สีไอคอน
                          )),
                    ),
                  ),
                if (round == 3)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          onPressed: _reset,
                          style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 40.0, vertical: 10.0)),
                          child: Icon(
                            Icons.clear, // รูปไอคอน
                            size: 30.0, // ขนาดไอคอน
                            color: Colors.white, // สีไอคอน
                          )),
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
