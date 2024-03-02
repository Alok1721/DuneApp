import 'package:dune/Screen/dune_website.dart';
import 'package:flutter/material.dart';
class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}
final websiteName=TextEditingController();
var name='';
class _DashboardState extends State<Dashboard> {

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Enter the website name "),

          actions: [
            TextField(
              controller: websiteName,
              decoration: InputDecoration(border: OutlineInputBorder(),hintText:"website"),
              onTap: (){

              },



            ),
            ElevatedButton(onPressed: (){
              setState(() {
                print("name:${websiteName.text.toString()}");


              });

              Navigator.of(context).pop();
            }, child: Center(child: Text("Submit")))
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(height:100,width: 100,color: Colors.red,),
            SizedBox(height: 300,),
            ElevatedButton(onPressed: (){
              setState(() {
                name=websiteName.text.toString();
              });

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  WebViewContainer(name:name)),
              );
              print("name:${websiteName.text.toString()}");

            }, child: Text("click me")),

            ElevatedButton(onPressed: _showDialog, child: Text("setting"))


          ],
        )
      ),
    );
  }
}
