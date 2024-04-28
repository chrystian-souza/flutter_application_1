import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/request_http.dart';
import 'favoritos_page.dart';

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
  List<String> _favoritos = [];

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
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritosPage(favoritos: _favoritos),
                ),
              );
            },
            child: Text('Ir para Favoritos'),
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
                      return Column(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              margin: EdgeInsets.symmetric(vertical: 4.0),
                              child: ListTile(
                                title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(item['name']),
                                      IconButton(
                                        icon: Icon(Icons.favorite),
                                        color: _favoritos.contains(item['name']) ? Colors.red: Colors.grey,
                                        onPressed: () {
                                          _adicionarAosFavoritos(item['name']);
                                        },
                                       
                                      ),
                                    ]),
                                subtitle: Text(
                                    'Bid: ${item['bid']} - Ask: ${item['ask']} - Code: ${item['code']}'),
                              )),
                        ],
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

  void _adicionarAosFavoritos(String item) {
    setState(() {
      _favoritos.add(item);
      
    });
  }
}
