import 'package:flutter/material.dart';

class TransactionHistoryPage extends StatelessWidget {
  final List<DataRow> transactionData;

  const TransactionHistoryPage({Key? key, required this.transactionData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction History'),
      ),
      body: ListView.builder(
        itemCount: transactionData.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Bet ${index + 1}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text('Num')),
                        DataColumn(label: Text('Game')),
                        DataColumn(label: Text('Type')),
                        DataColumn(label: Text('Time')),
                        DataColumn(label: Text('Amount')),
                      ],
                      rows: [transactionData[index]],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
