import 'package:flutter/material.dart';
import './home_view_model.dart';

class HomeView extends HomeViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home View"),
      ),
      body: Column(
        children: [
          CircleAvatar(
            child: Image.network(userModel?.imageUrl ?? ""),
          )
        ],
      ),
    );
  }
}
