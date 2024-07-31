import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'hugeicons.dart';
import 'styles.dart';
import 'favouritePage.dart';
import 'homePage.dart';
import 'clothesPage.dart';
import 'dysonPage.dart';
import 'healthPage.dart';
import 'footWearPage.dart';
import 'checkout_page.dart';
// import 'styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Uni_Store Kz',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: themeColor),
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
        page = const HomePage();
        break;
      case 2:
        page = ClothesPage();
        break;
      case 3:
        page = const FootWearPage();
        break;
      case 4:
        page = const DysonPage();
        break;
      case 5:
        page = const HealthPage();
        break;
      case 6:
        page = const FavouritePage();
        break;
      case 7:
        page = const CheckoutPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    final destinations = [              
      const NavigationRailDestination(
        icon: Stack(
          children: [
            CircleAvatar(
                maxRadius: 30, 
                minRadius: 20,
                backgroundImage: AssetImage('assets/logo.jpg'),
              ), 
          ],
        ),
        // label: Text(' ', style: TextStyle(color: Colors.transparent)),
        label: Text(
          'Uni_store Kz',
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold
          ),
        ),
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
      const NavigationRailDestination(
        icon: Icon(HugeIcons.strokeRoundedShoppingCartCheckOut01),
        label: Text('Checkout'),
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
