import 'package:flutter/material.dart';
import 'package:veripol/models/models.dart';

class PaginationController extends ChangeNotifier {
  PaginationController._privateConstructor();
  static final PaginationController _paginationController =
      PaginationController._privateConstructor();

  factory PaginationController() {
    return _paginationController;
  }
  int _startCount = 0;
  int _endCount = 0;
  int _length = 0;
  double _rem = 0;
  List<CandidateData> _temp = [];
  final List<CandidateData> _tempo = [];

  int get startCount => _startCount;
  int get endCount => _endCount;
  int get length => _length;
  double get rem => _rem;
  List<CandidateData> get tempo => _tempo;

  setTempo() {
    if (_length <= 10) {
      _tempo.addAll(_temp);
    } else {
      if (_startCount != _endCount) {
        _tempo.clear();
        for (int i = 0; i < 10; i++) {
          _tempo.add(_temp[i + ((_startCount - 1) * 10)]);
        }
      } else {
        _tempo.clear();
        for (int i = 0; i < _rem; i++) {
          _tempo.add(_temp[i + ((_startCount - 1) * 10)]);
        }
      }
    }
    notifyListeners();
  }

  _initTempo() {
    if (_length <= 10) {
      _tempo.addAll(_temp);
    } else {
      if (_startCount != _endCount) {
        _tempo.clear();
        for (int i = 0; i < 10; i++) {
          _tempo.add(_temp[i + ((_startCount - 1) * 10)]);
        }
      } else {
        _tempo.clear();
        for (int i = 0; i < _rem; i++) {
          _tempo.add(_temp[i + ((_startCount - 1) * 10)]);
        }
      }
    }
  }

  initPaginationData(List<CandidateData> data) {
    _initStartEndCount(data.length);
    _temp = data;
    _length = data.length;
    _initTempo();
  }

  _initStartEndCount(int length) {
    if (length / 10 > 1) {
      int num;
      double rem;

      num = length ~/ 10;

      rem = length % 10;

      if (rem != 0) {
        num++;
      }

      _startCount = 1;
      _endCount = num;
      _rem = rem;
    }
  }

  incrementPageCount() {
    _startCount++;
    notifyListeners();
  }

  decrementPageCount() {
    _startCount--;
    notifyListeners();
  }

  clearFields() {
    _startCount = 0;
    _endCount = 0;
    _length = 0;
    _rem = 0;
    _temp.clear();
    _tempo.clear();
    notifyListeners();
  }
}
