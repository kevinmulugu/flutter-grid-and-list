import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  debugPaintSizeEnabled = false;
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  static final showGrid = true;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter layout demo'),
        ),
//        body: Center(child: showGrid ? OrientationBuilder(builder: (context, orientation) =>_buildGridWithCount(orientation),) : _buildList(),),
        body: Center(child: showGrid ? _buildGrid() : _buildList(),),
      ),
    );
  }

  Widget _buildGrid() => GridView.extent(
    maxCrossAxisExtent: 150,
    padding: EdgeInsets.all(4),
    crossAxisSpacing: 4,
    mainAxisSpacing: 4,
    children: _buildGridTileList(30)
  );

  Widget _buildGridWithCount(Orientation orientation) => GridView.count(
    crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
    padding: EdgeInsets.all(4.0),
    mainAxisSpacing: 4,
    crossAxisSpacing: 4,
    children: _buildGridTileListWithFooter(30),
  );

  List<Container> _buildGridTileList(int count) => List.generate(
      count, (index) => Container(child: Image.asset('images/pic$index.jpg', fit: BoxFit.cover,),)
  );

  List<GridTile> _buildGridTileListWithFooter(int count) => List.generate(
      count, (index) => GridTile(
        child: Image.asset(
          'images/pic$index.jpg',
          fit: BoxFit.cover,
        ),
        footer: Container(
          decoration: BoxDecoration(
            color: Colors.cyanAccent
          ),
          child: ListTile(
              title: Text(
                'Say something',
                style: TextStyle(
                    color: Colors.grey[400]
                ),
              ),
              subtitle: Text('Hakuna Matata'),
              leading: Icon(Icons.star, color: Colors.grey[200],)
          ),
        )
    )
  );

  Widget _buildList() => ListView(
    children: <Widget>[
      _tile('CineArts at the Empire', '85 W Portal Ave', Icons.theaters),
      _tile('The Castro Theater', '429 Castro St', Icons.theaters),
      _tile('Alamo Drafthouse Cinema', '2550 Mission St', Icons.theaters),
      _tile('Roxie Theater', '3117 16th St', Icons.theaters),
      _tile('United Artists Stonestown Twin', '501 Buckingham Way',
          Icons.theaters),
      _tile('AMC Metreon 16', '135 4th St #3000', Icons.theaters),
      Divider(),
      _tile('K\'s Kitchen', '757 Monterey Blvd', Icons.restaurant),
      _tile('Emmy\'s Restaurant', '1923 Ocean Ave', Icons.restaurant),
      _tile(
          'Chaiya Thai Restaurant', '272 Claremont Blvd', Icons.restaurant),
      _tile('La Ciccia', '291 30th St', Icons.restaurant),
    ],
  );

  ListTile _tile(String title, String subTitle, IconData icon) => ListTile(
    title: Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20
      ),
    ),
    subtitle: Text(
      subTitle
    ),
    leading: Icon(
      icon,
      color: Colors.blue[500],
    ),
  );
}

