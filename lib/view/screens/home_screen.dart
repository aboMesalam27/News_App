import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:language_picker/language_picker_dropdown.dart';
import 'package:language_picker/languages.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/tap_bounce_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:news/servicse/api.dart';
import 'package:news/servicse/function.dart';
import 'package:news/view/widgets/categories.dart';

class HomeScreen extends StatefulWidget {
  //const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
//  Language _selectedDropdownLanguage = Languages.korean;

  API api = API();
  List<String> _locations = ['A', 'B', 'C', 'D'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(221, 74, 72,1),
          elevation: 0.0,
          title: Text("NEWS"),
        ),
        body: ListView(
            physics: ScrollPhysics(parent: NeverScrollableScrollPhysics()),
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      BuildRaisedButton(
                          textName: "General",
                          colorButton: Colors.black87,
                          textCaregory: "General"),
                      BuildRaisedButton(
                          textName: "Sports",
                          colorButton: Colors.black87,
                          textCaregory: "sports"),
                      BuildRaisedButton(
                          textName: "Science",
                          colorButton: Colors.black87,
                          textCaregory: "Science"),
                      BuildRaisedButton(
                          textName: "Healthy",
                          colorButton: Colors.black87,
                          textCaregory: "Health"),
                      BuildRaisedButton(
                          textName: "Business",
                          colorButton: Colors.black87,
                          textCaregory: "Business"),
                      BuildRaisedButton(
                          textName: "Entertainment",
                          colorButton: Colors.black87,
                          textCaregory: "entertainment"),
                      BuildRaisedButton(
                          textName: "Technology",
                          colorButton: Colors.black87,
                          textCaregory: "technology"),
                    ],
                  ),
                ),
              ),
              Container(
                height: 1000,
                child: FutureBuilder(
                  future: api.getDataArticel(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<dynamic>> snapshot) {
                    if (snapshot.data == null) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          backgroundColor: Colors.black,
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Functions.openURL(
                                    "${snapshot.data![index].url}");
                              },
                              child: Card(
                                shadowColor: Colors.white10,
                                elevation: 20,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(25),
                                        topRight: Radius.circular(25))),
                                child: Column(
                                  children: [
                                    Container(
                                      child: ClipRRect(
                                        child: CachedNetworkImage(
                                            placeholder: (context, url) =>
                                            const Center(
                                                child:
                                                CircularProgressIndicator(

                                                )),
                                            fit: BoxFit.cover,

                                            imageUrl:
                                            "${snapshot.data![index].urlToImage==null?
                                            'assets/images/404 error.png'
                                            :
                                            snapshot.data![index].urlToImage }"),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(25),
                                            topRight: Radius.circular(25)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                          "${snapshot.data![index].title}"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            child: IconButton(
                                                onPressed: () {
                                                  Functions.shareURL(
                                                      "${snapshot.data![index].url}");
                                                },
                                                icon: Icon(
                                                  Icons.share,
                                                  size: 24,
                                                  color: Colors.black,
                                                )),
                                            backgroundColor:
                                                Colors.grey.shade400,
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          CircleAvatar(
                                            child: IconButton(
                                                onPressed: () {
                                                  Functions.copyURL(
                                                      "${snapshot.data![index].url}");
                                                  showTopSnackBar(
                                                      context,
                                                      Center(
                                                        child: Container(
                                                          height: 70,
                                                          width: 150,
                                                          child:
                                                              CustomSnackBar
                                                                  .info(
                                                            backgroundColor:
                                                                Colors
                                                                    .black,
                                                            message:
                                                                "Copied Link !",
                                                          ),
                                                        ),
                                                      ));
                                                },
                                                icon: Icon(
                                                  Icons.copy,
                                                  size: 25,
                                                  color: Colors.black,
                                                )),
                                            backgroundColor:
                                                Colors.grey.shade400,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
              ),
            ]),
        drawer: Drawer(
          backgroundColor: Color.fromRGBO(25, 40, 47,0.5),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Change Your Country',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                ),
                Card(
                  elevation: 5,
                  child: LanguagePickerDropdown(
                    initialValue: Languages.avestan,
                    itemBuilder: _buildDropdownItem,
                    onValuePicked: (language)
                    {
                    setState(() {
                      API.selectLanguagee = language.isoCode;
                      print(API.selectLanguagee);

                    });
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
  Widget _buildDropdownItem( language) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 8.0,
        ),
        Text("${language.name} (${language.isoCode})",style: TextStyle(
          color: Colors.black
        ),),
      ],
    );
  }
}
