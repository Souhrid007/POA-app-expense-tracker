import 'package:flutter/material.dart';
import 'package:sample/screens/home/screen_home.dart';

class MonryManagerBottomNavigation extends StatelessWidget {
  const MonryManagerBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ScreenHome.selectedIndexNotifier,
      
      builder: (BuildContext ctx, int updatedIndex, Widget? _){
        return BottomNavigationBar(
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.grey,
          currentIndex: updatedIndex,
          onTap: (newIndex){
            ScreenHome.selectedIndexNotifier.value=newIndex;
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Tramsactions'),
            BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Categories'),
          ],
        );
      },
    );
  }
}
