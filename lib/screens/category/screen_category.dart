import 'package:flutter/material.dart';
import 'package:sample/db/category/category_db.dart';
import 'package:sample/screens/category/expense_category_list.dart';
import 'package:sample/screens/category/income_category_list.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sample/totalexp/expense_item.dart';

class ScreemCategory extends StatefulWidget {
  const ScreemCategory({super.key});

  @override
  State<ScreemCategory> createState() => _ScreemCategoryState();
}

class _ScreemCategoryState extends State<ScreemCategory>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    CategoryDB().refreshUI();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          tabs: const [
            Tab(text: 'INCOME'),
            Tab(text: 'EXPENSE'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              IncomeCategoryList(),
              ExpenseCategoryList(),
            ],
          ),
        ),
      ],
    );
  }
}
