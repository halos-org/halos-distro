#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

# Configuration
TEST_HOST="${TEST_HOST:-halos.local}"
TEST_USER="${TEST_USER:-mairas}"

cd "$PROJECT_DIR"

echo "========================================="
echo "Deploying cockpit-networkmanager-halos"
echo "========================================="

# Find the .deb package
DEB_FILE=$(ls -t ../cockpit-networkmanager-halos_*.deb 2>/dev/null | head -1)

if [ -z "$DEB_FILE" ]; then
    echo "Error: No .deb package found. Run build.sh first."
    exit 1
fi

echo "Package: $DEB_FILE"
echo "Target: $TEST_USER@$TEST_HOST"
echo ""

# Copy package to test device
echo "Copying package to test device..."
scp "$DEB_FILE" "$TEST_USER@$TEST_HOST:/tmp/"

DEB_FILENAME=$(basename "$DEB_FILE")

# Install package on test device
echo ""
echo "Installing package on test device..."
ssh "$TEST_USER@$TEST_HOST" "sudo dpkg -i /tmp/$DEB_FILENAME && sudo systemctl restart cockpit.socket || true"

echo ""
echo "========================================="
echo "Deployment complete!"
echo "========================================="
echo ""
echo "Access Cockpit at: https://$TEST_HOST:9090"
echo "Navigate to: Network > WiFi"
