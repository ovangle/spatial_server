part of spatial_server;

class Boundary extends Entity {
  String get classn => 'Boundary';
  String id;
  String href;
  String city;
  String contact;
  //TODO: Polyline
  String coordinates;

  Boundary(this.id, this.href, this.city, this.contact, this.coordinates);

  Boundary fromId(id) {
    Map members = entityDataFromId(this.classn, id);
    return new Boundary(
            members['id'],
            members['href'],
            members['city'],
            members['contact'],
            members['coordinates']);
  }
}