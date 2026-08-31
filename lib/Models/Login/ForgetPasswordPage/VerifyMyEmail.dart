// import 'package:alfostat/Widgets/CustomeButton.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../../../core/AppTheme/AppColors.dart';
// import '../../../core/gen/assets.gen.dart';
// import '../../../core/provider/SettingProvider.dart';
//
// class VerifyMyEmail extends StatefulWidget {
//
//   const VerifyMyEmail({super.key});
//
//   State<VerifyMyEmail> createState() => _VerifymyemailState();
// }
//
// class _VerifymyemailState extends State<VerifyMyEmail> {
//
//   final _formkey = GlobalKey<FormState>();
//
//
//   bool ishidden = false;
//
//   Widget build(BuildContext context) {
//     final provider = Provider.of<SettingProvider>(context);
//     final theme = Theme.of(context).textTheme;
//     return Scaffold(
//         body: SingleChildScrollView(
//           child: Column(
//               children: [
//                 Container(
//                   height: MediaQuery
//                       .of(context)
//                       .size
//                       .height * 0.25,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [
//                         AppColors.green,
//                         provider.isDark() ? AppColors.black : AppColors
//                             .lighgrey,
//                       ],
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                     ),
//                   ),
//                   child: Center(
//                     child: SizedBox(
//                       width: 240,
//                       height: 60,
//                       child: Assets.images.fostatpageLogoBlack.image(),
//                     ),
//                   ),
//                 ),
//
//                 Center(child: CustomeButton(title: "Verify My Email"))  ,
//
//               ]
//           ),
//         )
//     );
//   }
// }
