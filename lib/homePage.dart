import 'package:flutter/material.dart';
import 'styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
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
                  style: style1(context)),
                ),
              ),
            const SizedBox(height: 100),      
            Card(            
              color: Theme.of(context).colorScheme.primary,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "My personal Insta",
                  style: style(context)),
                ),
              ),
            const SizedBox(height: 20),
            Card(
              color: Theme.of(context).colorScheme.primary,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Uni_store online Kz",
                  style: style(context)),
                ),
              ),
            const SizedBox(height: 20),
            Card(
              color: Theme.of(context).colorScheme.primary,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Offline_store Astana",
                  style: style(context)),
                ),
              ),
            const SizedBox(height: 20),
            Card(
              color: Theme.of(context).colorScheme.primary,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Health product",
                  style: style(context)),
                ),
              ),
          ],
        ),
    );
  }
}