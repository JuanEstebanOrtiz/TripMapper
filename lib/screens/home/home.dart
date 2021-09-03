import 'package:flutter/material.dart';
import 'package:pruebauno/screens/home/pages/pageHome.dart';
import 'package:pruebauno/screens/home/pages/pageMap.dart';
import 'package:pruebauno/screens/home/pages/pageSetting.dart';
import 'package:pruebauno/services/auth.dart';
//import 'package:pruebauno/screens/home/pages/negocio.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int pageIndex = 1;
  final PageHome _home = PageHome();
  final PageMap _listMap = PageMap();
  final PageSetting _setting = PageSetting();

  Widget _showPage = new PageHome();

  Widget _pageChooser(int page){
    switch (page) {
      case 1:
      return _home;
      break;
      case 0:
      return _listMap;
      break;
      case 2:
      return _setting;
      break;
      default:
      return new Container(
        child: new Center(
          child: new Text(
            'No Page Found By Page Chooser',
            style: new TextStyle(fontSize: 30),
          ),
        ),
      );
    }
  }

  final AuthService _auth = new AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trip Mapper'),
        backgroundColor: Color.fromRGBO(0,77,64, 1),
        elevation: 0.0,
        actions: <Widget>[
          // ignore: deprecated_member_use
          FlatButton.icon(
            icon: Icon(Icons.power_settings_new, color: Colors.white),
            label: Text(''),
            onPressed: () async {
              await _auth.singOut();
            },
          )
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: pageIndex,
        items: <Widget>[
          Icon(Icons.location_on, size: 30, color: Colors.white),
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.settings, size: 30, color: Colors.white)
        ],
        color: Color.fromRGBO(0,77,64, 1),
        buttonBackgroundColor: Color.fromRGBO(0,77,64, .7),
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (int tappedIndex) {
          setState(() {
            _showPage = _pageChooser(tappedIndex);
          });
        },
        letIndexChange: (index) => true,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: _showPage,
        ),
      ),
      /*drawer: Container(
        width: 170.0,
        child: Drawer(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            color: Colors.black,
            child: new ListView(
              padding: EdgeInsets.only(top: 50.0),
              children: <Widget>[
                Container(
                  height: 120,
                  child: new UserAccountsDrawerHeader(
                    accountName: new Text(''),
                    accountEmail: new Text(''),
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/clock.png')
                      ),
                    ),
                  ),
                ),
                new Divider(),
                new ListTile(
                  title: new Text(
                    'Home',
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: new Icon(
                    Icons.home,
                    size: 30.0,
                    color: Colors.white
                  ),
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => Negocio(),
                  )),
                ),
                new Divider(),
                new ListTile(
                  title: new Text(
                    'Negocio',
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: new Icon(
                    Icons.home,
                    size: 30.0,
                    color: Colors.white
                  ),
                  onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => Negocio(),
                  )),
                ),
              ],
            ),
          ),
        ),
      ),*/
    );
  }
}

