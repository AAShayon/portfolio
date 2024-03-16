import 'package:flutter/material.dart';
import 'package:portfolio/data/model/mydata.dart';

class MyChoiceProvider with ChangeNotifier {
  final List<MySubject> _mySublist = [];

  List<MySubject> get mySubject => _mySublist;

  // void addList(String subjectName,String result){
  //   _mySublist.add(MySubject(subjectName: subjectName, result: result));
  // }
  void addList(String subname, String res) {
    _mySublist.add(MySubject(subjectName: subname, result: res));
    notifyListeners();
  }

  void delete(int index) {
    _mySublist.removeAt(index);
    notifyListeners();
  }


}

