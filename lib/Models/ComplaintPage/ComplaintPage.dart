import 'package:alfostat/Models/ComplaintPage/ComplaintDataModel.dart';
import 'package:alfostat/Models/HomePage/secionContainer.dart';
import 'package:alfostat/core/AppeRoutes/AppRouteName.dart';
import 'package:alfostat/core/FirebaseServices/FirestoreCloudServices/FireStoreCloudServiceComplaint.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../core/AppTheme/AppColors.dart';
import '../../core/Strings/Strings.dart';
import '../../core/l10n/app_localizations.dart';
import '../../core/provider/SettingProvider.dart';
import 'ComplaintDetails.dart';

class ComplaintPage extends StatefulWidget {
  const ComplaintPage({super.key});

  State<ComplaintPage> createState() => _ComplaintsPageState();
}

class _ComplaintsPageState extends State<ComplaintPage> {
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);

    final provider = Provider.of<SettingProvider>(context);
    final theme = Theme
        .of(context)
        .textTheme;
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 30,
              color: provider.isDark() ? AppColors.green : AppColors.darkgreen,
            ),
          ),
          title: Text(locale!.complaints, style: TextStyle(
              color: provider.isDark() ? AppColors.green : AppColors
                  .darkgreen),),
        centerTitle: true,
        ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: StreamBuilder(

              stream: FireStoreCloudServiceComplaint.getrealtimeallcomplaint(),

              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return ListView.separated(
                      itemBuilder: (cotext, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Skeletonizer(child: Bone(
                            height: 220, width: double.infinity,

                          )),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 16,);
                      },
                      itemCount: 4);
                }
                if (snapshot.hasError) {
                  return Text(snapshot.hasError.toString());
                }
                List<ComplaintDataModel> complaints = snapshot.data!;

                return complaints.isEmpty ? Center(
                    child: Lottie.asset(Strings.LottieEmpty)) : ListView
                    .separated(
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => ComplaintDetails(),
                              settings: RouteSettings(
                                  arguments: complaints[index])));
                        },
                        child: SectionContainer(
                            image: provider.isDark() ? complaints[index]
                                .image ?? Strings.complaintpagelight :
                            complaints[index].image ??
                                Strings.complaintpagedark,
                            title: complaints[index].title),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 16,);
                    },
                    itemCount: complaints.length

                );
              }


          ),
          ),
        ),

        floatingActionButton: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AppRouteName.AddComplaint);
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: provider.isDark() ? AppColors.green : AppColors
                    .darkgreen,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: provider.isDark()
                        ? AppColors.green
                        : AppColors.darkgreen,
                    blurRadius: 12,
                    spreadRadius: 2,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Icon(
                Icons.add,
                size: 24,
                color: provider.isDark() ? AppColors.black : Colors.white,
              ),
            ),
          ),
        ),
    );

  }
}
