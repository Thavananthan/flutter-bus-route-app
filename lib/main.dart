import 'package:colombo_bus_route_redesign_flutter/pages/busesInCurrentPlace.dart';
import 'package:colombo_bus_route_redesign_flutter/pages/currentPlaceToDestination.dart';
import 'package:colombo_bus_route_redesign_flutter/pages/routeNumber.dart';
import 'package:colombo_bus_route_redesign_flutter/pages/startToDestination.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ColomboBusRouteApp());
}

class ColomboBusRouteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomNavigationContainer(),
    );
  }
}

class BottomNavigationContainer extends StatefulWidget {
  BottomNavigationContainer({Key key}) : super(key: key);

  @override
  _BottomNavigationContainerState createState() =>
      _BottomNavigationContainerState();
}

class _BottomNavigationContainerState extends State<BottomNavigationContainer> {
  int currentTabIndex = 0;
  var heading = "Colombo Bus Route";

  List<Widget> tabs = [
    StartToDestinationPage(),
    CurrentPlaceToDestination(),
    RouteNumberPage(),
    BusesInCurrentPlace()
  ];
  onTapped(int index) {
    setState(() {
      currentTabIndex = index;
      if (currentTabIndex == 0) {
        heading = "Colombo Bus Route";
      } else if (currentTabIndex == 1) {
        heading = "Current Place To Destination";
      } else if (currentTabIndex == 2) {
        heading = "Route Number";
      } else if (currentTabIndex == 3) {
        heading = "Buses In Current";
      }
    });
  }

  //build bottom navigation
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentTabIndex],
      appBar: AppBar(
        title: Text(heading),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      drawer: Drawer(
        child: Material(
          color: Colors.white10,
          child: ListView(children: <Widget>[
            Container(
              child: Column(children: [
                const SizedBox(height: 100),
                ListTile(
                  leading:
                      Icon(Icons.directions_outlined, color: Colors.blueAccent),
                  title: Text('Start To Destination',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16)),
                  onTap: () => onTapped(0),
                ),
                const SizedBox(height: 16),
                ListTile(
                  leading: Icon(Icons.location_on_outlined,
                      color: Colors.blueAccent),
                  title: Text('Current Place To Destination',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16)),
                  onTap: () => onTapped(1),
                ),
                const SizedBox(height: 24),
                ListTile(
                  leading: Icon(
                    Icons.looks_one_outlined,
                    color: Colors.blueAccent,
                  ),
                  title: Text('Route Number',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16)),
                  onTap: () => onTapped(2),
                ),
                const SizedBox(height: 24),
                ListTile(
                  leading: Icon(
                    Icons.directions_bus_outlined,
                    color: Colors.blueAccent,
                  ),
                  title: Text('Buses In Current',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16)),
                  hoverColor: Colors.yellow,
                  onTap: () => onTapped(3),
                ),
              ]),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        iconSize: 24,
        onTap: onTapped,
        currentIndex: currentTabIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.directions_outlined), label: "Find"),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on_outlined), label: "From Here"),
          BottomNavigationBarItem(
              icon: Icon(Icons.looks_one_outlined), label: "Route"),
          BottomNavigationBarItem(
              icon: Icon(Icons.directions_bus_outlined), label: "Buses Here")
        ],
      ),
    );
  }
}
