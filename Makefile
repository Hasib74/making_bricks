ROOT := $(shell git rev-parse --show-toplevel)
FLUTTER := $(shell which flutter)
FLUTTER_BIN_DIR := $(shell dirname $(FLUTTER))
FLUTTER_DIR := $(FLUTTER_BIN_DIR:/bin=)
DART := $(FLUTTER_BIN_DIR)/cache/dart-sdk/bin/dart
PROJECT := $(shell chmod 777 pwd)
# Flutter
.PHONY:	analyze
analyze:
	$(FLUTTER) analyze
.PHONY:	format
format:
	$(FLUTTER) format .
.PHONY:	test
test:
	$(FLUTTER) test
.PHONY:	test-bloc
test-bloc:
	$(FLUTTER) test
.PHONY:	codegen
codegen:
	$(shell flutter pub run build_runner build --delete-conflicting-outputs)
# Git
.PHONY:	fetch-main
fetch-main:
	$(shell git fetch origin main)
.PHONY:	rebase-main
rebase-main:
	$(shell git pull --rebase origin main)
.PHONY:	codegen-cached
codegen-cached:
	flutter pub run build_runner build
.PHONY:	build-apk-production
build-apk-production:
	$(shell flutter build apk --flavor production -t lib/main_pro.dart)
.PHONY:	run-apk-production-mobile
run-apk-production-mobile:
	@$(FLUTTER) run --flavor production -t lib/main_pro.dart
.PHONY:	run-apk-dev
run-apk-dev:
	@$(FLUTTER) run --flavor dev -t lib/main_dev.dart
.PHONY:	run-apk-staging
run-apk-staging:
	$(shell flutter run --flavor staging -t lib/main_staging.dart)
.PHONY:	add-features
add-features:
	$(shell mason make my_feature -o ./lib/featchers)


