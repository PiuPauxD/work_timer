import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:work_timer/widgets.dart';

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
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
                    onPressed: emtyMethod,
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
                    onPressed: emtyMethod,
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
                    onPressed: emtyMethod,
                  ), 
                ),
              ],
            ),

            
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: CircularPercentIndicator(
                  radius: availableWidth / 2,
                  lineWidth: 10,
                  percent: 1,
                  center: Text(
                    '30:00',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  progressColor: Color(0xff293f76),
                ),
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
                    onPressed: emtyMethod,
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
                    onPressed: emtyMethod,
                  ), 
                ),
                  Padding(
                  padding: EdgeInsets.all(defaultPadding),
                 ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  void emtyMethod(){}

}