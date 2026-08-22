import 'package:alfostat/Models/Population/populationCard.dart';
import 'package:alfostat/core/provider/SettingProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Widgets/TabBarItem.dart';
import '../../core/AppTheme/AppColors.dart';
import '../../core/Classes/UserModel/UserModel.dart';
import '../../core/FirebaseServices/FirestoreCloudServices/FireCloudServiceToUser.dart';

class Population extends StatefulWidget {
  const Population({super.key});

  State<Population> createState() => _PopulationState();
}

class _PopulationState extends State<Population> {
  int _selectedindex = 0;

  List<String> BuildingNumbers = ["B1", "B2", "B3", "B4", "B5", "B6"];
  List<UserModel> users = [];

  Future<List<UserModel>> loadusers() async
  {
    final result = await FireStoreCloudServiceUser.getusers(
        (_selectedindex + 1).toString());

    setState(() {
      users = result;
    });
    return users;
  }

  List<UserModel> searchresult = [];

  void loadrealtimeusers(String value) {
    FireStoreCloudServiceUser.getrealtimeusers().listen((snapshot) {
      setState(() {
        searchresult = snapshot.docs.map((doc) => doc.data()).where((user) =>
        user.name.toString().toUpperCase().contains(
            value.toUpperCase().trim()) ||
            user.name.toString().toLowerCase().contains(
                value.toLowerCase().trim())).toList();
      });
    });
  }


  void initState() {
    super.initState();
    loadusers();
  }

  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final provider = Provider.of<SettingProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          spacing: 16,
          children: [
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                onChanged: (value) {
                  loadrealtimeusers(value);
                },
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
                  hintText: "Search for member",
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
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: provider.isDark()
                          ? AppColors.green
                          : AppColors.darkgreen,
                      width: 1.5,
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
                  loadusers();
                },

                tabs: BuildingNumbers.map(
                      (item) =>
                      TabBarItem(
                        isselected: BuildingNumbers.indexOf(item) ==
                            _selectedindex
                            ? true
                            : false,
                        BuildingNum: item,
                      ),
                ).toList(),
              ),
            ),
            ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: PopulationCard(user: searchresult.isNotEmpty
                        ? searchresult[index]
                        : users[index]),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 16);
                },
                itemCount: searchresult.isNotEmpty ? searchresult.length : users
                    .length
            )

          ],
        ),
      ),
    );
  }
}
