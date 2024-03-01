import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddTick extends StatefulWidget {
  const AddTick({Key? key}) : super(key: key);

  @override
  _AddTickState createState() => _AddTickState();
}

class _AddTickState extends State<AddTick> {
  String selectedGame = '3D'; // Initialize with a default game selection
  String selectedTiming = '2PM'; // Initialize with a default timing selection
  String selectedType =
      'Straight'; // Initialize with a default timing selection
  TextEditingController betNumberController = TextEditingController();
  TextEditingController betAmountController = TextEditingController();

  @override
  void dispose() {
    betNumberController.dispose();
    betAmountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(
                context); // Pop the current screen when the leading icon is tapped
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text('Add Transactions'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      // Selection for 3D and STL
                      Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () =>
                                    setState(() => selectedGame = '3D'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: selectedGame == '3D'
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                                child: const Text('3D'),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () =>
                                    setState(() => selectedGame = 'STL'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: selectedGame == 'STL'
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                                child: const Text('STL'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Selection for the time
                      Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () =>
                                    setState(() => selectedTiming = '2:00 PM'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: selectedTiming == '2:00 PM'
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                                child: const Text('2:00 PM'),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () =>
                                    setState(() => selectedTiming = '5:00 PM'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: selectedTiming == '5:00 PM'
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                                child: const Text('5:00 PM'),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () =>
                                    setState(() => selectedTiming = '9:00 PM'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: selectedTiming == '9:00 PM'
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                                child: const Text('9:00 PM'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Selection for the type raffle type
                      Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () =>
                                    setState(() => selectedType = 'Straight'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: selectedType == 'Straight'
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                                child: const Text('Straight'),
                              ),
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () =>
                                    setState(() => selectedType = 'Rambled'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: selectedType == 'Rambled'
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                                child: const Text('Rambled'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Input for the Bet number and amount
                      Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: betNumberController,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        LengthLimitingTextInputFormatter(3),
                                        _BetNumberInputFormatter(),
                                      ],
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        labelText: 'Bet Number',
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: TextField(
                                      controller: betAmountController,
                                      keyboardType:
                                          const TextInputType.numberWithOptions(
                                              decimal: true),
                                      decoration: const InputDecoration(
                                        labelText: 'Bet Amount',
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              SizedBox(
                                width: 300.0,
                                height: 40.0,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Add logic to confirm the bet
                                  },
                                  child: const Text('ADD BET'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Table Card
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      // Table Card
                      Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(
                              columns: const [
                                DataColumn(label: Text('Num')),
                                DataColumn(label: Text('Game')),
                                DataColumn(label: Text('Type')),
                                DataColumn(label: Text('Time')),
                                DataColumn(label: Text('Amount')),
                              ],
                              rows: [
                                DataRow(cells: [
                                  DataCell(Text(betNumberController.text)),
                                  DataCell(Text(selectedGame)),
                                  DataCell(Text(selectedType)),
                                  DataCell(Text(selectedTiming)),
                                  DataCell(Text(betAmountController.text)),
                                ]),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 300.0,
                        height: 40.0,
                        child: ElevatedButton(
                          onPressed: () {
                            // Add logic to confirm the bet
                          },
                          child: const Text('SUBMIT BET'),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 300.0,
                        height: 40.0,
                        child: ElevatedButton(
                          onPressed: () {
                            // Add logic to confirm the bet
                          },
                          child: const Text('CONNECT PRINTER'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BetNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final String formattedText =
        newValue.text.replaceAll(RegExp(r'[^0-9]'), '').split('').join('-');
    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
