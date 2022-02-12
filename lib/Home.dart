import 'dart:io';
import 'package:bgcolor_app/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibration/vibration.dart';
import 'package:vector_math/vector_math.dart' as math;
import 'globals.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Color pickerColor = fifth;
  Color currentColor = second;
  int _isPreSelected=0;
  void changeColor(Color color) {
    setState(
      () => pickerColor = color,
    );
  }

  File colorfile;
  File imagefile;

  void _takePhoto() async {
    XFile pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxHeight: 2060,
      maxWidth: 2060,
    );
    setState(() {
      imagefile = File(pickedFile.path);
    });
  }

  /*void _getFromCamera() async {
    XFile pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxHeight: 2060,
      maxWidth: 2060,

    );
    setState(() {
      imagefile = File(pickedFile.path);
    });
    GallerySaver.saveImage(pickedFile.path);
    setState(() {
      imagefile = File(pickedFile.path);
    });

  }*/
  /*GallerySaver.saveImage(pickedFile.path);
  setState(() {
  imagefile = File(pickedFile.path);
  });*/
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          imagefile != null
              ? Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Image.file(
                    imagefile,
                    fit: BoxFit.fill,
                  ),
                )
              : Container(
                  color: Color(int.parse(BackgroundColor)),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                ),
          Column(
            children: [
              Container(
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage("assets/backimg.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Color',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 31,
                          color: Colors.white),
                    ),
                    IconButton(
                        onPressed: () {
                          print(value2);
                          print(vibrator);
                          Navigator.pushNamed(context, 'Settings')
                              .then((_) => setState(() {}));
                        },
                        // Navigator.pushNamed(context, 'Settings'),
                        icon: Icon(
                          Icons.settings,
                          color: Colors.white,
                          size: 31,
                        )),
                  ],
                ),
              ),
              Spacer(),
              value2
                  ? InkWell(
                      child: Container(
                        height: 58,
                        width: 58,
                        child: Icon(
                          Icons.camera_alt,
                          color: seventh,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: seventh,
                              blurRadius: 12,
                              offset: Offset(1, 1), // Shadow position
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        print(value2);
                        _takePhoto();
                      },
                    )
                  : Container(
                      height: 58,
                      width: 58,
                      child: Icon(
                        Icons.camera_alt,
                        color: seventh,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: seventh,
                            blurRadius: 12,
                            offset: Offset(1, 1), // Shadow position
                          ),
                        ],
                      ),
                    ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 57,
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/img.png',
                              height: 50,
                              width: 50,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Bottom banner ads',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                    value2 == true
                        ? AnimatedContainer(
                            duration: Duration(seconds: 1),
                            curve: Curves.easeInOutBack,
                            height: 58,
                            width: 58,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    fifth,
                                    second,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(50.0),
                                color: second),
                          )
                        : InkWell(
                            child: AnimatedContainer(
                              duration: Duration(seconds: 1),
                              curve: Curves.easeInOutBack,
                              height: 58,
                              width: 58,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      fifth,
                                      second,
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(50.0),
                                  color: second),
                            ),
                            onTap: () {
                              showGeneralDialog(
                                  barrierColor: Colors.black.withOpacity(0.5),
                                  transitionBuilder: (context, a1, a2, widget) {
                                    final curvedValue = Curves.easeInOutBack.transform(a1.value) -   1.0;
                                    return Transform(
                                      transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
                                      child: Opacity(
                                        opacity: a1.value,
                                        child: AlertDialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20.0))),
                                          elevation: 5.0,
                                          backgroundColor: Color(0XFF272E3C),
                                          content: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                      1.1,
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                      1.8,
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                        children: [
                                                          InkWell(
                                                            child: Icon(
                                                              Icons.close,
                                                              color: Colors.white,
                                                            ),
                                                            onTap: () {
                                                              Navigator.pop(context);
                                                            },
                                                          )
                                                        ],
                                                      ),
                                                      ColorPicker(
                                                        onHsvColorChanged: (value) {
                                                          vibrator == true
                                                              ? Vibration.vibrate(
                                                              duration: 10)
                                                              : Vibration.vibrate(
                                                              duration: 0);
                                                        },
                                                        paletteType:
                                                        PaletteType.hueWheel,
                                                        showLabel: false,
                                                        pickerColor: pickerColor,
                                                        onColorChanged: changeColor,
                                                        displayThumbColor: false,
                                                        pickerAreaHeightPercent:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .height /
                                                            1080,
                                                        hexInputBar: false,
                                                        portraitOnly: false,
                                                        hexInputController: null,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                        children: [
                                                          InkWell(
                                                            child: Container(
                                                              height:
                                                              MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                                  12.5,
                                                              width:
                                                              MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                                  12.5,
                                                              decoration: BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(5.0),
                                                                color: Color(
                                                                    int.parse(color1)),
                                                              ),
                                                            ),
                                                            onTap: (){
                                                              setState(() {
                                                                BackgroundColor=color1;
                                                              });
                                                            },
                                                          ),
                                                          InkWell(
                                                            onTap: (){
                                                              setState(() {
                                                                BackgroundColor=color2;
                                                              });
                                                            },
                                                            child: Container(
                                                              height:
                                                              MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                                  12.5,
                                                              width:
                                                              MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                                  12.5,
                                                              decoration: BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(5.0),
                                                                color: Color(
                                                                    int.parse(color2)),
                                                              ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: (){
                                                              setState(() {
                                                                BackgroundColor=color3;
                                                              });
                                                            },
                                                            child: Container(
                                                              height:
                                                              MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                                  12.5,
                                                              width:
                                                              MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                                  12.5,
                                                              decoration: BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(5.0),
                                                                color: Color(
                                                                    int.parse(color3)),
                                                              ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: (){
                                                              setState(() {
                                                                BackgroundColor=color4;
                                                              });
                                                            },
                                                            child: Container(
                                                              height:
                                                              MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                                  12.5,
                                                              width:
                                                              MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                                  12.5,
                                                              decoration: BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(5.0),
                                                                color: Color(
                                                                    int.parse(color4)),
                                                              ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: (){
                                                              setState(() {
                                                                BackgroundColor=color5;
                                                              });
                                                            },
                                                            child: Container(
                                                              height:
                                                              MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                                  12.5,
                                                              width:
                                                              MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                                  12.5,
                                                              decoration: BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(5.0),
                                                                color: Color(
                                                                    int.parse(color5)),
                                                              ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: (){
                                                              setState(() {
                                                                BackgroundColor=color6;
                                                              });
                                                            },
                                                            child: Container(
                                                              height:
                                                              MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                                  12.5,
                                                              width:
                                                              MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                                  12.5,
                                                              decoration: BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(5.0),
                                                                color: Color(
                                                                    int.parse(color6)),
                                                              ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: (){
                                                              setState(() {
                                                                BackgroundColor=color7;
                                                              });
                                                            },
                                                            child: Container(
                                                              height:
                                                              MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                                  12.5,
                                                              width:
                                                              MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                                  12.5,
                                                              decoration: BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(5.0),
                                                                color: Color(
                                                                    int.parse(color7)),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 3,
                                                      ),
                                                      RaisedButton(
                                                        textColor: Colors.white,
                                                        color: Colors.black26,
                                                        child: Text("Set Background"),
                                                        onPressed: () {
                                                          print(pickerColor);

                                                          print(pickerColor.value.toRadixString(16));
                                                          setState(() {
                                                            BackgroundColor="0x"+pickerColor.value.toRadixString(16);
                                                            color1=color2;
                                                            color2=color3;
                                                            color3=color4;
                                                            color4=color5;
                                                            color5=color6;
                                                            color6=color7;
                                                            color7=BackgroundColor;
                                                            preferences.setString('color1', color1);
                                                            preferences.setString('color2', color2);
                                                            preferences.setString('color3', color3);
                                                            preferences.setString('color4', color4);
                                                            preferences.setString('color5', color5);
                                                            preferences.setString('color6', color6);
                                                            preferences.setString('color7', color7);
                                                          });
                                                          Navigator.pop(context);

                                                        },
                                                        shape: new RoundedRectangleBorder(
                                                          borderRadius: new BorderRadius.circular(10.0),
                                                        ),
                                                      ),
/*  ElevatedButton(
                                                  style: ButtonStyle(

                                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(4.0),
                                                              //side: BorderSide(color: Colors.red)
                                                          )
                                                      )
                                                  ),
                                                  onPressed: () {
                                                    print(pickerColor);

                                                    print(pickerColor.value.toRadixString(16));
                                                    setState(() {
                                                      BackgroundColor="0x"+pickerColor.value.toRadixString(16);
                                                      color1=color2;
                                                      color2=color3;
                                                      color3=color4;
                                                      color4=color5;
                                                      color5=color6;
                                                      color6=color7;
                                                      color7=BackgroundColor;
                                                      preferences.setString('color1', color1);
                                                      preferences.setString('color2', color2);
                                                      preferences.setString('color3', color3);
                                                      preferences.setString('color4', color4);
                                                      preferences.setString('color5', color5);
                                                      preferences.setString('color6', color6);
                                                      preferences.setString('color7', color7);
                                                    });
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text('Set Background'))*/
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  transitionDuration: Duration(milliseconds: 200),
                                  barrierDismissible: true,
                                  barrierLabel: '',
                                  context: context,
                                  pageBuilder: (context, animation1, animation2) {});
                            },
                          )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
