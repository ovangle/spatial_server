part of spatial_server;


const String SERVER_NAME = 'localhost';

Map<String, dynamic> entityDataFromId(classn, id) {
  final String uri = 'http://'.concat(
      Strings.join([
                    '${SERVER_NAME}','SpatialServer',
                    'rest','v1','${classn}', '${id}?format=json'
                    ], '/'));
  final req = new HttpRequest()
  ..open('GET', uri, false);
  var data = JSON.parse(req.responseText);
  //Accessing by ID so hash must be unique.
  Map<String,dynamic> memberData = data['Results'][0];
  if(memberData['Class'] != classn) {
    throw new ServerException('Server passed back an entity not of class ${classn}');
  }
  if (memberData['Id'] != id) {
    throw new ServerException('Server passed back an entity with an unexpected id ${id}');
  }
  return memberData;
}
abstract class Entity {
  String get classn;
  String id;
}

class ServerException implements Exception {
  String message;
  ServerException(this.message);
}


