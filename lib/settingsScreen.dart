import 'package:flutter/material.dart';
import 'package:work_timer/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  late TextEditingController txtWork;
  late TextEditingController txtShort;
  late TextEditingController txtLong;
  late int workTime;
  late int shortBreak;
  late int longBreak;
  SharedPreferences? prefs;

  static const String WORKTIME = "workTime";
  static const String SHORTBREAK = "shortBreak";
  static const String LONGBREAK = "longBreak";

  readSettings() async {
    prefs = await SharedPreferences.getInstance();

    workTime = prefs?.getInt(WORKTIME) ?? 30;
    await prefs!.setInt(WORKTIME, workTime);

    shortBreak = prefs?.getInt(SHORTBREAK) ?? 5;
    await prefs!.setInt(SHORTBREAK, shortBreak);

    longBreak = prefs?.getInt(LONGBREAK) ?? 15;
    await prefs!.setInt(LONGBREAK, longBreak);

    setState(() {
      txtWork.text = workTime.toString();
      txtShort.text = shortBreak.toString();
      txtLong.text = longBreak.toString();
    });
  }

  void updateSettings (String key, int value){
    switch (key) {
      case WORKTIME :
      {
        int? workTime = prefs!.getInt(WORKTIME);
        workTime = workTime! + value;
        if (workTime >= 1 && workTime <= 180) {
          prefs!.setInt(WORKTIME, workTime);
          setState(() {
            txtWork.text = workTime.toString();
          });
        }
      } break;

      case SHORTBREAK :
      {
        int? shortBreak = prefs!.getInt(SHORTBREAK);
        shortBreak = shortBreak! + value;
        if (shortBreak >= 1 && shortBreak <= 120) {
          prefs!.setInt(SHORTBREAK, shortBreak);
          setState(() {
            txtShort.text = shortBreak.toString();
          });
        }
      } break;
      
      case LONGBREAK :
      {
        int? longBreak = prefs!.getInt(LONGBREAK);
        longBreak = longBreak! + value;
        if (longBreak >= 1 && longBreak <= 180) {
          prefs!.setInt(LONGBREAK, longBreak);
          setState(() {
            txtLong.text = longBreak.toString();
          });
        }
      } break;
    }
  }

  @override

  void initState(){
    txtWork = TextEditingController();
    txtShort = TextEditingController();
    txtLong = TextEditingController();
    readSettings();
    super.initState();
  }

  @override
  void dispose(){
    txtWork.dispose();
    txtShort.dispose();
    txtLong.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 24, color: Colors.white);
    return Scaffold(
      backgroundColor: Color(0xff0e1520),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff0e1520),
        title: Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
      body: SafeArea(
        child: GridView.count(
          scrollDirection: Axis.vertical,
          crossAxisCount: 3,
          childAspectRatio: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          padding: EdgeInsets.all(20),
          children: [
            Text(
              'Work',
              style: textStyle,
            ),
            SizedBox.shrink(),
            SizedBox.shrink(),
            SettingButton(
              color: Color(0xff009688), 
              text: '-', 
              value: -1, 
              size: 24, 
              setting: WORKTIME, 
              callback: (key, value) { 
                updateSettings(WORKTIME, -1); 
              },
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xff202a37),
              ),
              child: TextField(
                controller: txtWork,
                style: textStyle,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
            
            SettingButton(
              color: Color(0xff455A64), 
              text: '+', 
              value: 1, 
              size: 24, 
              setting: WORKTIME, 
              callback: (key, value) { 
                updateSettings(WORKTIME, 1);
              },
            ),
        
            Text(
              'Short',
              style: textStyle,
            ),
            SizedBox.shrink(),
            SizedBox.shrink(),
            SettingButton(
              color: Color(0xff009688), 
              text: '-', 
              value: -1, 
              size: 24, 
              setting: SHORTBREAK, 
              callback: (key, value) {
                updateSettings(SHORTBREAK, -1);
              },
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xff202a37),
              ),
              child: TextField(
                controller: txtShort,
                style: textStyle,
                textAlignVertical: TextAlignVertical.top,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
            SettingButton(
              color: Color(0xff455A64), 
              text: '+', 
              value: 1, 
              size: 24, 
              setting: SHORTBREAK, 
              callback: (key, value) {
                updateSettings(SHORTBREAK, 1);
              },
            ),
        
            Text(
              'Long',
              style: textStyle,
            ),
            SizedBox.shrink(),
            SizedBox.shrink(),
            SettingButton(
              color: Color(0xff009688), 
              text: '-', 
              value: -1, 
              size: 24, 
              setting: LONGBREAK, 
              callback: (key, value) {
                updateSettings(LONGBREAK, -1);
              },
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xff202a37),
              ),
              child: TextField(
                controller: txtLong,
                style: textStyle,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
            SettingButton(
              color: Color(0xff455A64), 
              text: '+', 
              value: 1, 
              size: 24, 
              setting: LONGBREAK, 
              callback: (key, value) {
                updateSettings(LONGBREAK, 1);
              },
            ),
          ],
        ),
      ),
    );
  }
}