import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:hugeicons/hugeicons.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Uni_Store',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 236, 180, 236)),
        ),
        home: const MyHomePage(),     
    );
  }
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  var selectedIndex=1;

  @override
  Widget build(BuildContext context) {
    
    Widget page;
    switch (selectedIndex) {
      case 1:
        page = const GeneratorPage();
        break;
      case 6:
        page = const FavouritePage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    final destinations = [              
      const NavigationRailDestination(
        icon: Stack(
          children: [
            CircleAvatar(
                radius: 40, 
                backgroundImage: AssetImage('assets/logo.jpg'),
              ), 
          ],
        ),
        label: Text(' ', style: TextStyle(color: Colors.transparent)),
        // label: Text(
        //   'Uni_store',
        //   style: TextStyle(
        //     fontSize: 16.0,
        //     fontWeight: FontWeight.bold
        //   ),
        //   ),
      ),

      const NavigationRailDestination(
        icon: Icon(HugeIcons.strokeRoundedHome09),
        label: Text('Home'),
      ),
      const NavigationRailDestination(
        icon: Icon(HugeIcons.strokeRoundedDress01),
        label: Text('Clothes'),
      ),
      const NavigationRailDestination(
        icon: Icon(HugeIcons.strokeRoundedRunningShoes),
        label: Text('Footwear'),
      ),
      const NavigationRailDestination(
        icon: Icon(HugeIcons.strokeRoundedHairDryer),
        label: Text('Dyson'),
      ),
      const NavigationRailDestination(
        icon: Icon(HugeIcons.strokeRoundedMedicineBottle01),
        label: Text('Health product'),
      ),
      const NavigationRailDestination(
        icon: Icon(HugeIcons.strokeRoundedFavourite),
        label: Text('Favorites'),
      ),
      ];

    var mainArea = ColoredBox(
      color: Theme.of(context).colorScheme.surfaceContainer,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
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
                      destinations: destinations,
                      selectedIndex: selectedIndex,
                      onDestinationSelected: (value) {
                        setState(() {
                          selectedIndex=value;
                        });
                        
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
                        destinations: destinations,
                        selectedIndex: selectedIndex,
                        onDestinationSelected: (value) {
                          if (value != 0) {
                            setState(() {
                              selectedIndex = value;
                          });
                          }
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
  const FavouritePage({super.key});
  @override
  Widget build(BuildContext context) {
      return const Center(
        child: Text('No favourites yet.'),
      );
  }
}


class GeneratorPage extends StatelessWidget {
  const GeneratorPage({super.key});
  @override
  Widget build(BuildContext context) {


    final theme = Theme.of(context);
    final style = theme.textTheme.displaySmall!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontStyle: FontStyle.normal,
      );

    final style1 = theme.textTheme.displaySmall!.copyWith(
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
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Shopping with Oxana",
                  style: style1),
                ),
              ),
            const SizedBox(height: 100),
            
            Card(
              
              color: Theme.of(context).colorScheme.primary,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "My personal Insta",
                  style: style),
                ),
              ),
            const SizedBox(height: 20),
            Card(
              color: Theme.of(context).colorScheme.primary,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Uni_store online Kz",
                  style: style),
                ),
              ),
            const SizedBox(height: 20),
            Card(
              color: Theme.of(context).colorScheme.primary,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Offline_store Astana",
                  style: style),
                ),
              ),
            const SizedBox(height: 20),
            Card(
              color: Theme.of(context).colorScheme.primary,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Health product",
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