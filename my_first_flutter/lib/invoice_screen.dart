import 'package:flutter/material.dart';

class InvoiceScreen extends StatefulWidget {
  @override
  _InvoiceScreen createState() => _InvoiceScreen();
}

class _InvoiceScreen extends State<InvoiceScreen> {
  List<DropdownMenuItem<String>> listDrop = [];
  List<String> dropItems =["one","two","three"];
  String selectedOne;
  @override
  Widget build(BuildContext context) {
    loadDropdown();
    return Scaffold(
        appBar: new AppBar(
          title: new Text('Create Invoice'),
        ),
        backgroundColor: Colors.white,
        drawer: createDrawer(),
        body:new Row(
          children: <Widget>[
            new Container(
                color: Colors.black12,
                margin: EdgeInsets.fromLTRB(5, 20, 20, 5),
                height: 40,
                width: 150,
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: new Center(
                  child: new DropdownButtonHideUnderline(
                      child: new DropdownButton(
                          value: selectedOne,
                          hint: new Text('Please Select'),
                          isExpanded: true,
                          items: listDrop,
                          onChanged: (selected) {
                            selectedOne = selected;
                            setState(() {

                            });
                          }
                      ),
                  ),
                ),
            ),
            new Container(
                margin: EdgeInsets.fromLTRB(5, 20, 20, 5),
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                height: 40,
                width: 150,
                color: Colors.black12,
                child: new Center(
                  child: new DropdownButton(
                      hint: new Text('Please Select'),
                      isExpanded: true,
                      items: listDrop,
                      onChanged: (selected) {
                        print(selected);
                      }
                  ),
                )
            )
          ],
        )
    );
  }

  Drawer createDrawer() {
    return new Drawer(
      child: new ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: new Text("Pamitha Lakbodha"),
            accountEmail: new Text("pamitha99@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).platform == TargetPlatform.iOS
                  ? Colors.blue
                  : Colors.white,
              child: new Text(
                "A",
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          new ListTile(
            title: new Text('Create Invoice'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  void loadDropdown() {
    listDrop = [];
    listDrop =dropItems.map((val)=>new DropdownMenuItem<String>(child: new Text(val),value: val,)).toList();
//    listDrop.add(new DropdownMenuItem(
//      child: new Text('Text 1'),
//      value: 'one',
//    ));
//    listDrop.add(new DropdownMenuItem(
//      child: new Text('Text 2'),
//      value: 'two',
//    ));
//    listDrop.add(new DropdownMenuItem(
//      child: new Text('Text 3'),
//      value: 'three',
//    ));
  }
}
