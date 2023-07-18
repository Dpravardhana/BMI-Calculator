import 'package:flutter/material.dart';

const Color mainHexColor = Colors.black12;
const Color accentHexColor = Colors.yellowAccent;

void main() {
  runApp(MyApp());
}
class LeftBar extends StatelessWidget{
  final double barWidth;
  const LeftBar({Key? key ,required this.barWidth}) : super(key : key);
  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 25,
          width:  barWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            color: accentHexColor,
          ),
        ),
      ],
    );
  }
}
class RightBar extends StatelessWidget{
  final double barWidth;
  const RightBar({Key? key,required this.barWidth}) : super(key : key);
  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 25,
          width:  barWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            color: accentHexColor,
          ),
        ),
      ],
    );
  }
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BMI Calculator",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

final TextEditingController _heightcontroller = TextEditingController();
final TextEditingController _weightcontroller = TextEditingController();
double _bmiResult = 0;
String _textResult = "";

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI Calculator",
          style: TextStyle(color: accentHexColor, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: 130,
                    child: TextField(
                      controller: _heightcontroller,
                      style: const TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: accentHexColor,
                      ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Height",
                          hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(0.8),
                          )),
                    )),
                SizedBox(
                    width: 130,
                    child: TextField(
                      controller: _weightcontroller,
                      style: const TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: accentHexColor,
                      ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Weight",
                          hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(0.8),
                          )),
                    )),
              ],
            ),
            const SizedBox(
              height: 70,
            ),
            ElevatedButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: accentHexColor,
                disabledForegroundColor: Colors.grey,
              ),
              onPressed: () {
                double _h = double.parse(_heightcontroller.text);
                double _w = double.parse(_weightcontroller.text);
                setState(() {
                  _bmiResult = _w / (_h * _h);
                  if (_bmiResult > 25) {
                    _textResult = "You're Over Weight";
                  } else if (_bmiResult > 18.5) {
                    _textResult = "You have Normal Weight";
                  } else {
                    _textResult = "You're Under Weight";
                  }
                });
              },
              child: const SizedBox(
                  child: Text("Calculate",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,))),
            ),
            const SizedBox(
              height: 50,
            ),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: SizedBox(
                  child: Text(_bmiResult.toStringAsFixed(2),
                      style: TextStyle(
                          fontSize: 90,
                          fontWeight: FontWeight.bold,
                          color: accentHexColor))),
            ),
            const SizedBox(
              height: 50,
            ),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: SizedBox(
                  child: Text(_textResult,
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: accentHexColor))),


            ),
            SizedBox(height:  10,),
            LeftBar(barWidth: 40,),
            SizedBox(height:  20,),
            LeftBar(barWidth: 70,),
            SizedBox(height:  20,),
            LeftBar(barWidth: 40,),
            SizedBox(height:  20,),
            RightBar(barWidth: 70,),
            SizedBox(height:  50,),
            RightBar(barWidth: 70,),
          ],
        ),
      ),
    );
  }
}
