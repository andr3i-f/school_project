import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recourse/main.dart';

class AdminMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    var appState = context.watch<AppState>();

    return Center(
      child: Text('Placeholder'),
    );
  }
}
