import 'package:dooking/domain/store/admin_store.dart';
import 'package:dooking/presentation/utils/Background.dart';
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
      appBar: AppBar(
        backgroundColor: primary,
        title: const Text("Панель администратора"),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search))
        ],
      ),
      child:Observer(
        builder: (_) => Expanded(
          child: ListView.builder(
            itemCount: adminStore.camps.length,
            itemBuilder: (BuildContext context, int index) {
              return CampItem(camp: adminStore.camps[index]);
            },

          ),
        ),
      )
    );
  }
}