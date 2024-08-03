class PlanetModel
{
  //int? position;
  String? image,name,position;
  
  PlanetModel({this.position, this.image, this.name});
  
  factory PlanetModel.mapToModel(Map m1)
  {
    return PlanetModel(position: m1['position'],image: m1['image'],name: m1['name']);
  }
}