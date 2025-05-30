import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:work_timer/settingsScreen.dart';
import 'package:work_timer/timerModel.dart';
import 'package:work_timer/widgets.dart';
import 'timer.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Productivity timer',
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final double defaultPadding = 5.0;
  final CountDownTimer timer = CountDownTimer();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    void goToSettings(BuildContext context){
      Navigator.push(
        context, 
        MaterialPageRoute(
          builder: (context) => SettingsScreen(),
        ),
      );
    }

    final List<PopupMenuItem<String>> menuItems = [];
    menuItems.add(
      PopupMenuItem(
        value: 'Settings',
        child: Text(
          'Settings',
        ),
      ),
    );
    timer.startWork();
    return Scaffold(
      backgroundColor: Color(0xff0e1520),
      appBar: AppBar(
        backgroundColor: Color(0xff0e1520),
        title: Text(
          'Productivity timer',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            iconColor: Colors.white,
            itemBuilder: (BuildContext context) {
              return menuItems.toList();
            },
            onSelected: (s) {
              if (s == 'Settings') {
                goToSettings(context);
              }
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints){
          return SafeArea(
            child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(defaultPadding),
                  ),
                  Expanded(
                    child: Buttons(
                      color: Color(0xff192230), 
                      name: 'Work', 
                      size: 24, 
                      onPressed: () => timer.startWork(),
                    ), 
                  ),
                    
                  Padding(
                    padding: EdgeInsets.all(defaultPadding),
                  ),
                  Expanded(
                    child: Buttons(
                      color: Color(0xff192230), 
                      name: 'Short Break', 
                      size: 24, 
                      onPressed: () => timer.startBreak(true),
                    ), 
                  ),
                    
                  Padding(
                    padding: EdgeInsets.all(defaultPadding),
                  ),
                  Expanded(
                    child: Buttons(
                      color: Color(0xff192230), 
                      name: 'Long Break', 
                      size: 24, 
                      onPressed: () => timer.startBreak(false),
                    ), 
                  ),
                ],
              ),
            
              Expanded(
                child: StreamBuilder<TimerModel>(
                stream: timer.stream(),
                builder: (BuildContext context, AsyncSnapshot<TimerModel> snapshot) {
                  final timerData = snapshot.data ?? TimerModel('00:00', 1);
                  return CircularPercentIndicator(
                    radius:150,
                    lineWidth: 10,
                    animation: false,
                    percent: timerData.percent.clamp(0.01, 1.0),
                    center: Text(
                      timerData.time,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 54,
                      ),
                    ),
                    progressColor: Color(0xff293f76),
                  );
                },
              ),

              ),
                    
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(defaultPadding),
                  ),
                  Expanded(
                    child: Buttons(
                      color: Color(0xff192230), 
                      name: 'Stop', 
                      size: 24, 
                      onPressed: () => timer.stopTimer(),
                    ), 
                  ),
                  Padding(
                    padding: EdgeInsets.all(defaultPadding),
                  ),
                  Expanded(
                    child: Buttons(
                      color: Color(0xff192230), 
                      name: 'Start', 
                      size: 24, 
                      onPressed: () => timer.startTimer(),
                    ), 
                  ),
                  ],
                
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 15,),
              ],
            ),
          );
        },
      ),
    );
  }
}