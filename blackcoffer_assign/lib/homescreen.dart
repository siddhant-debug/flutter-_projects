//import 'package:blackcoffer_assign/mydrawer.dart';
import 'package:blackcoffer_assign/reports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<charts.Series> seriesList;
  static List<charts.Series<Accidents, String>> _createRandom() {
    final random = Random();
    final accidentsData = [
      Accidents('2016', random.nextInt(100)),
      Accidents('2017', random.nextInt(100)),
      Accidents('2018', random.nextInt(100)),
      Accidents('2019', random.nextInt(100)),
      Accidents('2020', random.nextInt(100)),
    ];
    final caracciData = [
      Accidents('2016', random.nextInt(100)),
      Accidents('2017', random.nextInt(100)),
      Accidents('2018', random.nextInt(100)),
      Accidents('2019', random.nextInt(100)),
      Accidents('2020', random.nextInt(100)),
    ];
    final truckacciData = [
      Accidents('2016', random.nextInt(100)),
      Accidents('2017', random.nextInt(100)),
      Accidents('2018', random.nextInt(100)),
      Accidents('2019', random.nextInt(100)),
      Accidents('2020', random.nextInt(100)),
    ];
    return [
      charts.Series<Accidents, String>(
          id: 'Accidents',
          domainFn: (Accidents accidents, _) => accidents.year,
          measureFn: (Accidents accidents, _) => accidents.numAccidents,
          data: accidentsData,
          fillColorFn: (Accidents accidents, _) {
            return (accidents.year == '2016')
                ? charts.MaterialPalette.red.shadeDefault
                : charts.MaterialPalette.pink.shadeDefault;
          }),
      charts.Series<Accidents, String>(
          id: 'Accidents',
          domainFn: (Accidents accidents, _) => accidents.year,
          measureFn: (Accidents accidents, _) => accidents.numAccidents,
          data: caracciData,
          fillColorFn: (Accidents accidents, _) {
            return (accidents.year == '2016')
                ? charts.MaterialPalette.red.shadeDefault
                : charts.MaterialPalette.pink.shadeDefault;
          }),
      charts.Series<Accidents, String>(
          id: 'Accidents',
          domainFn: (Accidents accidents, _) => accidents.year,
          measureFn: (Accidents accidents, _) => accidents.numAccidents,
          data: truckacciData,
          fillColorFn: (Accidents accidents, _) {
            return (accidents.year == '2016')
                ? charts.MaterialPalette.red.shadeDefault
                : charts.MaterialPalette.pink.shadeDefault;
          })
    ];
  }

  barChart() {
    return charts.BarChart(
      seriesList,
      animate: true,
      vertical: true,
      barGroupingType: charts.BarGroupingType.groupedStacked,
    );
  }

  @override
  void initState() {
    super.initState();
    seriesList = _createRandom();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      drawer: Drawer(
        elevation: 7,
        child: Container(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.black38),
                accountName: Text('Siddhant Tomar'),
                accountEmail: Text('siddhanttomar@hotmail.com'),
                currentAccountPicture: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade600,
                        offset: Offset(0, 10),
                        blurRadius: 20,
                      ),
                    ],
                    //shape: BoxShape.circle,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'MIS',
                  style: TextStyle(fontSize: 20),
                ),
                leading: Icon(
                  Icons.home,
                  size: 30,
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReportPage(),
                    ),
                  );
                },
                title: Text(
                  'Reports',
                  style: TextStyle(fontSize: 20),
                ),
                leading: Icon(
                  Icons.assignment_turned_in_outlined,
                  size: 30,
                ),
              ),
              ListTile(
                title: Text(
                  'Daily Logs',
                  style: TextStyle(fontSize: 20),
                ),
                leading: Icon(
                  Icons.assignment_rounded,
                  size: 30,
                ),
              ),
              ListTile(
                title: Text(
                  'Safety meeting loggers',
                  style: TextStyle(fontSize: 20),
                ),
                leading: Icon(
                  Icons.account_balance_wallet_sharp,
                  size: 30,
                ),
              ),
              ListTile(
                title: Text(
                  'Internal Audit Reports',
                  style: TextStyle(fontSize: 20),
                ),
                leading: Icon(
                  Icons.analytics_outlined,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade600,
                      offset: Offset(0, 10),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: barChart(),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade600,
                      offset: Offset(0, 8),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: barChart(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Accidents {
  final String year;
  final int numAccidents;

  Accidents(this.year, this.numAccidents);
}
