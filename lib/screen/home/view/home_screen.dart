import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;
  TextEditingController searchTxt = TextEditingController();
  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().movieCall();
    context.read<HomeProvider>().multiMovieCall();
    searchTxt.addListener((){
      context.read<HomeProvider>().searchedMovie(searchTxt.text);
    });

  }
  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(top: 5,right: 10,left: 10),
            child: SearchBar(
              controller: searchTxt,
              backgroundColor: WidgetStatePropertyAll(Colors.grey.shade800),
              leading: const Icon(Icons.search),
              hintText: 'Search your fav movie',
              // overlayColor: WidgetStatePropertyAll(Colors.white),
              // surfaceTintColor: WidgetStatePropertyAll(Colors.white),
              textStyle: const WidgetStatePropertyAll(TextStyle(color:Colors.white)),
              elevation:
              const WidgetStatePropertyAll(0),
              shape: const WidgetStatePropertyAll(
                  BeveledRectangleBorder(
                      borderRadius:
                      BorderRadius.horizontal(
                        left: Radius.circular(15),
                        right: Radius.circular(15),
                      ))),
              onSubmitted: (value) {
                providerR!.searchedMovie(value);
                providerR!.multiMovieCall();
              },
            ),
          ),
          const SizedBox(height: 20),
          providerW!.multiMovieModel == null
              ? const Center(child: CircularProgressIndicator())
              : Expanded(
            child: GridView.builder(
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisExtent: 340
              ),
              itemCount: providerW!.multiMovieModel!.searchList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/detail',
                        arguments: providerW!
                            .multiMovieModel!.searchList[index]);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            "${providerW!.multiMovieModel!.searchList[index].poster}",
                          ),
                        ),
                      ),
                      Text(
                        '${providerW!.multiMovieModel!.searchList[index].title}',
                        style: const TextStyle(
                            color: Colors.white, fontSize: 18,
                          overflow: TextOverflow.ellipsis
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Padding(
              padding: const EdgeInsets.only(left: 10),
              child: InkWell(
                onTap: (){
                  Navigator.pushNamed(context, '/liked');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Favorite Movies",
                      style: TextStyle(fontSize: 18,
                        color: Colors.white
                      ),
                    ),
                    IconButton(onPressed: (){
                      Navigator.pushNamed(context, '/liked');
                    }, icon: const Icon(Icons.favorite_border,
                      color: Colors.white,
                    ))
                  ],
                ),
              ),
                      ),
            ],
          ),
        ),
      ),
    );
  }
}
