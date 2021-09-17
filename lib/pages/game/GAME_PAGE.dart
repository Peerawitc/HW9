import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Game.dart';




class gamePage extends StatefulWidget {
  const gamePage({Key? key}) : super(key: key);

  @override
  _gamePageState createState() => _gamePageState();
}

class _gamePageState extends State<gamePage> {
  late Game _game;
  final TextEditingController _controller = TextEditingController();
  String? _guessnumber;
  String? _feedback;
  bool checkwin = false;
  void _reset() {
    setState(() {
      checkwin = false;
      _feedback = null;
      _guessnumber = null;
      _game = new Game();
    });
  }

  @override
  void initState() {
    super.initState();
    _game = Game();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("GUESS THE NUMBER")),
        body: Container(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildHeader(),
                  _maincenter(),
                  buildRow(),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _buildHeader() {
    return Expanded(
      child: Column(
        children: [
          Image.asset(
            'assets/images/game.png',
            width: 240.0,
          ),
          Text(
            "GUESS THE NUMBER",
            style: GoogleFonts.chonburi(fontSize: 22.0),
          ),
        ],
      ),
    );
  }

  Widget _maincenter() {
    return _guessnumber == null
        ? Expanded(
            child: Text(
            "I'm thinking of a number \n   between 1 and 100\n\n Can you guess it?",
            style: GoogleFonts.k2d(fontSize: 30),
          ))
        : Expanded(
            child: Column(children: [
              Row(
                mainAxisAlignment:  MainAxisAlignment.center,
                children: [

                  Column(
                    children: [
                      Text(
                        _guessnumber! ,
                        style: GoogleFonts.k2d(fontSize: 50),
                        textAlign: TextAlign.center,
                      ),
                      Row(
                        children: [
                          _feedback!= "CORRECT!" ? Icon(Icons.clear,color:Colors.red,size: 50,)
                         : Icon(Icons.check,color:Colors.green,size: 50,),
                          Text(
                             _feedback!,
                            style: GoogleFonts.k2d(fontSize: 50),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              _feedback == "CORRECT!"
                  ? TextButton(
                      onPressed: _reset,
                      child: Text("NEW GAME", style: TextStyle(fontSize: 15)),
                    )
                  : Container()
            ]),
          );
  }

  Widget buildRow() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.teal, width: 10.0),
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              if (_controller.text != "" &&checkwin == false) {
                _guessnumber = _controller.text;

                int? guess = int.tryParse(_guessnumber!);
                if (guess != null) {
                  _controller.clear();
                  var result = _game.doGuess(guess);
                  if (result == 0) {
                    _feedback = 'CORRECT!';
                    _showMaterialDialog();
                    checkwin = true;
                  } else if (result == 1) {
                    _feedback = 'TOO HIGH!';
                    checkwin = false;
                  } else {
                    _feedback = 'TOO LOW!';
                    checkwin = false;
                  }
                }
              }
            });
          },
          child: Text('Guess'),
        ),
      ],
    );
  }
  void _showMaterialDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("GOOD JOB"),
          content: Text("THE ANSWER IS "+_game.getanswer()+"\n"+"You have made "+_game.totalGuess.toString()+" Guess\n"+_game.getdata()),
          actions: [
            // ปุ่ม OK ใน dialog
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                // ปิด dialog
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}

