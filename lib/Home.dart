import 'dart:math';
import 'package:Lottery/Add.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '404.dart';
import 'Login.dart';
import 'package:fl_chart/fl_chart.dart';

class LotteryHomePage extends StatefulWidget {
  const LotteryHomePage({Key? key}) : super(key: key);

  @override
  _LotteryHomePageState createState() => _LotteryHomePageState();
}

class _LotteryHomePageState extends State<LotteryHomePage> {

  List<double> _generateChartData(String draw) {
    // Generate chart data based on the draw numbers
    List<double> data = [];
    for (int i = 0; i < draw.length; i++) {
      data.add(draw.codeUnitAt(i).toDouble());
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    // Format the current date
    String formattedDate = DateFormat('EEE MMM dd yyyy').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cerebro Lottery'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const SizedBox(
              height: 100, // Adjust the height as needed
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'STL',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text('Dashboard'),
              leading: const Icon(Icons.dashboard),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LotteryHomePage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Transactions'),
              leading: const Icon(Icons.monetization_on),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const UnderConstructionPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Report Summary'),
              leading: const Icon(Icons.description),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const UnderConstructionPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Payout'),
              leading: const Icon(Icons.attach_money),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const UnderConstructionPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Memos'),
              leading: const Icon(Icons.note),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const UnderConstructionPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Daily Report'),
              leading: const Icon(Icons.calendar_today),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const UnderConstructionPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Settings'),
              leading: const Icon(Icons.settings),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const UnderConstructionPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Logout'),
              leading: const Icon(Icons.logout),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Login(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 8.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Card(
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4.0),
                        color: Colors.transparent,
                        child: const Icon(
                          Icons.calendar_today,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 4.0),
                      Text(
                        formattedDate,
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: <Widget>[
                  const Material(
                    color: Colors.white,
                    child: TabBar(
                      indicatorSize: TabBarIndicatorSize.label,
                      labelColor: Colors.black,
                      // Set text color for selected tab
                      unselectedLabelColor: Colors.black,
                      // Set text color for unselected tab
                      tabs: [
                        Tab(
                          child: Text(
                            '3D',
                            style: TextStyle(
                                color:
                                    Colors.black), // Set text color for the tab
                          ),
                        ),
                        Tab(
                          child: Text(
                            'STL',
                            style: TextStyle(
                                color:
                                    Colors.black), // Set text color for the tab
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        // Content for the first tab (3D)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          // Add left and right margin
                          child: ListView.builder(
                            itemCount: 3, // Number of cards
                            itemBuilder: (context, index) {
                              String draw =
                                  _generateDraw(); // Generate a random draw
                              List<double> chartData = _generateChartData(draw);
                              return Card(
                                elevation: 5,
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '${_generatePrize()}',
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            '$draw',
                                            style:
                                                const TextStyle(fontSize: 16),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        '${_generateTime()}',
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      const SizedBox(height: 10),
                                      Container(
                                        height: 200,
                                        child: LineChart(
                                          LineChartData(
                                            gridData: FlGridData(show: false),
                                            titlesData:
                                                FlTitlesData(show: false),
                                            borderData:
                                                FlBorderData(show: false),
                                            lineBarsData: [
                                              LineChartBarData(
                                                spots: List.generate(
                                                    chartData.length, (index) {
                                                  return FlSpot(
                                                      index.toDouble(),
                                                      chartData[index]);
                                                }),
                                                isCurved: true,
                                                curveSmoothness: 0.5,
                                                // Adjust smoothness of the curve
                                                colors: [Colors.blue],
                                                barWidth: 3,
                                                isStrokeCapRound: true,
                                                belowBarData:
                                                    BarAreaData(show: false),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        // Content for the second tab (STL)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          // Add left and right margin
                          child: ListView.builder(
                            itemCount: 3, // Number of cards
                            itemBuilder: (context, index) {
                              String draw =
                                  _generateDraw(); // Generate a random draw
                              List<double> chartData = _generateChartData(draw);
                              return Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '${_generatePrize()}',
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            '$draw',
                                            style:
                                                const TextStyle(fontSize: 16),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        '${_generateTime()}',
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      const SizedBox(height: 10),
                                      Container(
                                        height: 200,
                                        child: LineChart(
                                          LineChartData(
                                            gridData: FlGridData(show: false),
                                            titlesData:
                                                FlTitlesData(show: false),
                                            borderData:
                                                FlBorderData(show: false),
                                            lineBarsData: [
                                              LineChartBarData(
                                                spots: List.generate(
                                                    chartData.length, (index) {
                                                  return FlSpot(
                                                      index.toDouble(),
                                                      chartData[index]);
                                                }),
                                                isCurved: true,
                                                curveSmoothness: 0.5,
                                                // Adjust smoothness of the curve
                                                colors: [Colors.blue],
                                                barWidth: 3,
                                                isStrokeCapRound: true,
                                                belowBarData:
                                                    BarAreaData(show: false),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddTick(),
            ),
          );
        },
        backgroundColor: const Color(0xff1f375b),
        child: const Icon(
          Icons.add,
          color: Color(0xffdfb153),
        ),
      ),
    );
  }

  // Function to generate random draw numbers
  String _generateDraw() {
    return '${_generateRandomNumber()}-${_generateRandomNumber()}-${_generateRandomNumber()}';
  }

  // Function to generate random prize amounts
  String _generatePrize() {
    double prize = Random().nextDouble() * 1000 +
        100; // Generate a random number between 100 and 1099
    return '\$${prize.toStringAsFixed(2)}'; // Format with 2 decimals
  }

  // Function to generate random time
  String _generateTime() {
    List<String> times = ['2PM', '5PM', '9PM'];
    return times[_generateRandomNumber() % 3];
  }

  // Function to generate random number between 0 and 9
  int _generateRandomNumber() {
    return DateTime.now().microsecondsSinceEpoch % 10;
  }
}
