import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:specialite/data.dart';
import 'package:specialite/localization/lang_constants.dart';
import 'package:specialite/models/category_object.dart';
import 'package:specialite/models/restaurant_object.dart';
import 'package:specialite/restaurantcards/xs_card.dart';
import 'package:specialite/screens/profile_screen.dart';
import 'package:specialite/services/category_service.dart';
import 'package:specialite/services/restaurant_service.dart';
import 'package:specialite/widgets/xs_builder.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart' as constants;

class Search extends StatefulWidget {
  const Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<String> nameList = RestaurantService().getRestaurantNames();

  _SearchAppBarDelegate _searchDelegate;

  @override
  void initState() {
    super.initState();
    _searchDelegate = _SearchAppBarDelegate(nameList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.only(left: 10),
          child: IconButton(
            color: Color.fromARGB(255, 239, 67, 37),
            icon: Icon(
              Icons.search,
            ),
            onPressed: () {
              showSearchPage(context, _searchDelegate);
            },
          ),
        ),
        title: InkWell(
          onTap: () {
            showSearchPage(context, _searchDelegate);
          },
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 240, 10),
            child: Text(
              getTranslated(context,"h_search"),
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(fontSize: 20, color: Colors.grey)),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: FutureBuilder(
                future: constants.categories ??=
                    CategoryService().fetchCategoryObjects(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<CategoryObject>> snapshot) {
                    return Wrap(
                      alignment: WrapAlignment.center,
                      children: data.categories.map((e){
                        return Container(
                          height:30,
                          padding: EdgeInsets.all(2),
                          child: FlatButton(
                            onPressed:(){},
                            child: Text(
                              (language=="English")?e.titleEn:e.titleJa,
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12
                                )
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            color: Color.fromARGB(255, 51, 192, 192),
                            textColor: Colors.white,
                          ),
                        );
                        // return Padding(
                        //   padding: EdgeInsets.all(2),
                        //   child: SizedBox(
                        //     height: 30,
                        //     child: ButtonTheme(
                        //       minWidth: 0,
                        //       child: FlatButton(
                        //         shape: RoundedRectangleBorder(
                        //           borderRadius: BorderRadius.circular(20),
                        //         ),
                        //         color: Color.fromARGB(255, 51, 192, 192),
                        //         textColor: Colors.white,
                        //         // onPressed: () => {
                        //         //   showSearchPage(context, _searchDelegate,
                        //         //       query: e.titleEn)
                        //         // },
                        //         child: Text(
                        //           (language=="English")?e.titleEn:e.titleJa,
                        //           style: GoogleFonts.poppins(
                        //               textStyle: TextStyle(
                        //                   fontWeight: FontWeight.bold,
                        //                   fontSize: 12)),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // );
                      }).toList()
                    );
                },
              ),
            ),
          ),
          // Padding(
          //   padding: constants.PADDING_LTRB,
          //   child: Text(
          //     getTranslated(context,"s_recent"),
          //     style: GoogleFonts.poppins(
          //         textStyle: constants.TITLE_STYLE) /*constants.TITLE_STYLE*/,
          //   ),
          // ),
          // Center(
          //     child: XSBuilder(
          //         howMany: 5, showDeliveryPrice: true, addBottomLine: true)),
        ],
      )),
    );
  }

  void showSearchPage(
      BuildContext context, _SearchAppBarDelegate searchDelegate,
      {String query}) async {
    await showSearch<String>(
        context: context, delegate: searchDelegate, query: query);
  }
}

class _SearchAppBarDelegate extends SearchDelegate<String> {
  final List<String> _words;

  _SearchAppBarDelegate(List<String> words) : _words = words;

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          if (query.isEmpty) {
            this.close(context, null);
          } else {
            query = '';
            showSuggestions(context);
          }
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Padding(
        padding: EdgeInsets.only(left: 10),
        child: Icon(Icons.arrow_back),
      ),
      onPressed: () {
        this.close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final Iterable<String> suggestions =
        _words.where((word) => word.contains(query));

    return _WordSuggestionList(
      query: this.query,
      suggestions: suggestions.toList(),
      onSelected: (String suggestion) {
        this.query = suggestion;
        showResults(context);
      },
    );
  }
}

class _WordSuggestionList extends StatelessWidget {
  _WordSuggestionList({this.suggestions, this.query, this.onSelected});

  final List<String> suggestions;
  final String query;
  final ValueChanged<String> onSelected;
  final List<RestaurantObject> restaurants =
      RestaurantService().getRestaurants();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int i) {
        final String suggestion = suggestions[i];
        List<RestaurantObject> restod = restaurants
            .where(
              (element) => (element.title.toLowerCase()).contains(
                suggestion.toLowerCase(),
              ),
            )
            .toList();
        return InkWell(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 8, 20, 0),
                child: XSCard(restoObject: restod[0], showDeliveryPrice: true),
              ),
              Divider(
                endIndent: 20,
                indent: 90,
                height: 1,
                thickness: 1,
              ),
            ],
          ),
        );
      },
    );
  }
}
