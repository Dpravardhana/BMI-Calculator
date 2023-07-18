import 'package:flutter/material.dart';
import 'package:bmi/constants/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(
              color:accentHexColor,
              fontWeight: FontWeight.w300
          ),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child:  TextField(
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border:InputBorder.none,
                      hintText: "Height",
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(0.8),

                      )

                    ),
                  )
                ),
                Container(
                    width: 130,
                    child:  TextField(
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: accentHexColor,
                      ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border:InputBorder.none,
                          hintText: "Weight",
                          hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(0.8),

                          )

                      ),
                    )
                ),
              ],
            ),
            SizedBox(height: 30,),
            Container(
              child: Text("Calculate",style:TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: accentHexColor))
            ),
            SizedBox(height: 50,),
            Container(
              child: Text("Calculate",style:TextStyle(fontSize: 90,fontWeight: FontWeight.bold,color: accentHexColor))
            )


          ],
        ),
      ),
    );
  }
}

