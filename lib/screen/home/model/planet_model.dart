class PlanetModel
{
  //int? position;
  String? image,name,position,description;
  
  PlanetModel({this.position, this.image, this.name,this.description});
  
  factory PlanetModel.mapToModel(Map m1)
  {
    return PlanetModel(position: m1['position'],image: m1['image'],name: m1['name'],description: m1['description']);
  }
}