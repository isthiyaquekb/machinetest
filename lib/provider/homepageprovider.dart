import 'package:flutter/cupertino.dart';
import 'package:machine_test/model/post.dart';

class HomePageProvider extends ChangeNotifier {
  bool _isLoading = true;
  List<Post> _postsList = [];
  int _currentPage = 1;

  int get currentPage => _currentPage;

  setCurrentPage(int page) {
    _currentPage = page;
  }

  bool get isLoading => _isLoading;

  setIsHomePageProcessing(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  List<Post> get postsList => _postsList;

  setPostsList(List<Post> list, {bool notify = true}) {
    _postsList = list;
    if (notify) notifyListeners();
  }
}