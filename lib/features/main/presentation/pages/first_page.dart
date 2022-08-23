import 'package:flutter/material.dart';

import '../../domain/usecases/get_home_store.dart';
import '../widgets/home_list_widget.dart';

class FirstPage extends StatelessWidget {
  FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // GetHomeStore getHomeStore;
    // print(getHomeStore.homeRepository.getHomePage.call);
    return Scaffold(
      appBar: AppBar(title: Text('1')),
      body: HomeList(),
    );
  }
}
