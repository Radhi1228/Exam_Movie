import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home/model/movie_model.dart';
import '../../home/provider/home_provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    SearchModel m2 = ModalRoute.of(context)!.settings.arguments as SearchModel;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: const Text(
          "",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network('${m2.poster}'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width:250,
                      child: Text(
                        '${m2.title}',
                        style: const TextStyle(color: Colors.white, fontSize: 28),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '${m2.year}',
                      style:
                          const TextStyle(fontSize: 15, color: Colors.white70),
                    ),
                    //const SizedBox(width: 15),
                    IconButton(
                      onPressed: () {
                        context
                            .read<HomeProvider>()
                            .setBookMark(m2.title!, m2.poster!);
                      },
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // const Column(children: [
              //   Text(
              //     '',
              //     style:
              //     TextStyle(fontSize: 15, color: Colors.white70),
              //   ),
              // ],),
              // const SizedBox(height: 20),
              const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    child: Text(
                      "What is a film? A film, also called a movie or a motion picture, is a series of still photographs on film projected onto a screen using light in rapid succession. The optical phenomenon known as persistence of vision gives the illusion of actual, smooth, and continuous movement.",
                      style: TextStyle(
                          color: Colors.white,
                          textBaseline: TextBaseline.ideographic,
                          wordSpacing: 02),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 8, left: 8),
                    child: Text(
                      "What is a film? A film, also called a movie or a motion picture, is a series of still photographs on film projected onto a screen using light in rapid succession. The optical phenomenon known as persistence of vision gives the illusion of actual, smooth, and continuous movement.",
                      style: TextStyle(
                          color: Colors.white,
                          textBaseline: TextBaseline.ideographic,
                          wordSpacing: 02),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
