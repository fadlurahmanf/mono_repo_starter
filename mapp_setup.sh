cd forks && cd alice && pwd && ls \
  && flutter clean && flutter pub get \
  && cd ../.. \
  && cd packages && cd core && cd applink && pwd && ls \
  && flutter clean && flutter pub get \
  && cd .. && cd camera && pwd && ls \
  && flutter clean && flutter pub get
  && cd .. && cd config && pwd && ls \
  && flutter clean && flutter pub get \
  && flutter pub run build_runner build --delete-conflicting-outputs
