import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nv1/pages/first_page.dart';
import 'package:flutter_nv1/pages/todo_list_page.dart';
import 'package:flutter_nv1/pages/value_listenable_page.dart';
import 'package:flutter_nv1/services/prefs_service.dart';
import 'navigator_page.dart';

class HomePage extends StatefulWidget {
  HomePage({required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

int _currentIndex = 0;


class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();
  bool _isAuthenticated  = false;

  @override
  Widget build(BuildContext context) {
    PrefsService.isAuth().then((value) {
     setState(() {
       _isAuthenticated = value;
     });
    });
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              accountName: Text('Felipe'),
              accountEmail: Text('felipe@user.com'),
              currentAccountPicture: const  CircleAvatar(
                backgroundColor: Colors.greenAccent,
                child: Text(
                    'F'
                ),
              ),
            ),
            ListTile(
              title: const Text('Home'),
              style: ListTileStyle.list,
              trailing: Icon(Icons.home),
              onTap: (){
                _pageController.jumpToPage(0);
                _currentIndex = 0;
                Navigator.of(context).pop();
                setState(() {});
              },
            ),
            ListTile(
              title: const Text('Lista de Tarefas'),
              style: ListTileStyle.list,
              trailing: const Icon(Icons.list, ),
              onTap: (){
                _pageController.jumpToPage(1);
                _currentIndex = 1;
                Navigator.of(context).pop();
                setState(() {});
              },
            ),
            ListTile(
              title: const Text('Navigator Page '),
              style: ListTileStyle.list,
              trailing: const Icon(Icons.picture_as_pdf_outlined),
              onTap: (){
                _pageController.jumpToPage(2);
                _currentIndex = 2;
                Navigator.of(context).pop();
                setState(() {});
              },
            ),
             ListTile(
              title: const Text('Botão para testar gerencia de Estado'),
              style: ListTileStyle.list,
              trailing: const Icon(Icons.manage_history_rounded),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ValueListenablePage()));
              },
            ),
             ListTile(
              title: const Text('Requisão API'),
              style: ListTileStyle.list,
              trailing: const Icon(Icons.http, size: 32,),
               onTap: () => Navigator.of(context).pushNamed('/http'),
            ),
            ListTile(
              title: const Text('Login'),
              trailing: const Icon(Icons.input),
              onTap: () => Navigator.of(context).pushNamed('/login'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Center(
          child: _currentIndex == 0 ?  Text(widget.title) : _currentIndex == 1 ? Text('Lista de Tarefas') : _currentIndex == 2 ?  Text('Navigator Page') : Container(),
        ),
        actions: [
           Visibility(
             visible: _isAuthenticated,
             child: IconButton(onPressed: () {
              PrefsService.logout();
              Navigator.of(context).pushNamedAndRemoveUntil('/login', (_) => true); //irá remover todas as rotas anteriores de login e navegar para login
          }, icon: const Icon(Icons.logout)),
           ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index){
          FocusScope.of(context).unfocus();
          _currentIndex = index;
          setState(() {});
        },
        children: const [
          //página 0
          FirstPage(),
          //página 1
          TodoListPage(),
          //página 2 e assim sucessivamente...
          NavigatorPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear);
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.list), label: 'Lista de Tarefas'),
          BottomNavigationBarItem(
            icon: Icon(Icons.picture_as_pdf_outlined),
            label: 'Navigator Page',
          ),
        ],
      ),
    );
  }
}
