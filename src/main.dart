import 'dart:convert';
import 'runtime/serverless.dart' as serverless;

void main() {
  serverless.lambda().handler("hello", (event) async {
    return {
      'statusCode': 200,
      'body': json.encode({'msg': '新たな光に会いに行こう。'}),
    };
  });
}
