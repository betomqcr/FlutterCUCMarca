
part of 'providers.dart';

class MarcaProvider with ChangeNotifier {

  List<Area> _areas = [];
  bool _isLoading = false;
  Area _areaSelected = Area.empty();

  List<Area> get areas => _areas;
  set areas(List<Area> areas) {
    _areas = areas;
    notifyListeners();
  }

  bool get isLoading => _isLoading;
  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  Area get areaSelected => _areaSelected;
  set areaSelected(Area areaSelected) {
    _areaSelected = areaSelected;
    notifyListeners();
  }
 
}