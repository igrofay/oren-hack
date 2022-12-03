import 'package:dooking/domain/store/admin_store.dart';
import 'package:dooking/presentation/utils/Background.dart';
import 'package:dooking/res/constants.dart';
import 'package:dooking/res/theme/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

import '../../data/models/camp.dart';
import 'CampItem.dart';

class AdminPanelScreen extends StatelessWidget {

  //TODO DI
  AdminStore adminStore = AdminStore();

  AdminPanelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScaffold(
      child: Observer(
        builder: (_) => Column(
          children: [
            createAppBar(),
            Expanded(
              child: ListView.builder(
                itemCount: adminStore.camps.length,
                itemBuilder: (BuildContext context, int index) {
                  return CampItem(camp: adminStore.camps[index]);
                },

              ),
            ),
          ],
        ),
      )
    );
  }
  Widget createAppBar() {
    IconButton searchIcon = IconButton(onPressed: () {  }, icon: const Icon(Icons.search),);
    Widget searchBar = const Text("Панель администратора");

    return Container(
      height: HEIGHT,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(),
          searchBar,
          searchIcon
        ],
      ),
    );
  }
}