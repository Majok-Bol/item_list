import 'package:flutter/material.dart';
void main()=>runApp(MyApp());
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget{
  @override
  HomePageInstance createState()=>HomePageInstance();
}
class HomePageInstance extends State<MyHomePage>{
  final List<String>itemsToAdd=[];
  final TextEditingController itemController=TextEditingController();
  //track the index of the item being edited
  int?editingIndex;
  void addItem(){
    setState(() {
      //check if text field is not empty
      //if yes
      // add the item in text field
      if(itemController.text.isNotEmpty){
        //check if editing index is null
        // that is no item to edit
        //then add the item
        if(editingIndex==null){
          //add new item
          itemsToAdd.add(itemController.text);
        }else{
          //if there is item to be edited
          //then edit the item
          itemsToAdd[editingIndex!]=itemController.text;
          //reset the edit mode
          editingIndex=null;
        }
        //clear the text field after editing or adding the item
        itemController.clear();
      }
    });
  }
  //add functionality to clear the list
  void clearList(){
    setState(() {
      itemsToAdd.clear();
    });
  }
  //add edit function
void editItem(int index){
    setState(() {
      //set text field to selected item
      itemController.text=itemsToAdd[index];
      //set editing mode on the selected item index
      editingIndex=index;
    });
}
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Item tracker',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),centerTitle: true,),
      body: Container(
        padding: EdgeInsets.all(10.0),
        // color: Colors.grey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter item to add'
                  ),
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}