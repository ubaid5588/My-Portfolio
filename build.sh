#!/bin/bash
set -e

echo "==> Setting up Flutter for Netlify build..."

# Clone Flutter stable SDK if not cached
if [ ! -d "$HOME/flutter" ]; then
  echo "==> Cloning Flutter SDK (stable branch)..."
  git clone https://github.com/flutter/flutter.git -b stable --depth 1 "$HOME/flutter"
else
  echo "==> Flutter SDK already present at $HOME/flutter"
fi

# Add Flutter binary to PATH
export PATH="$PATH:$HOME/flutter/bin"

# Run flutter doctor / version check
flutter --version

# Resolve project dependencies
flutter pub get

# Compile Flutter web release
flutter build web --release

# Ensure Netlify SPA redirects rule is in the publish folder
if [ -f "web/_redirects" ]; then
  cp web/_redirects build/web/_redirects
fi

echo "==> Flutter Web build completed successfully!"
