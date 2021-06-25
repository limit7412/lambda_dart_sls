FROM google/dart:latest as build-image

WORKDIR /work
COPY ./ ./

RUN pub get
RUN dart compile exe ./src/main.dart -o ./bootstrap
RUN chmod +x bootstrap

FROM public.ecr.aws/lambda/provided:al2

COPY --from=build-image /work/bootstrap /var/runtime/

CMD ["dummyHandler"]
