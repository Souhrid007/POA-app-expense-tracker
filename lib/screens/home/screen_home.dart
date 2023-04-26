import 'package:flutter/material.dart';
import 'package:sample/db/category/category_db.dart';
import 'package:sample/models/category/category_model.dart';
import 'package:sample/screens/add_transactions/screen_add_transaction.dart';
import 'package:sample/screens/category/category_add_popup.dart';
import 'package:sample/screens/category/screen_category.dart';
import 'package:sample/screens/home/widgets/bottom_navigation.dart';
import 'package:sample/screens/transactions/screen_transactions.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);
  final _pages = const [
    ScreenTrasactions(),
    ScreemCategory(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Money Manager'),
      ),
      backgroundColor: Colors.grey[100],
      bottomNavigationBar: const MonryManagerBottomNavigation(),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: selectedIndexNotifier,
          builder: (BuildContext context, updatedIndex, _) {
            return _pages[updatedIndex];
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedIndexNotifier.value == 0) {
            print('Add Transactions');
            Navigator.of(context).pushNamed(ScreenaddTransaction.routeName);
          } 
          else {
            print('Add Category');

            showCategoryAddPopup(context);
            // final _sample = CategoryModel(
            //   id: DateTime.now().millisecondsSinceEpoch.toString(),
            //   name: 'Travel',
            //   type: CategoryType.expense,
            // );
            // CategoryDB().insertCategory(_sample);
          }
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
