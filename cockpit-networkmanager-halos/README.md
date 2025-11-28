# cockpit-networkmanager-halos

HaLOS-specific build of Cockpit's NetworkManager module with comprehensive WiFi support.

## Overview

This package provides a replacement for the upstream `cockpit-networkmanager` package with WiFi configuration features under development for HaLOS (Hat Labs Operating System).

**Features (in development):**
- WiFi network scanning and connection management
- WPA2/WPA3 Personal authentication
- Access Point (hotspot) mode configuration
- Simultaneous AP + Client mode support

**Status:** Development infrastructure (Issue #1) - Feature implementation in progress

## Package Information

- **Source**: Built from [hatlabs/cockpit](https://github.com/hatlabs/cockpit) (wifi branch)
- **Replaces**: cockpit-networkmanager (official package)
- **Architecture**: all (platform-independent JavaScript/HTML/CSS)
- **Dependencies**: cockpit (>= 276), network-manager (>= 1.20)

## Development Workflow

### Prerequisites

- Docker Desktop or Docker Engine
- Git
- SSH access to test device (default: halos.local)

### Quick Start

```bash
# 1. Build Docker image (first time only)
./run docker-build

# 2. Build package
./run build

# 3. Deploy to test device
./run deploy

# 4. Or do both in one step
./run test-cycle
```

### Development Iteration Cycle

The typical development workflow:

```bash
# Edit code in hatlabs/cockpit fork (wifi branch)
cd ../cockpit/pkg/networkmanager
# ... make changes to wifi.jsx, wifi-dialogs.jsx, etc. ...
git commit -m "feat(wifi): add network scanning"
git push origin wifi

# Build and deploy
cd ../../cockpit-networkmanager-halos
./run build      # Fetches latest from wifi branch, builds .deb
./run deploy     # Deploys to halos.local, restarts Cockpit

# Test at https://halos.local:9090
```

**Target iteration time:** < 5 minutes (build + deploy)

### Available Commands

Run `./run help` for full command list:

- `./run build` - Build Debian package in Docker container
- `./run deploy` - Deploy package to test device
- `./run test-cycle` - Full build + deploy cycle
- `./run docker-build` - Build Docker image
- `./run clean` - Remove build artifacts

### Configuration

Environment variables for deployment:

- `TEST_HOST` - Test device hostname (default: halos.local)
- `TEST_USER` - Test device username (default: mairas)

Example:

```bash
TEST_HOST=192.168.1.100 TEST_USER=pi ./run deploy
