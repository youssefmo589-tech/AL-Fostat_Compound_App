import 'package:alfostat/core/provider/SettingProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Widgets/TabBarItem.dart';
import '../../core/AppTheme/AppColors.dart';

class Population extends StatefulWidget {
  const Population({super.key});

  State<Population> createState() => _PopulationState();
}

class _PopulationState extends State<Population> {
  int _selectedindex = 0;

  List<String> BuildingNumbers = ["B1", "B2", "B3", "B4", "B5", "B6"];

  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final provider = Provider.of<SettingProvider>(context);
    return Scaffold(
      body: Column(
        spacing: 16,
        children: [
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              cursorColor: provider.isDark()
                  ? AppColors.white
                  : AppColors.black,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 13,
                ),
                filled: true,
                suffixIcon: Icon(
                  Icons.search_outlined,
                  color: provider.isDark()
                      ? AppColors.green
                      : AppColors.darkgreen,
                ),
                fillColor: provider.isDark()
                    ? AppColors.black
                    : AppColors.white,
                hintText: "Search for event",
                hintStyle: theme.titleSmall?.copyWith(
                  color: provider.isDark()
                      ? AppColors.lighgrey
                      : AppColors.darkgrey,
                  fontSize: 14,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: provider.isDark()
                        ? AppColors.green
                        : AppColors.darkgreen,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: provider.isDark()
                        ? AppColors.green
                        : AppColors.darkgreen,
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
          DefaultTabController(
            length: BuildingNumbers.length,

            child: TabBar(
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              labelPadding: EdgeInsets.symmetric(horizontal: 8),
              indicator: BoxDecoration(),
              dividerHeight: 0,
              onTap: (index) {
                setState(() {
                  _selectedindex = index;
                });
              },

              tabs: BuildingNumbers.map(
                (item) => TabBarItem(
                  isselected: BuildingNumbers.indexOf(item) == _selectedindex
                      ? true
                      : false,
                  BuildingNum: item,
                ),
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
