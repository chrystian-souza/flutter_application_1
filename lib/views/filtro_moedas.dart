
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter_application_1/services/request_http.dart';


// void main() {
//   runApp(CurrencyQuoteApp());
// }

// class CurrencyQuoteApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Cotação de moedas',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: CurrencyQuotePage(),
//     );
//   }
// }

// class CurrencyQuotePage extends StatefulWidget {
//   @override
//   _CurrencyQuotePageState createState() => _CurrencyQuotePageState();
// }

// class _CurrencyQuotePageState extends State<CurrencyQuotePage> {
//   String _quote = 'Loading...';

//   @override
//   void initState() {
//     super.initState();
//     fetchCurrencyQuote();
//   }

//   Future<void> fetchCurrencyQuote() async {
//     try {
//       final data = await getProducts();
//       setState(() {
//         _quote = data['USDBRL']['bid'];
//       });
//     } catch (e) {
//       setState(() {
//         _quote = 'Falha ao carregar!';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Cotação de moedas'),
//       ),
//       body: Center(
//         child: Text(
//           'USD to BRL: $_quote',
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
// }
