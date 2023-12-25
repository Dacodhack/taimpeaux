import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

void main() {
  runApp(Chrono());
}

class Chrono extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChronoPage(),
    );
  }
}

class ChronoPage extends StatefulWidget {
  @override
  _ChronoPageState createState() => _ChronoPageState();
}

class _ChronoPageState extends State<ChronoPage> {
  DateTime currentTime = DateTime.now();
  int timerDuration = 0;
  List<int> timers = [];
  bool isRunning = false;
  int currentTimerIndex = 0;
  late List<int> timerList;

  @override
  void initState() {
    super.initState();
    timerList = List.from(timers);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chrono')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Heure de la séance: ${currentTime.hour}:${currentTime.minute}:${currentTime.second}'),
            SizedBox(height: 20),
            Text('Temps du minuteur: $timerDuration secondes'),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      timerDuration += 5;
                    });
                  },
                  child: Text('Ajouter 5 secondes'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      timers.add(timerDuration);
                      timerList = List.from(timers);
                      Vibration.vibrate(duration: 200);
                      timerDuration = 0;
                    });
                  },
                  child: Text('Ajouter au minuteur'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('Liste des minuteurs:'),
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: timerList.length,
              itemBuilder: (context, index) {
                return Text(
                  'Minuteur ${index + 1}: ${timerList[index]} secondes',
                  style: TextStyle(fontWeight: index == currentTimerIndex ? FontWeight.bold : FontWeight.normal),
                );
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: isRunning ? null : () => startTimers(),
                  child: Text('Démarrer'),
                ),
                ElevatedButton(
                  onPressed: isRunning ? () => stopTimers() : null,
                  child: Text('Arrêter'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void startTimers() {
    if (timerList.isNotEmpty) {
      setState(() {
        isRunning = true;
        currentTimerIndex = 0;
      });
      _runTimerLoop();
    }
  }

  void stopTimers() {
    setState(() {
      isRunning = false;
    });
  }

  void _runTimerLoop() async {
    while (isRunning) {
      await Future.delayed(Duration(seconds: timerList[currentTimerIndex]));
      Vibration.vibrate(duration: 500);
      if (currentTimerIndex == timerList.length - 1) {
        currentTimerIndex = 0;
      } else {
        currentTimerIndex++;
      }
      setState(() {});
    }
  }
}
