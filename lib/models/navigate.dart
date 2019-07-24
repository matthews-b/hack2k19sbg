import 'package:flutter/material.dart';
import 'package:hack2k19sbg/pages/category-page.dart';
import 'package:hack2k19sbg/pages/home-page.dart';
import 'package:hack2k19sbg/pages/options-page.dart';

class Navigate {

  BuildContext context;
  String page;

  Navigate(context, page) {
    this.context = context;
    this.page = page;  
  }

  void navigate(String param) {
    Navigator.of(this.context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          switch (param) {
            case "":
                switch (this.page) {
                  case "Options":
                      return Options();
                    break;
                  case "Home":
                      return Home();
                    break;
                }
              break;
            default:
              switch (this.page) {
                case "Category":
                    return Category(category: param);
                  break;
              }
          }
          return Home();
        },
      ),
    );
  }
}