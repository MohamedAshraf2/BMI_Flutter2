import 'package:imbody/widgets/Left.dart';
import 'package:imbody/widgets/right.dart';
import 'package:imbody/constants/app-constant.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  TextEditingController _heightController= TextEditingController();

  TextEditingController _weightController= TextEditingController();
  double _bmiResult = 0;
  String _textResult='';
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator',
        style: TextStyle(color: typingColor,fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      backgroundColor: appColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: typingColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Height',
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(.8),
                      )
                    ),
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: _weightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: typingColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Weight',
                        hintStyle: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(.8),
                        )
                    ),
                  ),
                ),
              ],
            ),

        SizedBox(height: 30,),

        GestureDetector(
          onTap: (){
          double _h =double.parse(_heightController.text);

          double _w =double.parse(_weightController.text);
          setState(() {
            _bmiResult= _w /(_h*_h);
            if(_bmiResult>25){
              _textResult="You are Over Weight";
            }else{
              if(_bmiResult>=18.5 && _bmiResult<=25){
                _textResult="You have Normal Weight";
              }else{

                  _textResult="You are Under Weight";
                }
            }
          });
          },
          child: Container(

            child: Text('Calculate',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: typingColor,
            ),),
          ),
        ),
            SizedBox(height: 50,),

            Container(
              child: Text(_bmiResult.toStringAsFixed(2),style: TextStyle(fontSize: 90,color: typingColor),),
            ),

            SizedBox(height: 30,),

            Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
                child: Text(_textResult, style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                  color: typingColor,
                ),),
              ),
            ),


            SizedBox(height: 10,),
            LeftBar(barWidth: 40),
            SizedBox(height: 20,),
            LeftBar(barWidth:70),
            SizedBox(height: 20,),
            LeftBar(barWidth: 40),
            SizedBox(height: 20,),

            RightBar(barWidth: 70,),
            SizedBox(height: 60,),
            RightBar(barWidth: 40,),
          ],
        ),
      ),
    );
  }
}