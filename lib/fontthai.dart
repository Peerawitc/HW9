import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class fontthai extends StatefulWidget {
  const fontthai({Key? key}) : super(key: key);
  @override
  _fontthaiState createState() => _fontthaiState();
}
class _fontthaiState extends State<fontthai> {
List <String> font = ["Sarabun","Taviraj" ,"Mali","Krub","Niramit" ,"Charm", "KoHo" ,"K2D","Chonburi" , "Srisakdi" ];
var setfont ="Srisakdi";
Widget _fontbutton(String str){
 return Padding(
   padding: const EdgeInsets.all(8.0),
   child: ElevatedButton(
        onPressed: () =>setState((){
          setfont=str;
        }),
        style: ElevatedButton.styleFrom(
            primary: Colors.tealAccent[100],
            padding: EdgeInsets.symmetric(
                horizontal: 40.0, vertical: 10.0)),
        child: Text(str.toString(),style: TextStyle(color: Colors.black ),)),
 );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("THAI FONT VIEWER"),
        backgroundColor: Colors.pinkAccent[100],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: const DecorationImage(
            image: const AssetImage("assets/images/pastel.jpg"),
            fit: BoxFit
                .fill, // ยืดเต็มพื้นที่โดยไม่สนใจสัดส่วนของภาพ หรือใช้ BoxFit.cover เพื่อยืดให้เต็มและคงสัดส่วนของภาพไว้ แต่บางส่วนของภาพอาจถูก crop
          ),
        ),
        child: Center(

          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Wrap(
                            children: [
                          Text(
                            "เบื่อชีวิตอิสระ อยากหาจังหวะมีเจ้าของ",
                           style: GoogleFonts.getFont(setfont,fontSize: 50),
                          ),
                        ]),
                      )
                    ],
                  ),
                ),
              ),
              Text("Font: $setfont"),
              Card(
                   color:Color.fromRGBO(38, 38, 38, 0.0),
                child: Wrap(
                    alignment: WrapAlignment.center,
                  children: font.map((e) => _fontbutton(e)).toList()
                ),
              )
            ],
          ),

        ),
      ),
    );
  }
}
