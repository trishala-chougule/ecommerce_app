#!/bin/bash

# Allow Flutter to run as root
export FLUTTER_ALLOW_ROOT=true

# Clone Flutter repository
git clone https://github.com/flutter/flutter.git -b stable --depth=1
export PATH="$(pwd)/flutter/bin:$PATH"

# Verify Flutter installation
flutter doctor

# Install dependencies
flutter pub get

# Build Flutter Web
flutter build web

# Move build files to the public directory (for Vercel)
mkdir -p public
mv build/web/* public/
