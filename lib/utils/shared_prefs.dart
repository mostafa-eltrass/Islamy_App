import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsKey {
  static const String mostRecentKey = 'most_Recent';
}

void saveNewSuraList(int newSuraIndex) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> mostRecentIndicesList =
      prefs.getStringList(SharedPrefsKey.mostRecentKey) ?? [];

  if (mostRecentIndicesList.contains('$newSuraIndex')) {
    mostRecentIndicesList.remove(newSuraIndex);
    mostRecentIndicesList.insert(0, '$newSuraIndex');
  } else {
    mostRecentIndicesList.insert(0, '$newSuraIndex');
  }
  // عشان يمسح اخر سور وما تزدش عن 5
  if (mostRecentIndicesList.length > 5) {
    mostRecentIndicesList.removeLast();
  }
  await prefs.setStringList(
    SharedPrefsKey.mostRecentKey,
    mostRecentIndicesList,
  );
}

