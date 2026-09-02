import 'package:alfostat/Models/ComplaintPage/ComplaintDataModel.dart';
import 'package:alfostat/Models/HomePage/secionContainer.dart';
import 'package:alfostat/core/FirebaseServices/FirestoreCloudServices/FireStoreCloudServiceComplaint.dart';
import 'package:alfostat/core/provider/SettingProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../core/AppTheme/AppColors.dart';
import '../../core/Strings/Strings.dart';
import '../../core/l10n/app_localizations.dart';
import 'EditComplaint.dart';

class ComplaintDetails extends StatelessWidget {
  ComplaintDetails({super.key});

  final String _userid = FirebaseAuth.instance.currentUser!.uid;

  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);

    ComplaintDataModel complaint =
        ModalRoute.of(context)?.settings.arguments as ComplaintDataModel;
    final provider = Provider.of<SettingProvider>(context);
    final theme = Theme.of(context).textTheme;

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
        title: Text(
          locale!.complaintDetails,
          style: theme.titleMedium?.copyWith(
            fontSize: 18,
            color: provider.isDark() ? AppColors.green : Colors.black,
          ),
        ),
        centerTitle: true,

        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EditComplaint(complaint: complaint),
                ),
              );
            },
            child: complaint.userid == _userid
                ? Icon(
                    Icons.edit,
                    color: provider.isDark()
                        ? AppColors.green
                        : AppColors.darkgreen,
                    size: 24,
                  )
                : SizedBox(),
          ),
          SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              FireStoreCloudServiceComplaint.deletecomplaint(
                complaint.complaintID!,
              );
              Navigator.pop(context);
            },
            child: complaint.userid == _userid
                ? Icon(Icons.delete_outline, color: Colors.red, size: 24)
                : SizedBox(),
          ),
          SizedBox(width: 16),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionContainer(
                image:
                    complaint.image ??
                    (provider.isDark()
                        ? Strings.complaintpagelight
                        : Strings.complaintpagedark),
              ),
              Text(
                complaint.title,
                style: theme.titleMedium?.copyWith(
                  color: provider.isDark() ? AppColors.lighgrey : Colors.black,
                  fontSize: 18,
                ),
              ),
              Container(
                width: double.infinity,
                height: 76,
                decoration: BoxDecoration(
                  color: provider.isDark() ? Colors.black : AppColors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: provider.isDark()
                        ? AppColors.green
                        : AppColors.darkgreen,
                    width: 1.5,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 16,
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: provider.isDark()
                              ? Colors.transparent
                              : AppColors.lighgrey,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: AppColors.green,
                            width: 1.5,
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.calendar_month_outlined,
                            size: 24,
                            color: provider.isDark()
                                ? AppColors.green
                                : AppColors.darkgreen,
                          ),
                        ),
                      ),
                      Text(
                        DateFormat('dd/MM/yyyy').format(complaint.date!),
                        style: theme.titleMedium?.copyWith(
                          fontSize: 16,
                          color: provider.isDark()
                              ? AppColors.lighgrey
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Text(
                locale.description,
                style: theme.titleMedium?.copyWith(
                  color: provider.isDark() ? AppColors.lighgrey : Colors.black,
                  fontSize: 18,
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: provider.isDark() ? Colors.black : AppColors.white,
                  border: Border.all(
                    color: provider.isDark()
                        ? AppColors.green
                        : AppColors.darkgreen,
                    width: 1.5,
                  ),

                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    complaint.description,
                    style: theme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: provider.isDark()
                          ? AppColors.lighgrey
                          : Colors.black,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              Text(
                locale.author,
                style: theme.titleMedium?.copyWith(
                  color: provider.isDark() ? AppColors.lighgrey : Colors.black,
                  fontSize: 18,
                ),
              ),

              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: provider.isDark() ? Colors.black : AppColors.white,
                  border: Border.all(
                    color: provider.isDark()
                        ? AppColors.green
                        : AppColors.darkgreen,
                    width: 1.5,
                  ),

                  borderRadius: BorderRadius.circular(16),
                ),

                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "${complaint.author}",
                    style: theme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: provider.isDark()
                          ? AppColors.green
                          : AppColors.darkgreen,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
