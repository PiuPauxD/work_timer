import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:work_timer/timerModel.dart';
import 'package:work_timer/widgets.dart';
import 'timer.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Productivity timer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints){
          final double availableWidth = constraints.maxWidth;
          return Column(
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
              child: StreamBuilder<Object>(
                initialData: '00:00',
                stream: timer.stream(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  TimerModel timer = (snapshot.data == '00:00') ? TimerModel('00:00', 1) : snapshot.data;
                  return Expanded(
                    child: CircularPercentIndicator(
                      radius: availableWidth / 2,
                      lineWidth: 10,
                      percent: timer.percent,
                      center: Text(
                        timer.time,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 54,
                        ),
                      ),
                      progressColor: Color(0xff293f76),
                    ),
                  );
                }
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
          );
        },
      ),
    );
  }
}