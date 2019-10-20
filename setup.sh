#!/bin/bash

CARTHAGE_VERSION=0.33.0
SWIFTFORMAT_VERSION=0.40.10
SOURCERY_VERSION=0.16.2
SWIFTGEN_VERSION="SwiftGen v6.1.0 (Stencil v0.13.1, StencilSwiftKit v2.7.2, SwiftGenKit v6.1.0)"

echo "🕛 Checking the existence of Homebrew..."

if which brew >/dev/null; then
  brew update
else
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "🕐  Carthage of version ${CARTHAGE_VERSION}..."

if which carthage >/dev/null; then
	CURRENT_CARTHAGE_VERSION=$(swiftlint version)
	if [ $CURRENT_CARTHAGE_VERSION != $CARTHAGE_VERSION ]; then
		brew upgrade carthage
		echo "✅ upgraded to $(CARTHAGE_VERSION)"
	else
		brew switch carthage $CARTHAGE_VERSION
		echo "✅ installed actual version of Carthage"
	fi
else
	echo "Installing Carthage"
	brew install carthage
fi

echo "🕑 Checking the existence of SwiftFormat with version ${SWIFTFORMAT_VERSION}..."

if which swiftformat >/dev/null; then
	CURRENT_SWIFTFORMAT_VERSION=$(swiftformat --version)
	if [ $CURRENT_SWIFTFORMAT_VERSION != $SWIFTFORMAT_VERSION ]; then
		brew upgrade swiftformat
		echo "✅ upgraded to $(SWIFTFORMAT_VERSION)"
	else
		brew switch swiftformat $SWIFTFORMAT_VERSION
		echo "✅ installed actual version of SwiftFormat"
	fi
else
	echo "Installing SwiftFormat"
	brew install swiftformat
fi

echo "🕒 Checking the existence of Sourcery with version ${SOURCERY_VERSION}..."

if which sourcery >/dev/null; then
	CURRENT_SOURCERY_VERSION=$(sourcery --version)
	if [ $CURRENT_SOURCERY_VERSION != $SOURCERY_VERSION ]; then
		brew upgrade sourcery
		echo "✅ upgraded to $(SOURCERY_VERSION)"
	else
		brew switch sourcery $SOURCERY_VERSION
		echo "✅ installed actual version of Sourcery"
	fi
else
	echo "Installing Sourcery"
	brew install sourcery
fi

echo "🕞 Checking the existence of XCProfiler..."
if which xcprofiler >/dev/null; then
	echo "✅ installed actual version of XCProfiler"
else
  	gem install xcprofiler
fi

echo "🕒 Checking the existence of SwiftGen with version ${SWIFTGEN_VERSION}..."

if which swiftgen >/dev/null; then
	CURRENT_SWIFTGEN_VERSION=$(swiftgen --version)
	if [ $CURRENT_SWIFTGEN_VERSION != $SWIFTGEN_VERSION ]; then
		brew upgrade swiftgen
		echo "✅ upgraded to $(SWIFTGEN_VERSION)"
	else
		echo "✅ installed actual version of SwiftGen"
	fi
else
	echo "Installing SwiftGen"
	brew install swiftgen
fi

echo "🕓 Installing Bundler..."
gem install bundler

echo "🕔 updating dependencies from Bundler'a..."
bundle update
