import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String phoneNumber;

  HomeScreen({required this.phoneNumber});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double cyclingDistance = 0.0;
  double runningDistance = 0.0;
  double earnings = 0.0;

  void _updateEarnings() {
    setState(() {
      earnings = (cyclingDistance * 2) + (runningDistance * 3);
    });
  }

  void _addActivity(String type) {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController distanceController = TextEditingController();
        return AlertDialog(
          title: Text('Add $type Distance (km)'),
          content: TextField(
            controller: distanceController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Distance in km'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                double km = double.tryParse(distanceController.text) ?? 0.0;
                setState(() {
                  if (type == 'Cycling') {
                    cyclingDistance += km;
                  } else {
                    runningDistance += km;
                  }
                  _updateEarnings();
                });
                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PayFit Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text('Welcome +91 ${widget.phoneNumber}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Card(
              child: ListTile(
                title: Text('Cycling Distance'),
                subtitle: Text('$cyclingDistance km'),
                trailing: Text('₹${(cyclingDistance * 2).toStringAsFixed(2)}'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Running Distance'),
                subtitle: Text('$runningDistance km'),
                trailing: Text('₹${(runningDistance * 3).toStringAsFixed(2)}'),
              ),
            ),
            Divider(),
            ListTile(
              title: Text('Total Earnings'),
              subtitle: Text('₹${earnings.toStringAsFixed(2)}'),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => _addActivity('Cycling'),
              child: Text('Add Cycling Distance'),
            ),
            ElevatedButton(
              onPressed: () => _addActivity('Running'),
              child: Text('Add Running Distance'),
            ),
          ],
        ),
      ),
    );
  }
}
