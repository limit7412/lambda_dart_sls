import '../../runtime.dart';

dynamic world(dynamic event) {
  final body = event['body'];
  return body;
}

void main() {
  lambdaHandler(world);
}
