import 'package:flutter/material.dart';

void main() {
  runApp(DividendCalculatorApp());
}

class DividendCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dividend Calculator',
      theme: ThemeData(
        primaryColor: Color(0xFF81C784),
        scaffoldBackgroundColor: Color(0xFFF1F8E9),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF81C784),
          foregroundColor: Colors.white,
          elevation: 2,
        ),
        drawerTheme: DrawerThemeData(
          backgroundColor: Colors.white,
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.grey[800]),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF81C784),
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 14),
            textStyle: TextStyle(fontSize: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _amountController = TextEditingController();
  final _rateController = TextEditingController();
  final _monthsController = TextEditingController(text: '1');

  double? monthlyDividend;
  double? totalDividend;

  void calculateDividend() {
    final amount = double.tryParse(_amountController.text);
    final rate = double.tryParse(_rateController.text);
    final months = int.tryParse(_monthsController.text);

    if (amount != null && rate != null && months != null && months <= 12 && months > 0) {
      monthlyDividend = (rate / 100 / 12) * amount;
      totalDividend = monthlyDividend! * months;
      setState(() {});
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid input. Check values and try again.')),
      );
    }
  }

  void resetFields() {
    _amountController.clear();
    _rateController.clear();
    _monthsController.text = '1';
    monthlyDividend = null;
    totalDividend = null;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dividend Calculator')),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(children: [
          Center(
            child: Text(
              'Dividend Calculator App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal[800],
              ),
            ),
          ),
          SizedBox(height: 16),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(children: [
                Center(
                  child: Icon(Icons.attach_money, size: 80, color: Colors.teal),
                ),
                SizedBox(height: 20),
                Text(
                  'Enter Investment Details',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _amountController,
                  decoration: InputDecoration(labelText: 'Invested Amount (RM)'),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 12),
                TextField(
                  controller: _rateController,
                  decoration: InputDecoration(labelText: 'Annual Dividend Rate (%)'),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 12),
                DropdownButtonFormField<int>(
                  value: int.tryParse(_monthsController.text),
                  decoration: InputDecoration(labelText: 'Months Invested (1-12)'),
                  items: List.generate(12, (index) {
                    int month = index + 1;
                    return DropdownMenuItem(
                      value: month,
                      child: Text('$month Month${month > 1 ? 's' : ''}'),
                    );
                  }),
                  onChanged: (value) {
                    if (value != null) {
                      _monthsController.text = value.toString();
                    }
                  },
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: calculateDividend,
                        child: Text('Calculate'),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: resetFields,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                        ),
                        child: Text('Reset'),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ),
          SizedBox(height: 24),
          if (monthlyDividend != null && totalDividend != null)
            Card(
              color: Colors.teal[50],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(children: [
                  Text('Result',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Divider(),
                  Text(
                    'Monthly Dividend: RM ${monthlyDividend!.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Total Dividend: RM ${totalDividend!.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 16),
                  ),
                ]),
              ),
            ),
        ]),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About')),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(children: [
          Center(
            child: Icon(Icons.account_circle, size: 100, color: Colors.teal),
          ),
          SizedBox(height: 20),
          Text(
            'User Information',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: Icon(Icons.person, color: Colors.teal),
              title: Text('NURSYAHIRAH BINTI LUDIN'),
              subtitle: Text('Name'),
            ),
          ),
          SizedBox(height: 12),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: Icon(Icons.numbers, color: Colors.teal),
              title: Text('2023371795'),
              subtitle: Text('Matric Number'),
            ),
          ),
          SizedBox(height: 12),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: Icon(Icons.school, color: Colors.teal),
              title: Text('MOBILE TECHNOLOGY DEVELOPMENT'),
              subtitle: Text('Course'),
            ),
          ),
          SizedBox(height: 20),
          Divider(),
          Text('© 2025 All Rights Reserved', style: TextStyle(fontSize: 14)),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('GitHub URL clicked')),
              );
            },
            child: Text(
              'GitHub: https://github.com/yourusername/Dividend_Calculator',
              style: TextStyle(
                fontSize: 14,
                color: Colors.teal,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        DrawerHeader(
          decoration: BoxDecoration(color: Color(0xFF81C784)),
          child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home'),
          onTap: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage()));
          },
        ),
        ListTile(
          leading: Icon(Icons.info),
          title: Text('About'),
          onTap: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => AboutPage()));
          },
        ),
      ]),
    );
  }
}
