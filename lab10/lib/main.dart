import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const double exchangeRate = 1.35;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Currency Converter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const InputScreen(),
    );
  }
}

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final TextEditingController usdController = TextEditingController();
  final TextEditingController cadController = TextEditingController();

  bool isUpdating = false;
  String errorMessage = '';

  @override
  void dispose() {
    usdController.dispose();
    cadController.dispose();
    super.dispose();
  }

  void convertFromUSD(String value) {
    if (isUpdating) return;
    isUpdating = true;

    setState(() {
      errorMessage = '';
    });

    if (value.trim().isEmpty) {
      cadController.text = '';
      isUpdating = false;
      return;
    }

    final double? usd = double.tryParse(value);

    if (usd == null) {
      cadController.text = '';
      setState(() {
        errorMessage = 'Please enter a valid numeric value.';
      });
    } else if (usd < 0) {
      cadController.text = '';
      setState(() {
        errorMessage = 'Please enter a positive number.';
      });
    } else {
      cadController.text = (usd * exchangeRate).toStringAsFixed(2);
    }

    isUpdating = false;
  }

  void convertFromCAD(String value) {
    if (isUpdating) return;
    isUpdating = true;

    setState(() {
      errorMessage = '';
    });

    if (value.trim().isEmpty) {
      usdController.text = '';
      isUpdating = false;
      return;
    }

    final double? cad = double.tryParse(value);

    if (cad == null) {
      usdController.text = '';
      setState(() {
        errorMessage = 'Please enter a valid numeric value.';
      });
    } else if (cad < 0) {
      usdController.text = '';
      setState(() {
        errorMessage = 'Please enter a positive number.';
      });
    } else {
      usdController.text = (cad / exchangeRate).toStringAsFixed(2);
    }

    isUpdating = false;
  }

  void goToSummary() {
    final String usdText = usdController.text.trim();
    final String cadText = cadController.text.trim();

    if (usdText.isEmpty && cadText.isEmpty) {
      setState(() {
        errorMessage = 'Please enter a value in USD or CAD.';
      });
      return;
    }

    final double? usd = double.tryParse(usdText);
    final double? cad = double.tryParse(cadText);

    if ((usdText.isNotEmpty && usd == null) ||
        (cadText.isNotEmpty && cad == null)) {
      setState(() {
        errorMessage = 'Only numeric values are allowed.';
      });
      return;
    }

    if ((usd != null && usd < 0) || (cad != null && cad < 0)) {
      setState(() {
        errorMessage = 'Negative values are not allowed.';
      });
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SummaryScreen(
          usd: usd ?? 0,
          cad: cad ?? 0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Converter'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),

            TextField(
              controller: usdController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'USD',
                border: OutlineInputBorder(),
                prefixText: '\$ ',
              ),
              onChanged: convertFromUSD,
            ),

            const SizedBox(height: 20),

            TextField(
              controller: cadController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'CAD',
                border: OutlineInputBorder(),
                prefixText: 'C\$ ',
              ),
              onChanged: convertFromCAD,
            ),

            const SizedBox(height: 16),

            if (errorMessage.isNotEmpty)
              Text(
                errorMessage,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                ),
              ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: goToSummary,
              child: const Text('Go to Summary'),
            ),
          ],
        ),
      ),
    );
  }
}

class SummaryScreen extends StatelessWidget {
  final double usd;
  final double cad;

  const SummaryScreen({
    super.key,
    required this.usd,
    required this.cad,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversion Summary'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      'USD: ${usd.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'CAD: ${cad.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Exchange Rate Used: 1 USD = 1.35 CAD',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back to Input Screen'),
            ),
          ],
        ),
      ),
    );
  }
}