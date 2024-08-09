import 'package:flutter/material.dart';
import 'package:movie_exam/screen/home/provider/home_provider.dart';
import 'package:movie_exam/utils/routes/app_routes.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(
      MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: HomeProvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: app_routes,
    )
  ));
}