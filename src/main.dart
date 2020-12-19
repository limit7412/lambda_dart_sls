import 'dart:convert';
import './runtime.dart';

void main() {
  lambdaHandler("hello", (event) async {
    return {
      'statusCode': 200,
      'body': json.encode({'msg': '新たな光に会いに行こう。'}),
    };
  });
}
