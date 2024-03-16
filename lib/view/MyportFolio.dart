import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio/provider/choiceprovider.dart';
import 'package:provider/provider.dart';

class MyportFolio extends StatefulWidget {
  const MyportFolio({super.key});

  @override
  State<MyportFolio> createState() => _MyportFolioState();
}

class _MyportFolioState extends State<MyportFolio> {
  final _subcontrol=TextEditingController();
  final _rescontrol=TextEditingController();
  @override
  void dispose() {
    _subcontrol.dispose();
    _rescontrol.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MyChoiceProvider>(builder: (context, provider, child) {
       if(provider.mySubject.isNotEmpty){
        return  ListView.builder(
            itemCount: provider.mySubject.length,
            itemBuilder: (context, index) {
              final item = provider.mySubject[index];
              return ListTile(
                title: Text(item.subjectName),
                subtitle: Text(item.result),
                trailing: IconButton(
                  onPressed: () {
                    provider.delete(index);
                  },
                  icon: Icon(Icons.delete),
                ),
              );
            });}
       else {
         return Center(child:Text('Data nai !!!!!!!!!'));
       }
      }),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
      showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
            // height: 200,
            color: Colors.amber,
            child: Center(
              child: Column(
             children: [
               TextFormField(
                 controller: _subcontrol,
                 decoration: InputDecoration(labelText: 'Subject Name'),
               ),
               SizedBox(height: 10,),
               TextFormField(
                 controller: _rescontrol,
                 decoration: InputDecoration(labelText: 'Result'),
               ),
               SizedBox(height: 10,),
               TextButton(onPressed: (){
                 final subject=_subcontrol.text;final result=_rescontrol.text;
                 if(subject.isNotEmpty && result.isNotEmpty ){
                   Provider.of<MyChoiceProvider>(context,listen: false).addList(subject, result);
                   _subcontrol.clear();
                   _rescontrol.clear();

                 }  Navigator.pop(context);
               }, child: Text('ok'))
             ],
              ),
            ),
          );
        },
      );
    },child: Icon(Icons.add),),
    );

  }
}
