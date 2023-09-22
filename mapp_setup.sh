cd forks && cd alice && pwd && ls \
  && flutter clean && flutter pub get \
  && cd ../.. \
  && cd packages && cd core && cd applink && pwd && ls \
  && flutter clean && flutter pub get
