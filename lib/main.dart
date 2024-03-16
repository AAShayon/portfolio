import 'package:flutter/material.dart';
import 'package:portfolio/provider/choiceprovider.dart';
import 'package:portfolio/view/MyportFolio.dart';
import 'package:provider/provider.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: ( context) =>MyChoiceProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyportFolio(),
      ),
    );
  }
}
