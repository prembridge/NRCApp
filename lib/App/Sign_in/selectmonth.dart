
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
_loadCounter() async {
  final prefs = await SharedPreferences.getInstance();
  //Return String
  final stringValue = prefs.getString('stringValue');
  print("value in select:$stringValue");

}


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      //enable this line if you want test Dark Mode
      //theme: ThemeData.dark(),
      home: selectmonth(),
    );
  }
}

class selectmonth extends StatefulWidget {
  @override
  _selectmonthState createState() => _selectmonthState();
}

class _selectmonthState extends State<selectmonth> {
  final _formKey = GlobalKey<FormState>();
  final _openDropDownProgKey = GlobalKey<DropdownSearchState<String>>();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadCounter();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DropdownSearch Demo")),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            padding: EdgeInsets.all(4),
            children: <Widget>[
              ///Menu Mode with no searchBox
              DropdownSearch<String>(
                validator: (v) => v == null ? "required field" : null,
                hint: "Select a country",
                mode: Mode.MENU,
                showSelectedItem: true,
                items: ["Brazil", "Italia (Disabled)", "Tunisia", 'Canada'],
                label: "Menu mode *",
                showClearButton: true,
                onChanged: print,
                popupItemDisabled: (String s) => s.startsWith('I'),
                selectedItem: "Tunisia",
              ),

              Divider(),

              ///BottomSheet Mode with no searchBox
              DropdownSearch<String>(
                mode: Mode.BOTTOM_SHEET,
                maxHeight: 300,
                items: ["Brazil", "Italia", "Tunisia", 'Canada'],
                label: "Custom BottomShet mode",
                onChanged: print,
                selectedItem: "Brazil",
                showSearchBox: true,
                searchBoxDecoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
                  labelText: "Search a country",
                ),
                popupTitle: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorDark,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Country',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                popupShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
              )]
          )
        )
      )
    );
  }
 }