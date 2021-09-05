/*
1กค-5533-57
  2กค-6087-61
  3กค-6230-41
  4กค-5916-44
  5กค-6166-50
*/
void main() {
  const Key_DATE = 'date';
  List<Map<String, dynamic>> reportlist = [
    {'date': '1กค', 'case': 5533, 'death': 57},
    {'date': '1กค', 'case': 6087, 'death': 61},
    {'date': '1กค', 'case': 6230, 'death': 41},
    {'date': '1กค', 'case': 5916, 'death': 44},
    {'date': '1กค', 'case': 6166, 'death': 50},
  ];

  // for (var i = 0; i < reportlist.length; i++) {
  //   print(
  //       'วันที่ ${reportlist[i]['date']},ติดเชื้อ ${reportlist[i]['case']},เสียชีวิต ${reportlist[i]['death']}');
  // }
  var f =(Map<String,dynamic> i) {
    print(i);

  };

  // reportlist.forEach(f);
  reportlist.forEach((Map<String, dynamic> item) {
    print('วันที่ ${item['date']}, ติดเชื้อ ${item['case']}, เสียชีวิต ${item['death']}');
  });
}
