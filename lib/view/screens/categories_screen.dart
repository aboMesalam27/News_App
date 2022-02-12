import 'package:cached_network_image/cached_network_image.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:news/servicse/api.dart';
import 'package:news/servicse/function.dart';
import 'package:news/view/widgets/categories.dart';
import 'package:share/share.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class Categories extends StatefulWidget {
  //const Categories({Key? key}) : super(key: key);
String category;

Categories(this.category);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  API api=API();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    api.getDataArticelCategories(widget.category);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(221, 74, 72,1),
        elevation: 0.0,
        title: Text("${widget.category}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("${widget.category.toUpperCase()} News"),
            ),
            Expanded(
                child:   Container(
                  height: 1000,
                  child: FutureBuilder(
                    future: api.getDataArticelCategories("${widget.category}"),
                    builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
                      if(snapshot.data==null)
                      {
                        return Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            backgroundColor: Colors.black,
                          ),
                        );
                      }
                      else {
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
                                                  icon: Icon(Icons.share,size: 25,
                                                    color: Colors.black,)),
                                              backgroundColor: Colors.grey.shade400,

                                            ),
                                            SizedBox(width: 20,),

                                            CircleAvatar(
                                              child: IconButton(
                                                  onPressed: () {
                                                    Functions.copyURL(
                                                        "${snapshot.data![index].url}");
                                                    showTopSnackBar(
                                                        context, Center(
                                                          child: Container(
                                                      height: 70,
                                                            width: 150,
                                                            child: CustomSnackBar.info(
                                                      backgroundColor: Colors.black,
                                                      message: "Copied Link !",
                                                    ),
                                                          ),
                                                        ));
                                                  },
                                                  icon: Icon(Icons.copy,size: 25,
                                                    color: Colors.black,)),
                                              backgroundColor: Colors.grey.shade400,

                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },),
                        );
                      }
                    },

                  ),
                ),),
          ],
        ),
      ),
    );
  }
}
