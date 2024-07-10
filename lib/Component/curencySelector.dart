// // ignore_for_file: file_names

// import 'package:flutter/material.dart';

// class CurrencySelector extends StatefulWidget {
//   final bool isKyc;
//   final TextEditingController? controller;
//   final Function(dynamic)? onSelect;
//   const CurrencySelector(
//       {Key? key, this.controller, this.onSelect, required this.isKyc})
//       : super(key: key);

//   @override
//   State<CurrencySelector> createState() => _CurrencySelectorState();
// }

// class _CurrencySelectorState extends State<CurrencySelector> {
//   @override
//   void initState() {
//     // context.read<SettingsProvider>().getCurrencies();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final dataProvider = context.read<LocaleProvider>();
//     if (widget.isKyc) {
//       dataProvider.getCurrenciesID(context);
//     } else {}

//     return Consumer<SettingsProvider>(builder: (context, data, child) {
//       return Container(
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                   topLeft: const Radius.circular(15.0),
//                   topRight: const Radius.circular(15.0))),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   "Select Currency",
//                   style: TextStyle(
//                     color: BLACK,
//                     fontFamily: "Product Sans",
//                     fontSize: 17,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 if (widget.isKyc) ...[
//                   if (dataProvider.currenciesModel != null)
//                     for (var x
//                         in dataProvider.currenciesModel!.currencies!) ...[
//                       ListTile(
//                         title: Text("${x.name} (${x.symbol})"),
//                         onTap: () {
//                           widget.onSelect!(x);
//                           widget.controller!.text = x.name!;

//                           Navigator.pop(context);
//                         },
//                       ),
//                     ]
//                 ] else ...[
//                   if (data.currencies != null)
//                     for (var x in data.currencies) ...[
//                       ListTile(
//                         title: Text("${x.name} ${x.symbol}"),
//                         onTap: () {
//                           widget.onSelect!(x);
//                           widget.controller!.text = x.name!;

//                           Navigator.pop(context);
//                         },
//                       ),
//                     ]
//                 ]
//               ],
//             ),
//           ));
//     });
//   }
// }
