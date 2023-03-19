import 'package:flutter/material.dart';
import 'package:taskmanager/style/style.dart';

BottomNavigationBar appdrawer(currentindex,onItemtap){
  return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.access_alarms_outlined),
          label: 'New Task'
        ),BottomNavigationBarItem(icon: Icon(Icons.access_alarms_outlined),
            label: 'Progress'
        ),BottomNavigationBarItem(icon: Icon(Icons.access_alarms_outlined),
            label: 'Complete'
        ),BottomNavigationBarItem(icon: Icon(Icons.access_alarms_outlined),
            label: 'Cancel'
        )

      ],
      selectedItemColor: colorGreen,
      unselectedItemColor: colorLightGray,
      currentIndex: currentindex,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      onTap: onItemtap,
      type: BottomNavigationBarType.fixed,

  );
}

