import '../../runtime.dart';

dynamic world(dynamic event) {
  var body = event['body'];
  return body;
}

void main() {
  lambdaHandler(world);
}
