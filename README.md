# lambda_dart_sls

my serverless template dart on aws lambda for serverless framework

zip(provided.al2)版。デプロイ時に `serverless-plugin-scripts` が Docker(dart:latest)で
`bootstrap` を静的ビルドし、zip としてパッケージングする。

```
$ npm install
$ sls deploy
```

> Docker(ECR イメージ)版は `Dockerfile` / `serverless.yml` 内にコメントアウトで残している。
