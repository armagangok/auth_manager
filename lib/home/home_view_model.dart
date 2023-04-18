import 'package:auth_manager/core/auth_manager.dart';
import 'package:auth_manager/home/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './home.dart';

abstract class HomeViewModel extends State<Home> {
  UserModel? userModel;

  @override
  void initState() {
    userModel = context.read<AuthManager>().userModel;
    setState(() {});
    super.initState();
  }
}
