import 'package:dooking/data/models/shift.dart';
import 'package:mobx/mobx.dart';

import '../../data/models/camp.dart';

part 'admin_store.g.dart';

class AdminStore = _AdminStore with _$AdminStore;

abstract class _AdminStore with Store {

  @observable
  List<Camp> camps = List.generate(8,
        (index) => Camp("Testname",
      "Стационарный лагерь", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      [Shift("03.05.12", 12)],
      "Зимние заезды",
            "432020 Российскрая федирация Оренбургская область Октябрьский район село Октябрьское ул. Луначарского 13А 2 25",
      "3 жилых комплекса, 120 гиктаров, 3х разовое питание"
        ),
  );
}