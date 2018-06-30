import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String _action;

class SearchList extends StatefulWidget {
  SearchList({ Key key }) : super(key: key);
  @override
  _SearchListState createState() => new _SearchListState();

}

class _SearchListState extends State<SearchList>
{
  Widget appBarTitle = new Text("Medewerkers zoeken", style: new TextStyle(color: Colors.white),);
  Icon actionIcon = new Icon(Icons.search, color: Colors.white,);
  final key = new GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = new TextEditingController();
  List<String> _list;
  bool _IsSearching;
  String _searchText = "";

  _SearchListState() {
    _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty) {
        setState(() {
          _IsSearching = false;
          _searchText = "";
        });
      }
      else {
        setState(() {
          _IsSearching = true;
          _searchText = _searchQuery.text;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _IsSearching = false;
    init();

  }

  void init() {
    _list = List();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: key,
      appBar: buildBar(context),
      body: new StreamBuilder(
        stream: Firestore.instance.collection('medewerkers').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Text('Loading...');
          return new ListView.builder(
            itemCount: snapshot.data.documents.length,
            padding: new EdgeInsets.symmetric(vertical: 8.0),
            itemExtent: 25.0,
            itemBuilder: (context, index) {
              DocumentSnapshot ds = snapshot.data.documents[index];
              _list.add("${ds['firstname']} ${ds['lastname']}");
              _IsSearching ? _buildSearchList() : _buildList();
            }
          );
        }
      ),
    );
  }

  List<ChildItem> _buildList() {
    return _list.map((contact) => new ChildItem(contact)).toList();
  }

  List<ChildItem> _buildSearchList() {
    if (_searchText.isEmpty) {
      return _list.map((contact) => new ChildItem(contact))
          .toList();
    }
    else {
      List<String> _searchList = List();
      for (int i = 0; i < _list.length; i++) {
        String  name = _list.elementAt(i);
        if (name.toLowerCase().contains(_searchText.toLowerCase())) {
          _searchList.add(name);
        }
      }
      return _searchList.map((contact) => new ChildItem(contact))
          .toList();
    }
  }

  Widget buildBar(BuildContext context) {
    return new AppBar(
        centerTitle: true,
        title: appBarTitle,
        actions: <Widget>[
          new IconButton(icon: actionIcon, onPressed: () {
            setState(() {
                this.actionIcon = new Icon(Icons.close, color: Colors.white,);
                this.appBarTitle = 
                new TextField(
                  controller: _searchQuery,
                  style: new TextStyle(
                    color: Colors.white,
                  ),
                  decoration: new InputDecoration(
                      prefixIcon: new Icon(Icons.search, color: Colors.white),
                      hintText: "Zoek medewerker...",
                      hintStyle: new TextStyle(color: Colors.white)
                  ),
                );

            });
          },),
        ]
    );
  }
}

class ChildItem extends StatelessWidget {
  final String name;
  ChildItem(this.name);
  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: new Text(this.name),
      onTap: () {
        if (_action == "verwijderen") {
          //alert -> Zeker?
        } else {
          Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) {
              return ; //something
            }
          ));
        }
      }
    );
  }

}