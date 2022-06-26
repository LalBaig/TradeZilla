class Userproduct {
  int _id;
  String _productname;
  String _exchange_with;
  String _imagePath;
  String _description;
  String _address;

  Userproduct(this._id, this._imagePath, this._address, this._description,
      this._exchange_with, this._productname);

  int get id => _id;
  String get address => _address;
  String get description => _description;
  String get imagePath => _imagePath;
  String get exchange => _exchange_with;
  String get productname => _productname;
}
