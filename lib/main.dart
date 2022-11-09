import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}
var i=0;
var images = {"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRngoucDD7ny_oDB-bYqdCyWWsvufl10YkTgt2336GNWO4nXbu09fvQSgF9io2n4f1LDp8&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZlWNjD4dxfaKTlUM24S3Q-t2gZDj4CHY7DQ&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxNo1AI9i76gXlse_90zWBA6YWjG2SRRxPsQ&usqp=CAU",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7gJh3agt0dgEXvWzr18Y-SPIQ5UBytO0QSA&usqp=CAU"
};
var msg ={"汪汪汪",
  "帥狗狗!",
  "嘿嘿嘿",
  "大吉大利"
};
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var appTitle = const Text('Image App');
    //建立app Body物件
    var appBody = Center(
      child: _MyApp(),
    );
    //建立 appBar 物件
    var appBar = AppBar(
      title: appTitle,
      backgroundColor: Color(0xff0000ff),
    );

    //建立 app 物件
    var app = MaterialApp(
      home: Scaffold(
        appBar: appBar,
        body: appBody,
        backgroundColor: Colors.white,
      ),
    );
    return app;
  }
}

class _MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  child: ImageButton(),
              ),
              Row(
                children: <Widget>[
                  Container(
                    child: Button1(),
                  ),
                  SizedBox(width: 100,),
                  Container(
                    child: Button2(),
                  ),
                ],
              ),
            ]
        ),
      ],
    );
  }
}

class ImageButton extends StatelessWidget {
  const ImageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        width: 250,
        height: 250,
        // Inkwell
        child: InkWell(
          radius: 100,
          // display a snackbar on tap
          onTap: () {
            final snackBar = SnackBar(
              content: Text("按下ImageButton"),
              duration: Duration(seconds: 3),
              backgroundColor: Colors.deepOrange,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              action: SnackBarAction(
                label: msg.elementAt(i),
                textColor: Colors.white,
                onPressed: ()=>Fluttertoast.showToast(
                    msg: '按下SnackBar',
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.CENTER,
                    backgroundColor: Colors.deepPurple,
                    textColor: Colors.white,
                    fontSize: 20.0),
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          // implement the image with Ink.image
          child: Ink.image(
            fit: BoxFit.cover,
            image: new NetworkImage(images.elementAt(i)),
          ),
        ),
      ),
    );
  }
}

class Button1 extends StatelessWidget {
  const Button1({Key? key}) : super(key: key);
  //const Button(String msg);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        child: Text(
          "上一頁",
          style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),
        ),
        style: TextButton.styleFrom(
          fixedSize: const Size(75,35),
          backgroundColor: Colors.amber,
        ),
        onPressed: () {
          if(i==0)i=0;
          else i--;
          main();
        },
      ),

    );
  }
}

class Button2 extends StatelessWidget {
  const Button2({Key? key}) : super(key: key);
  //const Button(String msg);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        child: Text(
          "下一頁",
          style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),
        ),
        style: TextButton.styleFrom(
          fixedSize: const Size(75,35),
          backgroundColor: Colors.amber,
        ),
        onPressed: () {
          if(i==images.length-1)i=images.length-1;
          else i++;
          main();
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
