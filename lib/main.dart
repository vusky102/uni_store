import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 236, 180, 236)),
        ),
        home: MyHomePage(),
        
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  var history = <WordPair>[];

  GlobalKey? historyListKey;

  void getNext() {
    history.insert(0,current);
    var animatedList = historyListKey?.currentState as AnimatedListState?;
    animatedList?.insertItem(0);
    current = WordPair.random();
    notifyListeners();
  }

  var favourites = <WordPair>[];

  void toggleFavourite() {
    if (favourites.contains(current)) {
      favourites.remove(current);
    } else {
      favourites.add(current);
    }
    notifyListeners();
  }

}


class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  var selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    
  Widget page;
  switch (selectedIndex) {
    case 0:
      page = GeneratorPage();
      break;
    case 1:
      page = FavouritePage();
      break;
    default:
      throw UnimplementedError('no widget for $selectedIndex');
  }

  var mainArea = ColoredBox(
    color: Theme.of(context).colorScheme.surfaceContainer,
    child: AnimatedSwitcher(
      duration: Duration(milliseconds: 200),
      child:page,
    ),  
  );  
    
    return Scaffold(
    body: LayoutBuilder(
      builder: (context,constraints) {
        if (constraints.maxWidth<450) {
          return Column(
            children: [
              
              Expanded(child: mainArea),
              SafeArea(
                child: NavigationRail(
                  extended: constraints.maxWidth>=600,
                  destinations: [
                    NavigationRailDestination(
                        icon: Icon(Icons.home),
                        label: Text('Home'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.add_shopping_cart),
                        label: Text('Clothes'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.add_shopping_cart),
                        label: Text('Footwear'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.add_shopping_cart),
                        label: Text('Dyson'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.add_shopping_cart),
                        label: Text('Health product'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.favorite),
                        label: Text('Favorites'),
                      ),
                  ],
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (value) {
                    setState(() {
                      selectedIndex=value;
                    });
                    print('seclected: $value');
                  },
                ),
              ),
              
            ],
          
          );
        } else {
            return Row(
              children: [
                SafeArea(
                  child: NavigationRail(
                    extended: constraints.maxWidth >= 600,
                    destinations: [
                      
                      NavigationRailDestination(
                        icon: Icon(Icons.home),
                        label: Text('Home'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.add_shopping_cart),
                        label: Text('Clothes'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.add_shopping_cart),
                        label: Text('Footwear'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.add_shopping_cart),
                        label: Text('Dyson'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.add_shopping_cart),
                        label: Text('Health product'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.favorite),
                        label: Text('Favorites'),
                      ),
                    ],
                    selectedIndex: selectedIndex,
                    onDestinationSelected: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
                    },
                  ),
                ),
                Expanded(child: mainArea),
              ],
            );
          }
        },
      ),
    );
  }
}

class FavouritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var fav=appState.favourites;

    if (appState.favourites.isEmpty) {
      return Center(
        child: Text('No favourites yet.'),
      );
    }

    return ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
          
            child: Text('You have ''${fav.length} favourites:'),
            ),
            for (var a in fav)
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text(a.asLowerCase),
              ),
                
            
        ],
      );
        
    
  }
}


class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair=appState.current;

    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontStyle: FontStyle.normal,
      );

    final style1 = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onSecondary,
      fontStyle: FontStyle.italic,
      );

    // IconData icon;
    // if (appState.favourites.contains(pair)) {
    //   icon = Icons.favorite;
    // } else {
    //   icon = Icons.favorite_border;
    // }

    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            Card(
              color: Theme.of(context).colorScheme.secondary,
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Text(
                  "Shopping with Oxana",
                  style: style1),
                ),
              ),
            SizedBox(height: 100,),
            Card(
              color: Theme.of(context).colorScheme.primary,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "My personal Insta",
                  style: style),
                ),
              ),
            Card(
              color: Theme.of(context).colorScheme.primary,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Uni_store online Kz",
                  style: style),
                ),
              ),
            Card(
              color: Theme.of(context).colorScheme.primary,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Offline_store Astana",
                  style: style),
                ),
              ),
            Card(
              color: Theme.of(context).colorScheme.primary,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Cook Diary",
                  style: style),
                ),
              ),
            // SizedBox(height: 10,),
            // Row(
            //   mainAxisSize: MainAxisSize.min,
            //   children: [
            //     ElevatedButton.icon(
            //       onPressed: () {
            //         appState.toggleFavourite();
            //       },
            //       icon: Icon(icon),
            //       label: Text('Like'),
            //     ),
            //     SizedBox(width: 10),

            //     ElevatedButton(
            //       onPressed: () {
            //         appState.getNext();
            //         print('button pressed!');
            //       },
            //       child: Text('Next'),
            //     ),
            //   ],
            // ),
            
          ],
        ),
      
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontStyle: FontStyle.normal,
      );
    

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20.0),

        child: Text(
          "${pair.first}  ${pair.second}", 
          style: style,
          semanticsLabel: "${pair.first}  ${pair.second}",
        ),
      ),
    );
  }
}

// class HistoryListView extends StatefulWidget {
//   const HistoryListView({Key? key}) : super(key: key);

//   @override
//   State<HistoryListView> createState() => _HistoryListViewState();
// }

// class _HistoryListViewState extends State<HistoryListView> {
//   /// Needed so that [MyAppState] can tell [AnimatedList] below to animate
//   /// new items.
//   final _key = GlobalKey();

//   /// Used to "fade out" the history items at the top, to suggest continuation.
//   static const Gradient _maskingGradient = LinearGradient(
//     // This gradient goes from fully transparent to fully opaque black...
//     colors: [Colors.transparent, Colors.black],
//     // ... from the top (transparent) to half (0.5) of the way to the bottom.
//     stops: [0.0, 0.5],
//     begin: Alignment.topCenter,
//     end: Alignment.bottomCenter,
//   );

//   @override
//   Widget build(BuildContext context) {
//     final appState = context.watch<MyAppState>();
//     appState.historyListKey = _key;

//     return ShaderMask(
//       shaderCallback: (bounds) => _maskingGradient.createShader(bounds),
//       // This blend mode takes the opacity of the shader (i.e. our gradient)
//       // and applies it to the destination (i.e. our animated list).
//       blendMode: BlendMode.dstIn,
//       child: AnimatedList(
//         key: _key,
//         reverse: true,
//         padding: EdgeInsets.only(top: 100),
//         initialItemCount: appState.history.length,
//         itemBuilder: (context, index, animation) {
//           final pair = appState.history[index];
//           return SizeTransition(
//             sizeFactor: animation,
//             child: Center(
//               child: TextButton.icon(
//                 onPressed: () {
//                   appState.toggleFavourite();
//                 },
//                 icon: appState.favourites.contains(pair)
//                     ? Icon(Icons.favorite, size: 12)
//                     : SizedBox(),
//                 label: Text(
//                   pair.asLowerCase,
//                   semanticsLabel: pair.asPascalCase,
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }