#!/bin/sh

# 检查是否安装 XCode Command Line Tools
which -s xcode-select
if [[ $? != 0 ]] ; then
	echo "Installing XCode Command Line Tools"
	# Install XCode Command Line Tools
	xcode-select --install
else
	echo "XCode Command Line Tools already installed"
fi

# 检查是否安装 Homebrew
which -s brew
if [[ $? != 0 ]] ; then
  # Install Homebrew
	echo "Installing Homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
	echo "Homebrew already installed"
fi

# 检查是否安装 CocoaPods
which -s pod
if [[ $? != 0 ]] ; then
  # Install CocoaPods
	echo "Installing CocoaPods."
    sudo gem install cocoapods
    pod setup
    pod install
else
	echo "CocoaPods already installed"
fi

# 检查是否安装 xcodegen
which -s xcodegen
if [[ $? != 0 ]] ; then
  # Install fastlane
	echo "Installing xcodegen."
    brew install xcodegen
else
	echo "xcodegen already installed"
fi
