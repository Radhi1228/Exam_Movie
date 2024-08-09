import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movie_exam/screen/home/model/home_model.dart';
import 'package:movie_exam/utils/helper/api_helper.dart';
import '../../../utils/helper/shared_helper.dart';
import '../model/movie_model.dart';


  class HomeProvider with ChangeNotifier {
  MultiMovieModel? multiMovieModel;
  MovieModel? homeModel;
  String searchMovie = "teri";
  List<String> imageList = [];
  List<String> nameList = [];
  SharedHelper sharedHelper = SharedHelper();


  Future<void> setBookMark(String name1, String pImg) async {

    List<String> name = await sharedHelper.getNameList();
    List<String> img = await sharedHelper.getImageList();

    name.add(name1);
    img.add(pImg);

    sharedHelper.setNameList(name);
    sharedHelper.setImageList(img);

    notifyListeners();
  }
  Future<void> removeBookMark(String name1, String pImg) async {

    List<String> name = await sharedHelper.getNameList();
    List<String> img = await sharedHelper.getImageList();

    name.remove(name1);
    img.remove(pImg);

    sharedHelper.setNameList(name);
    sharedHelper.setImageList(img);

    getBookMark();

    notifyListeners();
  }

  Future<void> getBookMark() async {
    nameList = (await sharedHelper.getNameList());
    imageList = (await sharedHelper.getImageList());
    notifyListeners();

  }

  Future<void> movieCall() async {
  APIHelper apiHelper = APIHelper();
  MovieModel? h1 = await apiHelper.movieApiCall();
  homeModel = h1;
  notifyListeners();
  }

  Future<void> multiMovieCall() async {
  APIHelper helper = APIHelper();
  MultiMovieModel? m1 = await helper.multiMovieApiCall(searchMovie);
  multiMovieModel = m1;
  notifyListeners();
  }

  void searchedMovie(String search) {
  searchMovie = search;
  notifyListeners();
  }
  }
