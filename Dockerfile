FROM google/dart:latest as build-image

WORKDIR /work
COPY ./ ./

RUN pub get
RUN dart2native ./src/main.dart -o ./bootstrap
RUN chmod +x bootstrap

FROM amazon/aws-lambda-provided:al2

COPY --from=build-image /work/ /var/runtime/

CMD ["dummyHandler"]
