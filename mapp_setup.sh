cd forks && cd alice && pwd && ls \
  && flutter clean && flutter pub get \
  && cd ../.. \
  && cd packages && cd core && cd applink && pwd && ls \
  && flutter clean && flutter pub get \
  && cd .. && cd camera && pwd && ls \
  && flutter clean && flutter pub get \
  && cd .. && cd config && pwd && ls \
  && flutter clean && flutter pub get \
  && flutter pub run build_runner build --delete-conflicting-outputs \
  && cd .. && cd encrypt && pwd && ls \
  && flutter clean && flutter pub get \
  && cd .. && cd firebase && cd mlkit && pwd && ls \
  && flutter clean && flutter pub get \
  && cd .. && cd fcm && pwd && ls \
  && flutter clean && flutter pub get \
  && cd .. && cd realtime_database && pwd && ls \
  && flutter clean && flutter pub get \
  && cd .. && cd remote_config && pwd && ls \
  && flutter clean && flutter pub get \
  && cd .. && cd .. && cd locator && pwd && ls \
  && flutter clean && flutter pub get \
  && cd .. && cd platform && pwd && ls \
  && flutter clean && flutter pub get \
  && cd .. && cd storage && cd floor && pwd && ls \
  && flutter clean && flutter pub get \
  && cd .. && cd sqflite && pwd && ls \
  && flutter clean && flutter pub get \
  && cd .. && cd .. && cd ui && pwd && ls \
  && flutter clean && flutter pub get \
  && cd .. && cd .. \
  && cd mapp && cd mapp_api && pwd && ls \
  && flutter clean && flutter pub get \
  && flutter pub run build_runner build --delete-conflicting-outputs \
  && cd .. && cd mapp_config && pwd && ls \
  && flutter clean && flutter pub get \
  && flutter pub run build_runner build --delete-conflicting-outputs \
  && cd .. && cd mapp_example && pwd && ls \
  && flutter clean && flutter pub get \
  && flutter pub run build_runner build --delete-conflicting-outputs \
  && cd .. && cd mapp_fcm && pwd && ls \
  && flutter clean && flutter pub get \
  && cd .. && cd mapp_firebase_database && pwd && ls \
  && flutter clean && flutter pub get \
  && cd .. && cd mapp_onboarding && pwd && ls \
  && flutter clean && flutter pub get \
  && flutter pub run build_runner build --delete-conflicting-outputs \
  && flutter clean && flutter pub get \
  && cd .. && cd mapp_shared && pwd && ls \
  && flutter clean && flutter pub get \
  && cd .. && cd mapp_storage && pwd && ls \
  && flutter clean && flutter pub get \
  && flutter pub run build_runner build --delete-conflicting-outputs \
  && cd .. && cd .. && cd .. && cd mapp \
  && flutter clean && flutter pub get \
  && cd ..

