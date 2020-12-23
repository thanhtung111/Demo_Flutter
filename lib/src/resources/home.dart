import 'package:flutter/material.dart';
// void main(){
//   runApp(new MaterialApp(home: new Text('Xin chao 12')));
// }
void main() {
  runApp(MyHome());
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'My home',
      home: HomePage(),
      theme: ThemeData(
          primarySwatch: Colors.orange,
          brightness: Brightness.light,
          accentColor: Colors.green),
    );
  }
}


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String myText = 'Hello Thanh Tung';
  void _clickedMe() {
    setState(() {
      if (myText.startsWith('H'))
        myText = 'Welcome to Flutter demo App';
      else
        myText = 'Hello Thanh Tung';
    });
  }

  Choice _selectedChoice = choices[0]; // The app's "state".
  void _select(Choice choice) {
    // Causes the app to rebuild with the new _selectedChoice.
    setState(() {
      _selectedChoice = choice;
    });
  }


//________________________________Menu Bottom___________________________________________
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }



  Widget _bodyWidget() {
    return Container(
      padding: EdgeInsets.all(50),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ChoiceCard(choice: _selectedChoice),

            RaisedButton(
              child: Text(
                myText,
                style: TextStyle(color: Colors.white),
              ),
              onPressed: _clickedMe,
              color: Colors.blue,
            ),

            _widgetOptions.elementAt(_selectedIndex)
          ],

        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              tooltip: 'Menu',
              color: Colors.white,
              onPressed: () {
                _select(choices[0]);
              },
            ),
            Container(
                padding: const EdgeInsets.all(8.0),
                child: Text('Home Page',
                    style: TextStyle(
                      color: Colors.white,
                    ))),
            IconButton(
              icon: Icon(choices[0].icon),
              color: Colors.white,
              onPressed: () {
                _select(choices[0]);
              },
            ),
            // action button
            IconButton(
              icon: Icon(choices[1].icon),
              color: Colors.white,
              onPressed: () {
                _select(choices[1]);
              },
            ),
            // overflow menu
            PopupMenuButton<Choice>(
              onSelected: _select,
              color: Colors.white,
              itemBuilder: (BuildContext context) {
                return choices.skip(2).map((Choice choice) {//skip(2) co 6 phan tu, lay tu phan tu so 2 ve sau
                  return PopupMenuItem<Choice>(
                    value: choice,
                    child: Row(
                        children: <Widget>[
                          Icon(choice.icon, color: Colors.orange),
                          Text(
                            choice.title,
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ]
                    ),
                    // child: Text(choice.title, style: TextStyle(
                    //   color: Colors.red,
                    // ),),
                  );
                }).toList();
              },
            ),
          ],
        ),
      ),
      body: _bodyWidget(),
      //body: _DemoListView(),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, //
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Suport',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Account',
          ),
        ],

        //currentIndex: _selectedIndex,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),

    );
  }
}



/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//________________________________Menu Bottom___________________________________________
const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
const List<Widget> _widgetOptions = <Widget>[
  Text(
    'Index 0: Home',
    style: optionStyle,
  ),
  Text(
    'Index 1: Suport',
    style: optionStyle,
  ),
  Text(
    'Index 2: Notification',
    style: optionStyle,
  ),
  Text(
    'Index 3: Account',
    style: optionStyle,
  ),
];





//________________________________Menu Header___________________________________________
class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'Bicycle', icon: Icons.directions_bike),
  const Choice(title: 'Boat', icon: Icons.directions_boat),
  const Choice(title: 'Bus', icon: Icons.directions_bus),
  const Choice(title: 'Train', icon: Icons.directions_railway),
  const Choice(title: 'Walk', icon: Icons.directions_walk),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 128.0, color: textStyle.color),
            Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}


class _DemoListView extends StatelessWidget {
  final items = List<String>.generate(100, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {

    final titles = ['bike', 'boat', 'bus', 'car',
      'railway', 'run', 'subway', 'transit', 'walk'];

    final icons = [Icons.directions_bike, Icons.directions_boat,
      Icons.directions_bus, Icons.directions_car, Icons.directions_railway,
      Icons.directions_run, Icons.directions_subway, Icons.directions_transit,
      Icons.directions_walk];

    return ListView.builder(
      itemCount: titles.length,
      itemBuilder: (context, index) {
        return Card( //                           <-- Card widget
          child: ListTile(
            leading: Icon(icons[index]),
            title: Text(titles[index]),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              //print(titles[index]);
              showAlertDialog(context, 'Thông báo', 'Bạn đã chọn '+titles[index]);
            },
          ),
        );
      },
    );

    //   // return ListView.builder(
    //   //   scrollDirection: Axis.horizontal,
    //   //   itemBuilder: (context, index) {
    //   //     return Container(
    //   //       margin: const EdgeInsets.symmetric(horizontal: 1.0),
    //   //       color: Colors.tealAccent,
    //   //       child: Text('$index'),
    //   //     );
    //   //   },
    //   // );
  }
}
showAlertDialog(BuildContext context, title, content) {

  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Text("Cancel"),
    onPressed:  () {print('Cancel');},
  );
  Widget continueButton = FlatButton(
    child: Text("Continue"),
    onPressed:  () {print('Continue');},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(content),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

