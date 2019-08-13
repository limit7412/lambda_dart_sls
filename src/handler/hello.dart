import '../../runtime.dart';

dynamic hello(dynamic event) {
  return {'msg': '新たな光に会いに行こう。'};
}

void main() {
  lambdaHandler(hello);
}
