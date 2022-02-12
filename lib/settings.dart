

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'globals.dart';



class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  bool value = true;



  final Color activeColor = Color(0xFF2C3341);
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0XFF181C27),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text('Settings',style: TextStyle(fontSize: 18,color: Colors.white),),
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Center(child: IconButton(onPressed: ()=> Navigator.pop(context), icon: Icon(Icons.arrow_back_ios,color: Colors.white,size: 20,))),
        ),
      ),
      body: SafeArea(
        child:SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30,),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width/1.05,
                  height: 127,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Card(
                    color: Color(0xFF2C3341),
                    elevation: 5.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset('assets/drop.png'),
                              Transform.scale(
                                scale: 0.8,
                                child: CupertinoSwitch(
                                  thumbColor:Color(0xFF2C3341) ,
                                  activeColor: Color(0xff00FF75),
                                  value: value,
                                  onChanged: (v) => setState(() => value = v),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Color Dance',style: TextStyle(fontSize: 16,color: Colors.white),),
                              SizedBox(height: 5,),
                              Text('Background color beats and is reactive when hearts \nSOUND/BASS',style: TextStyle(height: 1.2,fontSize: 13,fontWeight:FontWeight.w300,color: Colors.white),),
                            ],
                          ),
                        ),
                        SizedBox(height: 5,),

                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width/1.05,
                  height: 127,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Card(
                    color: Color(0xFF2C3341),
                    elevation: 5.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset('assets/cam.png'),
                              Transform.scale(
                                scale: 0.8,
                                child: CupertinoSwitch(
                                  thumbColor:Color(0xFF2C3341) ,
                                  activeColor: Color(0xff00FF75),
                                  value: value2,
                                  onChanged: (v) {
                                    setState(() {
                                    //  value2=v;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Quick shot Background',style: TextStyle(fontSize: 16,color: Colors.white),),
                              SizedBox(height: 5,),
                              Text('Use camera to take photo of any background and\nautomatically product it as a background on the phone!',style: TextStyle(height: 1.2,fontSize: 13,fontWeight:FontWeight.w300,color: Colors.white),),
                            ],
                          ),
                        ),
                        SizedBox(height: 5,),

                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 60,),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width/1.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Card(
                    color: Color(0xFF2C3341),
                    elevation: 5.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset('assets/Vibrate.png'),
                                  SizedBox(width: 10,),
                                  Text('Vibrate mode',style: TextStyle(fontSize: 16,color: Colors.white),),
                                ],
                              ),
                              Transform.scale(
                                scale: 0.8,
                                child: CupertinoSwitch(
                                  thumbColor:Color(0xFF2C3341) ,
                                  activeColor: Color(0xff00FF75),
                                  value: vibrator,
                                  onChanged: (va) => setState(() => vibrator = va,
                                ),
                              ),
                              )],
                          ),
                        ),
                        SizedBox(height: 5,),

                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width/1.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Card(
                    color: Color(0xFF2C3341),
                    elevation: 5.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset('assets/bellicon.png'),
                                  SizedBox(width: 10,),
                                  Text('Sound wave',style: TextStyle(fontSize: 16,color: Colors.white),),
                                ],
                              ),
                              Transform.scale(
                                scale: 0.8,
                                child: CupertinoSwitch(
                                  thumbColor:Color(0xFF2C3341) ,
                                  activeColor: Color(0xff00FF75),
                                  value: value,
                                  onChanged: (v) => setState(() => value = v),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5,),

                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Center(
                child: Container(
                  height: 58,
                  width: MediaQuery.of(context).size.width/1.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Card(
                    color: Color(0xFF2C3341),
                    elevation: 5.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset('assets/Lightbulb.png'),
                                  SizedBox(width: 10,),
                                  Text('Tips',style: TextStyle(fontSize: 16,color: Colors.white),),
                                ],
                              ),
                            Icon(Icons.arrow_forward_ios_sharp,color: Colors.grey,)
                            ],
                          ),
                        ),
                        SizedBox(height: 5,),

                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Center(
                child: Container(
                  height: 58,
                  width: MediaQuery.of(context).size.width/1.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Card(
                    color: Color(0xFF2C3341),
                    elevation: 5.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset('assets/basket.png'),
                                  SizedBox(width: 10,),
                                  Text('Add free - Buy app',style: TextStyle(fontSize: 16,color: Colors.white),),
                                ],
                              ),
                              Icon(Icons.arrow_forward_ios_sharp,color: Colors.grey,)
                            ],
                          ),
                        ),
                        SizedBox(height: 5,),

                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Center(
                child: Container(
                  height: 58,
                  width: MediaQuery.of(context).size.width/1.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Card(
                    color: Color(0xFF2C3341),
                    elevation: 5.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset('assets/web.png'),
                                  SizedBox(width: 10,),
                                  Text('Website',style: TextStyle(fontSize: 16,color: Colors.white),),
                                ],
                              ),
                              Icon(Icons.arrow_forward_ios_sharp,color: Colors.grey,)
                            ],
                          ),
                        ),
                        SizedBox(height: 5,),

                      ],
                    ),
                  ),
                ),
              ),



            ],
          ),
        ),
      ) ,
    );
  }
}