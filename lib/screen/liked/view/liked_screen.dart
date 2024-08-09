import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home/provider/home_provider.dart';

class LikedScreen extends StatefulWidget {
  const LikedScreen({super.key});

  @override
  State<LikedScreen> createState() => _LikedScreenState();
}

class _LikedScreenState extends State<LikedScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeProvider>().getBookMark();
  }

  @override
  Widget build(BuildContext context) {
    providerW = context.watch<HomeProvider>();
    providerR = context.read<HomeProvider>();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Your favorite movies..',
          style: TextStyle(color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: providerW!.nameList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              color: Colors.white.withOpacity(0.2)),
                          child: Row(
                            children: [
                              Image.network(
                                providerR!.imageList[index],
                                height: 80,
                                width: 80,
                              ),
                              Column(
                                children: [
                                  Text(
                                    providerW!.nameList[index],
                                    style: const TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              IconButton(
                                  onPressed: () {
                                    providerW!.removeBookMark(
                                        providerW!.nameList[index],
                                        providerW!.imageList[index]);
                                    const SnackBar(
                                      content: Text("Unsaved Successfully"),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.favorite,
                                    color: Colors.white,
                                  ))
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
