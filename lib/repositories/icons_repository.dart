import 'package:flutter/material.dart';

class IconsRepository {
  static IconData getIcon(int codePoint) {
    return IconData(codePoint, fontFamily: 'MaterialIcons');
  }

  List<int> getFeaturedIcons() {
    return [
      Icons.directions_walk.codePoint,
      Icons.directions_bike.codePoint,
      Icons.alarm.codePoint,
      Icons.book.codePoint,
      Icons.brush.codePoint,
      Icons.bubble_chart.codePoint,
      Icons.cake.codePoint,
      Icons.check_circle.codePoint,
      Icons.child_care.codePoint,
      Icons.accessibility.codePoint,
      Icons.local_cafe.codePoint,
      Icons.local_grocery_store.codePoint,
      Icons.local_play.codePoint,
      Icons.local_atm.codePoint,
      Icons.music_note.codePoint,
      Icons.build.codePoint,
      Icons.beach_access.codePoint,
      Icons.star_border.codePoint,
      Icons.directions_transit_sharp.codePoint,
      Icons.school.codePoint,
      Icons.local_gas_station.codePoint,
    ];
  }

  IconData getIconData(int codePoint) {
    return IconData(codePoint, fontFamily: 'MaterialIcons');
  }
}
// Martin Gogołowicz || SobGOG || 14.09.2023
// Last edit: Martin Gogołowicz || SobGOG || 15.09.2023