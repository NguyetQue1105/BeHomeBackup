import 'dart:async';

import 'package:be_home/models/search_model.dart';
import 'package:flutter/widgets.dart';

class SearchBloc with ChangeNotifier {
  StreamController<SearchModel> searchController =
      StreamController<SearchModel>.broadcast();
  SearchModel search;

  static SearchBloc _instance;

  static SearchBloc getInstance() {
    if (_instance == null) {
      _instance = SearchBloc._internal();
    }
    return _instance;
  }

  SearchBloc._internal();

  void setSearchTextWithoutNotify(String searchText) {
    if (search == null) {
      search = new SearchModel();
    }
    search.searchText = searchText;
  }

  void dispose() {
    _instance = null;
    searchController.close();
  }
}
