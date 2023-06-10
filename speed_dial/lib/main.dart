import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

void main() => runApp(const MyApp());



class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var theme = ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Flutter Speed Dial Example';
    return MaterialApp(
      title: appTitle,
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[900],
      ),

    );
  }
}











class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


    ValueNotifier<bool> isDialOpen = ValueNotifier<bool>(false);


   var  positiones=[

      FloatingActionButtonLocation.startFloat,
      FloatingActionButtonLocation.centerFloat,
      FloatingActionButtonLocation.endFloat,
      FloatingActionButtonLocation.startTop,
      FloatingActionButtonLocation.centerTop,
      FloatingActionButtonLocation.endTop,

   ];
  @override
  Widget build(BuildContext context) {


    return Scaffold(


      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      floatingActionButton: SpeedDial(
        direction: SpeedDialDirection.up,
        switchLabelPosition: false,
        // animatedIcon: AnimatedIcons.arrow_menu,
        // animatedIconTheme: const IconThemeData(size: 22.0),
        //  child: Text("open"),
        // activeChild: const Text("close"),
        icon: Icons.folder_open_rounded,
        activeIcon: Icons.close,
        spacing: 2,
        mini: false,
        openCloseDial: isDialOpen,
        childPadding: const EdgeInsets.all(5),
        spaceBetweenChildren: 2,

        ///custom button design
        /*dialRoot: (ctx, open, toggleChildren) {
          return ElevatedButton(
            onPressed: toggleChildren,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[900],
              padding: const EdgeInsets.symmetric(
                  horizontal: 22, vertical: 18),
            ),
            child: const Text(
              "Custom Dial Root",
              style: TextStyle(fontSize: 17),
            ),
          );
        },*/
        buttonSize: Size(56.0, 56.0),
        childrenButtonSize: Size(50.0, 50.0),
        ///allow label to floating button
       // label:  const Text("Open") ,
       // activeLabel:  const Text("Close") ,

         labelTransitionBuilder: (widget, animation) => ScaleTransition(scale: animation,child: widget),

        visible: true,

        isOpenOnStart: false,
        closeManually: false,
        renderOverlay: false,
        overlayOpacity: 0.5,
        overlayColor: Colors.black,

        foregroundColor: Colors.black,
        backgroundColor: Colors.orange,
        activeForegroundColor: Colors.white,
        activeBackgroundColor: Colors.green,
        onOpen: () => debugPrint('OPENING DIAL'),
        onClose: () => debugPrint('DIAL CLOSED'),
        useRotationAnimation: true,
        tooltip: 'Open Speed Dial',
        heroTag: 'speed-dial-hero-tag',

        elevation: 8.0,
        animationCurve: Curves.elasticIn,

        shape:const StadiumBorder(),
         //childMargin: const EdgeInsets.symmetric(horizontal: 5, vertical: 2.5),
        children: [
          SpeedDialChild(
            child: const Icon(Icons.accessibility) ,
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            label: 'First',
            onTap: () => debugPrint('first CHILD'),
            onLongPress: () => debugPrint('FIRST CHILD LONG PRESS'),
          ),
          SpeedDialChild(
            child:  const Icon(Icons.brush,size: 15,) ,
            backgroundColor: Colors.deepOrange,
            foregroundColor: Colors.white,
            visible: true,
            label: 'Second',
            onTap: () => debugPrint('SECOND CHILD'),
          ),
          SpeedDialChild(
            child:  const Icon(Icons.margin) ,
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
            label: 'third',
            visible: true,
            onTap: () => debugPrint('third'),
            onLongPress: () => debugPrint('THIRD CHILD LONG PRESS'),
          ),
          SpeedDialChild(
            child:  const Icon(Icons.ac_unit_outlined) ,
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
            label: 'fourth',
            visible: true,
            onTap: () => debugPrint('fourth'),
            onLongPress: () => debugPrint('fourth CHILD LONG PRESS'),
          ),
          SpeedDialChild(
            child:  const Icon(Icons.add_chart_rounded) ,
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            label: 'fifth',
            visible: true,
            onTap: () => debugPrint('fifth'),
            onLongPress: () => debugPrint('fifth CHILD LONG PRESS'),
          ),
          SpeedDialChild(
            child:  Center(child: const Icon(Icons.adb_outlined)) ,
            backgroundColor: Colors.purple,
            foregroundColor: Colors.white,
            label: 'sexth',

            onTap: () => debugPrint('sexth'),
            onLongPress: () => debugPrint('sexth CHILD LONG PRESS'),
          ),
        ],
      ),

    );
  }
}






















class MyHomePage extends StatefulWidget {
  final ValueNotifier<ThemeMode> theme;
  const MyHomePage({Key? key, required this.theme}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  var renderOverlay = true;
  var visible = true;
  var switchLabelPosition = false;
  var extend = false;
  var mini = false;
  var rmicons = false;
  var customDialRoot = false;
  var closeManually = false;
  var useRAnimation = true;
  var isDialOpen = ValueNotifier<bool>(false);
  var speedDialDirection = SpeedDialDirection.up;
  var buttonSize = const Size(56.0, 56.0);
  var childrenButtonSize = const Size(56.0, 56.0);
  var selectedfABLocation = FloatingActionButtonLocation.endDocked;
  var items = [
    FloatingActionButtonLocation.startFloat,
    FloatingActionButtonLocation.startDocked,
    FloatingActionButtonLocation.centerFloat,
    FloatingActionButtonLocation.endFloat,
    FloatingActionButtonLocation.endDocked,
    FloatingActionButtonLocation.startTop,
    FloatingActionButtonLocation.centerTop,
    FloatingActionButtonLocation.endTop,
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isDialOpen.value) {
          isDialOpen.value = false;
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Speed Dial Example"),
        ),

        floatingActionButtonLocation: selectedfABLocation,
        floatingActionButton: SpeedDial(
          // animatedIcon: AnimatedIcons.menu_close,
          // animatedIconTheme: IconThemeData(size: 22.0),
          // / This is ignored if animatedIcon is non null
          // child: Text("open"),
          // activeChild: Text("close"),
          icon: Icons.add,
          activeIcon: Icons.close,
          spacing: 3,
          mini: mini,
          openCloseDial: isDialOpen,
          childPadding: const EdgeInsets.all(5),
          spaceBetweenChildren: 4,
          dialRoot: customDialRoot
              ? (ctx, open, toggleChildren) {
            return ElevatedButton(
              onPressed: toggleChildren,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[900],
                padding: const EdgeInsets.symmetric(
                    horizontal: 22, vertical: 18),
              ),
              child: const Text(
                "Custom Dial Root",
                style: TextStyle(fontSize: 17),
              ),
            );
          }
              : null,
          buttonSize:
          buttonSize, // it's the SpeedDial size which defaults to 56 itself
          // iconTheme: IconThemeData(size: 22),
          label: extend
              ? const Text("Open")
              : null, // The label of the main button.
          /// The active label of the main button, Defaults to label if not specified.
          activeLabel: extend ? const Text("Close") : null,

          /// Transition Builder between label and activeLabel, defaults to FadeTransition.
          // labelTransitionBuilder: (widget, animation) => ScaleTransition(scale: animation,child: widget),
          /// The below button size defaults to 56 itself, its the SpeedDial childrens size
          childrenButtonSize: childrenButtonSize,
          visible: visible,
          direction: speedDialDirection,
          switchLabelPosition: switchLabelPosition,

          /// If true user is forced to close dial manually
          closeManually: closeManually,

          /// If false, backgroundOverlay will not be rendered.
          renderOverlay: renderOverlay,
          // overlayColor: Colors.black,
          // overlayOpacity: 0.5,
          onOpen: () => debugPrint('OPENING DIAL'),
          onClose: () => debugPrint('DIAL CLOSED'),
          useRotationAnimation: useRAnimation,
          tooltip: 'Open Speed Dial',
          heroTag: 'speed-dial-hero-tag',
          // foregroundColor: Colors.black,
          // backgroundColor: Colors.white,
          // activeForegroundColor: Colors.red,
          // activeBackgroundColor: Colors.blue,
          elevation: 8.0,
          animationCurve: Curves.elasticInOut,
          isOpenOnStart: false,
          shape: customDialRoot
              ? const RoundedRectangleBorder()
              : const StadiumBorder(),
          // childMargin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          children: [
            SpeedDialChild(
              child: !rmicons ? const Icon(Icons.accessibility) : null,
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              label: 'First',
              onTap: () => setState(() => rmicons = !rmicons),
              onLongPress: () => debugPrint('FIRST CHILD LONG PRESS'),
            ),
            SpeedDialChild(
              child: !rmicons ? const Icon(Icons.brush) : null,
              backgroundColor: Colors.deepOrange,
              foregroundColor: Colors.white,
              label: 'Second',
              onTap: () => debugPrint('SECOND CHILD'),
            ),
            SpeedDialChild(
              child: !rmicons ? const Icon(Icons.margin) : null,
              backgroundColor: Colors.indigo,
              foregroundColor: Colors.white,
              label: 'Show Snackbar',
              visible: true,
              onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text(("Third Child Pressed")))),
              onLongPress: () => debugPrint('THIRD CHILD LONG PRESS'),
            ),
          ],
        ),

      ),
    );
  }
}