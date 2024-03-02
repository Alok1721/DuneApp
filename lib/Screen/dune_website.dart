import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainer extends StatefulWidget {
  final String? name;
  const WebViewContainer({this.name,super.key});

  @override
  State<WebViewContainer> createState() => _WebViewContainerState();
}
var name='';
class _WebViewContainerState extends State<WebViewContainer> {
  @override
  void initState() {
    super.initState();
   name=widget.name!;
   print("inside the dune_website:$name");
    // Initialization code here
  }

  final controller =WebViewController()
  ..setJavaScriptMode(JavaScriptMode.disabled)
  ..loadRequest(Uri.parse('https://${name.toString()}/'));//${name.toString()}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(child: Stack(
        children: [
          WebViewWidget(controller: controller,),
          ElevatedButton(onPressed: (){setState(() {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  WebViewContainer(name:name)),
            );

          });}, child: Text("refresh"))
        ],
      )),
    );
  }
}

