import 'package:flutter/material.dart';
import 'package:modern_authentication/show_modal.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showMyDialog(context);
            },
            icon: Icon(
              Icons.logout,
            ),
          )
        ],
      ),
      body: const Center(
        child: Text(
          "Logged in",
        ),
      ),
    );
  }
}
