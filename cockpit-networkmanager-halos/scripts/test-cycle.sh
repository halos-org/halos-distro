#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "========================================="
echo "Full Test Cycle"
echo "========================================="
echo ""
echo "This will:"
echo "1. Build the package from wifi branch"
echo "2. Deploy to test device"
echo "3. Restart Cockpit"
echo ""

START_TIME=$(date +%s)

# Build
"$SCRIPT_DIR/build.sh"

# Deploy
"$SCRIPT_DIR/deploy.sh"

END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))

echo ""
echo "========================================="
echo "Test cycle complete in ${DURATION}s"
echo "========================================="
echo ""
echo "Target: < 5 minutes (300s)"
if [ $DURATION -lt 300 ]; then
    echo "✓ PASS: Cycle time within target!"
else
    echo "✗ FAIL: Cycle time exceeds target"
fi
