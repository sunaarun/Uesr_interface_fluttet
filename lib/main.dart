import 'package:flutter/material.dart';
import 'package:ui_app/planet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //Create a list of Planets
  List<Planet> myPlanet=[
    new Planet(name: 'Earth', img: 'images/earth.png', descreption: 'Some descreption'),
    new Planet(name: 'Jupiter', img: 'images/jupiter.png', descreption: 'Some descreption'),
    new Planet(name: 'Mars', img: 'images/mars.png', descreption: 'Some descreption'),
    new Planet(name: 'Mercury', img: 'images/Mercury.png', descreption: 'Some descreption'),
    new Planet(name: 'Saturn', img: 'images/saturn.png', descreption: 'Some descreption'),
    new Planet(name: 'Uranus', img: 'images/Uranus.png', descreption: 'Some descreption'),
    new Planet(name: 'Venus', img: 'images/Venus.png', descreption: 'Some descreption'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              width:MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.black,
                image: new DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter:
                  ColorFilter.mode(Colors.black.withOpacity(0.4),
                      BlendMode.dstATop),
                  image: AssetImage('images/wall.jpg',) ,
              ),
            ),
            ),
            MyWheelScroll(myPlanet: myPlanet)
          ],
        ),
      ),
     floatingActionButton:
      FloatingActionButton(
        onPressed:(){},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MyWheelScroll extends StatelessWidget {
  final List<Planet> myPlanet;
   MyWheelScroll({required this.myPlanet});

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: -1,
      child: ListWheelScrollView(
        magnification: 1.5,
        useMagnifier: true,
        itemExtent: 200,
        children: List.generate(myPlanet.length, (index) => RotatedBox(
          quarterTurns: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  color: Colors.transparent,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.transparent,
                    child: Image.asset(myPlanet[index].img.toString()),),
              ),
              Center(child: Text(myPlanet[index].name,
                style: TextStyle(fontSize: 20, color: Colors.white),)),
              Center(child: Text(myPlanet[index].descreption,
                style: TextStyle(fontSize: 17, color: Colors.white),)),
            ],
          ),
        )),
      ),
    );
  }
}



