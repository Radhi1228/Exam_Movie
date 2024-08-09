import 'package:flutter/cupertino.dart';
import 'package:movie_exam/screen/detail/view/detail_screen.dart';
import 'package:movie_exam/screen/home/view/home_screen.dart';
import 'package:movie_exam/screen/liked/view/liked_screen.dart';
import 'package:movie_exam/screen/splash/view/splash_screen.dart';

Map<String,WidgetBuilder> app_routes =
{
    '/' : (c1) => const SplashScreen(),
    '/home' : (c1) => const HomeScreen(),
    '/detail' : (c1) => const DetailScreen(),
    '/liked' : (c1) => const LikedScreen(),
};