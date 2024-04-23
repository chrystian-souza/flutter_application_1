import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/exibicao_moedas.dart';


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();

  int indexBottonNavigationBar = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Chrystian'),
              accountEmail: Text('Chrystian.souza@gmail.com'),
              currentAccountPicture: CircleAvatar(
                child: Text('C'),
                backgroundColor: Colors.orangeAccent,
              ),
            ),
          ListTile(
            title: Text('Item 1'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              _pageController.jumpToPage(0);
              Navigator.pop(context);
               setState(() {
            indexBottonNavigationBar = 0;
          });
            },
          ),
           ListTile(
            title: Text('Item 2'),
            trailing: Icon(Icons.arrow_forward),
              onTap: () {
              _pageController.jumpToPage(1);
               Navigator.pop(context);
                setState(() {
            indexBottonNavigationBar = 1;
          });
            },
          ),
           ListTile(
            title: Text('Item 3'),
            trailing: Icon(Icons.arrow_forward),
              onTap: () {
              _pageController.jumpToPage(2);
               Navigator.pop(context);
                setState(() {
            indexBottonNavigationBar = 2;
          });
            },
          )
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: [
          OnePage(),
          Container(color: const Color.fromARGB(96, 244, 52, 52)),
          Container(color: Colors.brown)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexBottonNavigationBar,
        // onTap: (int index) => _pageController.jumpToPage(index),
        onTap: (int page) {
          setState(() {
            indexBottonNavigationBar = page;
          });
          _pageController.animateToPage(page,
              duration: Duration(milliseconds: 300), curve: Curves.ease);
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.local_laundry_service_sharp), label: 'Item 1'),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_laundry_service_sharp), label: 'Item 2'),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_laundry_service_sharp), label: 'Item 3')
        ],
      ),
    );
  }
}
