// import 'package:flutter/material.dart';
//
// import 'package:flutter/cupertino.dart';
//
// import 'package:language_picker/languages.dart';
// import 'package:language_picker/language_picker.dart';
//
//
//
// class MyHomePage extends StatefulWidget {
//   //MyHomePage({Key key, this.title}) : super(key: key);
//
//
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   Language _selectedDropdownLanguage = Languages.korean;
//   // Language _selectedDialogLanguage = Languages.korean;
//   //  Language _selectedCupertinoLanguage = Languages.korean;
//
//   // It's sample code of Dropdown Item.
//   Widget _buildDropdownItem(Language language) {
//     return Row(
//       children: <Widget>[
//         SizedBox(
//           width: 8.0,
//         ),
//         Text("${language.name} (${language.isoCode})"),
//       ],
//     );
//   }
//
//   // It's sample code of Dialog Item.
//   // Widget _buildDialogItem(Language language) => Row(
//   //   children: <Widget>[
//   //     Text(language.name),
//   //     SizedBox(width: 8.0),
//   //     Flexible(child: Text("(${language.isoCode})"))
//   //   ],
//   // );
//   //
//   // void _openLanguagePickerDialog() => showDialog(
//   //   context: context,
//   //   builder: (context) => Theme(
//   //       data: Theme.of(context).copyWith(primaryColor: Colors.pink),
//   //       child: LanguagePickerDialog(
//   //           titlePadding: EdgeInsets.all(8.0),
//   //           searchCursorColor: Colors.pinkAccent,
//   //           searchInputDecoration: InputDecoration(hintText: 'Search...'),
//   //           isSearchable: true,
//   //           title: Text('Select your language'),
//   //           onValuePicked: (Language language) => setState(() {
//   //             _selectedDialogLanguage = language;
//   //             print(_selectedDialogLanguage.name);
//   //             print(_selectedDialogLanguage.isoCode);
//   //           }),
//   //           itemBuilder: _buildDialogItem)),
//   // );
//   //
//   // // It's sample code of Cupertino Item.
//   // void _openCupertinoLanguagePicker() => showCupertinoModalPopup<void>(
//   //     context: context,
//   //     builder: (BuildContext context) {
//   //       return LanguagePickerCupertino(
//   //         pickerSheetHeight: 200.0,
//   //         onValuePicked: (Language language) => setState(() {
//   //           _selectedCupertinoLanguage = language;
//   //           print(_selectedCupertinoLanguage.name);
//   //           print(_selectedCupertinoLanguage.isoCode);
//   //         }),
//   //       );
//   //     });
//   //
//   // Widget _buildCupertinoItem(Language language) => Row(
//   //   children: <Widget>[
//   //     Text("+${language.name}"),
//   //     SizedBox(width: 8.0),
//   //     Flexible(child: Text(language.name))
//   //   ],
//   // );
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Center(
//                 child: LanguagePickerDropdown(
//                   initialValue: Languages.arabic,
//                   itemBuilder: _buildDropdownItem,
//                   onValuePicked: (Language language) {
//                     _selectedDropdownLanguage = language;
//                     print(_selectedDropdownLanguage.name);
//                     print(_selectedDropdownLanguage.isoCode);
//                   },
//                 ),
//               ),
//               // Expanded(
//               //   child: Center(
//               //     child: MaterialButton(
//               //       child: Text("Push"),
//               //       onPressed: _openLanguagePickerDialog,
//               //     ),
//               //   ),
//               // ),
//               // Expanded(
//               //   child: Center(
//               //     child: ListTile(
//               //       title: _buildCupertinoItem(_selectedCupertinoLanguage),
//               //       onTap: _openCupertinoLanguagePicker,
//               //     ),
//               //   ),
//               // ),
//             ]),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }