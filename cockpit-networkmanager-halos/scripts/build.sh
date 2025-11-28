#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

cd "$PROJECT_DIR"

echo "========================================="
echo "Building cockpit-networkmanager-halos"
echo "========================================="

# Read version
VERSION=$(cat VERSION)
echo "Version: $VERSION"

# Build the package
echo ""
echo "Building Debian package..."
dpkg-buildpackage -b -uc -us

echo ""
echo "========================================="
echo "Build complete!"
echo "========================================="
echo ""
echo "Package created:"
ls -lh ../*.deb 2>/dev/null | tail -1 || echo "No .deb found (check for errors above)"
