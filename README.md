# lambda_dart_sls

my serverless template dart on aws lambda for serverless framework

zip(provided.al2023 / arm64)版。デプロイ時に `serverless-plugin-scripts` が
Dart 3.8+ のクロスコンパイル(`dart compile exe --target-os=linux --target-arch=arm64`)で
`bootstrap`(linux/arm64 バイナリ)を Docker 無しで生成し、zip としてパッケージングする。

ローカルに Dart 3.8 以上が必要(Windows / macOS / Linux から linux/arm64 へクロスコンパイル可能)。

```
$ npm install
$ sls deploy
```

> Docker(ECR イメージ)版は `Dockerfile` / `serverless.yml` 内にコメントアウトで残している。
