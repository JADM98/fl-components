import 'package:fl_components/themes/app_themes.dart';
import 'package:flutter/material.dart';

class ListViewBuilderScreen extends StatefulWidget {
  const ListViewBuilderScreen({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderScreen> createState() => _ListViewBuilderScreenState();
}

class _ListViewBuilderScreenState extends State<ListViewBuilderScreen> {
  List<int> imageIds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  ScrollController scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.pixels + 500.0 >=
          scrollController.position.maxScrollExtent) {
        //add5();

        fetchData();
      }
    });
  }

  Future fetchData() async {
    if (isLoading) return;

    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 3));

    add5();
    isLoading = false;
    setState(() {});

    if (scrollController.position.pixels + 200.0 >=
        scrollController.position.maxScrollExtent) {
      scrollController.animateTo(scrollController.position.pixels + 150,
          duration: const Duration(milliseconds: 600), curve: Curves.ease);
    }
  }

  void add5() {
    final int lastId = imageIds.last;
    imageIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Future<void> _onRefresh() async {
      await Future.delayed(const Duration(seconds: 2));
      final lastId = imageIds.last;
      imageIds.clear();
      imageIds.add(lastId + 1);
      add5();
    }

    return Scaffold(
      body: Center(
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          removeBottom: true,
          child: Stack(
            children: [
              RefreshIndicator(
                color: AppThemes.primary,
                onRefresh: _onRefresh,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: scrollController,
                  itemCount: imageIds.length,
                  itemBuilder: (context, index) {
                    return FadeInImage(
                        width: double.infinity,
                        height: 300,
                        fit: BoxFit.cover,
                        placeholder: const AssetImage('assets/jar-loading.gif'),
                        image: NetworkImage(
                            'https://picsum.photos/500/300?image=${imageIds[index]}'));
                  },
                ),
              ),
              if (isLoading)
                Positioned(
                  child: const _LoadIcon(),
                  bottom: 40,
                  left: size.width / 2 - 30,
                )
            ],
          ),
        ),
      ),
    );
  }
}

class _LoadIcon extends StatelessWidget {
  const _LoadIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: 60,
      height: 60,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: Colors.white.withOpacity(0.75)),
      child: const CircularProgressIndicator(),
    );
  }
}
