import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/request_http.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Map<String, dynamic>> _futureData;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _futureData = getProducts();
    _searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Cotações'),
          centerTitle: true,
          backgroundColor: Color(0xFF00BCD4)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                labelText: 'Pesquisar',
                hintText: 'Digite para pesquisar...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: _futureData,
              builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                      child:
                          Text('Erro ao carregar os dados: ${snapshot.error}'));
                } else {
                  var filteredData = (snapshot.data ?? {}).values.where(
                      (item) => item['name']
                          .toString()
                          .toLowerCase()
                          .startsWith(_searchController.text.toLowerCase()));

                  return ListView.builder(
                    itemCount: filteredData.length,
                    itemBuilder: (context, index) {
                      var item = filteredData.elementAt(index);
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey), // Cor e estilo da borda
                          borderRadius: BorderRadius.circular(
                              8.0), // Raio do canto da borda
                        ),
                        margin: EdgeInsets.symmetric(
                            vertical: 4.0), // Margem entre os itens
                        child: ListTile(
                          title: Text(item['name']),
                          subtitle: Text(
                              'Bid: ${item['bid']} - Ask: ${item['ask']} - Code: ${item['code']}'),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
