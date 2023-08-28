import 'package:flutter/material.dart';
import '../widget/Widget.dart';
import 'package:one_take/Page/model/MoviesModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String? searchText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 20,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(
            left: 20, 
            right: 20, 
            bottom: 20
          ),
          child: Column(
            children: [
              Container(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: SvgLoader(
                    path: 'assets/img/Ic_Home_App.svg',
                    widthImg: 124,
                    heightImg: 45.43
                  )
                )
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 20.46
                ),
                child: TextFormFieldWidget(
                  hintText: 'Search',
                  fontSize: 15,
                  onChange: (value) {
                    setState(() {
                      searchText = value.isNotEmpty ? value.trim() : null;
                    });
                  }
                )
              ),
              if (searchText == null)
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: TextWidget(
                              textLabel: 'Latest',
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              fontAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: TextWidget(
                              textLabel: 'See All',
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              fontAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: MovieBuilder(
                        shortType: 'release',
                        modelType: 'horiz',
                        height: 270,
                        context: context, 
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: TextWidget(
                              textLabel: 'Best',
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              fontAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: TextWidget(
                              textLabel: 'See All',
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              fontAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: MovieBuilder(
                        shortType: 'best',
                        modelType: 'horiz',
                        height: 270,
                        context: context,
                      ),
                    ),
                  ],
                ),

              if (searchText != null)
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height - 210,
                    child: MovieBuilder(
                      shortType: 'best',
                      modelType: 'ver',
                      searchText: searchText,
                      context: context,
                    ),
                  ),
                ),
            ]
          )
        )
      ),
    );
  }
}
