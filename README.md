# Halos Raspberry Pi OS Distribution

> **⚠️ IMPORTANT: Work in Progress**
>
> Halos is under active development and is not feature complete. Major features are still missing. Use in production environments at your own risk. Feedback and bug reports are welcome!

Halos (Hat Labs Operating System) is a containers-first Raspberry Pi distribution with web-based management. Control everything from your browser: browse an app store, install containerized services, and manage your system. No terminal required (YMMV). Works with any Raspberry Pi 4/5 or Hat Labs HALPI2.

## Browser-Based Administration

Halos provides a **unified, browser-based administration experience** through Cockpit. All system management—packages, containers, network configuration—is available from a single web interface using standard Debian tools (APT, systemd, NetworkManager).

### Why Browser-Based?

**No Desktop or Command Line Required**: Manage your entire system from any device with a web browser:
- Configure from your laptop, tablet, or phone
- No need to connect a monitor and keyboard to your Raspberry Pi
- Access your system remotely over your local network
- Works on any operating system (Windows, Mac, Linux, mobile)

**But Still Flexible**: Desktop environment and SSH access remain available for those who prefer them.

### Key Benefits

- **Single Interface**: One place for all administration tasks via Cockpit
- **Container Store**: Browse and install containerized apps as native Debian packages
- **Standard Tools**: Built on APT, systemd, and other proven Debian technologies
- **Native Packages**: Container apps as .deb packages, managed like any other software
- **Extensible Stores**: Multiple "stores" (marine apps, development tools, home automation) that filter and present relevant packages
- **Vanilla Compatible**: Works on standard Raspberry Pi OS with just `apt.hatlabs.fi` repo added

## What is Halos?

Halos transforms your Raspberry Pi into a managed server platform with:

- **Web-based system administration** via Cockpit (port 9090)
- **Container app store** via cockpit-apt with one-click installation
- **Optional marine software stack** (Signal K, InfluxDB, Grafana) for boats
- **HALPI2 hardware support** for CAN bus, RS-485, I2C interfaces and power management

**Use cases:**
- Marine electronics server for boats (NMEA 2000, instrument displays)
- Home automation and IoT gateway
- Self-hosted web applications and services
- Raspberry Pi development platform with easy container deployment

## Choosing an Image Variant

Halos comes in multiple variants to suit different hardware and use cases:

### Hardware Platform
- **HALPI2 variants**: Include drivers for Hat Labs HALPI2 hardware (CAN, RS-485, power management)
- **RPI variants**: For generic Raspberry Pi 4/5 (no HALPI2-specific drivers)

### Desktop Environment
- **Headless**: No desktop GUI, access via web interfaces only
- **Desktop**: Includes XFCE desktop environment

### Software Stack
- **Standard**: Cockpit web management with container store
- **Marine**: Adds the Marine App Store with containerized marine applications

### Available Images

| Image Name | Hardware | Desktop | Marine Apps |
|------------|----------|---------|-------------|
| `Halos-HALPI2` | HALPI2 | No | No |
| `Halos-Desktop-HALPI2` | HALPI2 | Yes | No |
| `Halos-Marine-HALPI2` | HALPI2 | No | Yes |
| `Halos-Desktop-Marine-HALPI2` | HALPI2 | Yes | Yes |
| `Halos-RPI` | Generic RPi | No | No |
| `Halos-Desktop-RPI` | Generic RPi | Yes | No |
| `Halos-Marine-RPI` | Generic RPi | No | Yes |
| `Halos-Desktop-Marine-RPI` | Generic RPi | Yes | Yes |

**Stock Raspberry Pi OS variants** (with HALPI2 drivers but no Halos web stack):
- `Raspios-lite-HALPI2`: Headless Raspberry Pi OS with HALPI2 drivers
- `Raspios-HALPI2`: Desktop Raspberry Pi OS with HALPI2 drivers

## Getting Started

### 1. Download the Image

Download your chosen image from the [Halos releases page](https://github.com/hatlabs/halos-pi-gen/releases).

### 2. Flash to SD Card or SSD

For HALPI2, follow the [Documentation flashing instructions](https://docs.hatlabs.fi/halpi2/user-guide/software.html#flashing-an-operating-system-image-to-ssd) to flash to an SSD.

For generic Raspberry Pi, follow these steps:

1. Download [Raspberry Pi Imager](https://www.raspberrypi.org/software/)
2. Insert your SD card or connect SSD via USB adapter
3. Open Raspberry Pi Imager
4. Select "Use custom" and choose your downloaded Halos image
5. Select your target drive
6. Click "Write" (do not apply OS customization settings)

### 3. First Boot

1. Insert the card/drive into your Raspberry Pi and power on
2. Wait 1-2 minutes for first boot initialization
3. Use halos.local to access the web interface

**Default credentials:**
- Username: `pi`
- Password: `raspberry`

**Important:** Change the default password immediately after first login!

## Installing on Vanilla Raspberry Pi OS

Already running Raspberry Pi OS Trixie? You can install the Halos software stack without reflashing.

### 1. Add the Hat Labs Repository

```bash
# Import the GPG key
curl -fsSL https://apt.hatlabs.fi/hat-labs-apt-key.asc | sudo gpg --dearmor -o /usr/share/keyrings/hatlabs.gpg

# Add the repository
echo "deb [signed-by=/usr/share/keyrings/hatlabs.gpg] https://apt.hatlabs.fi trixie-stable main" | sudo tee /etc/apt/sources.list.d/hatlabs.list

# Update package lists
sudo apt update
```

### 2. Install Halos

Choose the variant that fits your needs:

```bash
# Base system (Cockpit + container store)
sudo apt install halos

# Marine variant (includes marine app store and Signal K)
sudo apt install halos-marine
```

The installation will set up Cockpit and all dependencies. Access the web interface at `https://<your-pi-ip>:9090/`.

## Using Halos

### Web Management Interface

Access Cockpit from any browser on your network at [`https://halos.local:9090/`](https://halos.local:9090/):

- **Overview**: System resource monitoring and status
- **Software**: Install and manage packages, including container apps
- **Terminal**: Command-line access without SSH
- **Services**: Manage systemd services
- **Logs**: View system and application logs
- **Users**: User account management

### Installing Container Apps

1. Open Cockpit and navigate to **Software**
2. Select a store filter (e.g., "Marine Apps") to browse available applications
3. Click on an app to view details and install
4. Installed apps run as systemd services and start automatically

### Marine Apps

Marine variants include the Marine App Store with applications such as:

- **Signal K** ([`http://halos.local:3000`](http://halos.local:3000)): Marine data server and API
- **InfluxDB** ([`http://halos.local:8086`](http://halos.local:8086)): Time-series database for marine data
- **Grafana** ([`http://halos.local:3001`](http://halos.local:3001)): Data visualization and dashboards
- **AvNav** ([`http://halos.local:3011`](http://halos.local:3011)): Marine navigation software
- **OpenCPN** ([`http://halos.local:3002`](http://halos.local:3002)): Chartplotter and navigation software

Install these from the Marine Apps store in Cockpit.

### Terminal Access

- Via Cockpit: Click "Terminal" in the left sidebar
- Via SSH: `ssh pi@halos.local`

## Known Limitations

These features are planned but not yet implemented:

- **WiFi configuration in Cockpit**: Cockpit's network module doesn't yet support WiFi setup.
  - **Workaround**: Access the Cockpit terminal and run `sudo nmtui` to configure WiFi using NetworkManager's text interface.

- **Container app configuration UI**: A dedicated interface for configuring installed container apps is planned. Currently, configuration requires editing files manually.

- **Unified dashboard**: A landing page showing system status and quick links to installed apps is planned but not yet available.

## Roadmap

Halos development continues with these planned improvements:

### Current Focus: Container Configuration UI

A new Cockpit module for managing installed container apps:
- List installed apps with status indicators
- Configuration editor for app settings
- Service control (start/stop/restart)
- Log viewer integration

### Planned Features

- **Expanded app catalog**: More marine and general-purpose container apps
- **Dashboard integration**: Unified landing page with Homarr
- **Reverse proxy**: Clean URLs via Traefik (e.g., `halos.local/signalk` instead of `:3000`)
- **WiFi configuration**: Access point setup, saved networks, QR code sharing

For detailed planning documents, see the `docs/` folder and [META-PLANNING.md](META-PLANNING.md).

### Get Involved

- **Follow Progress**: [GitHub Issues](https://github.com/hatlabs/halos-distro/issues)
- **Provide Feedback**: Open issues with feature requests or bug reports
- **Contribute**: See individual component repositories for contribution guidelines

## Development

This repository acts as a workspace manager for all the components that make up Halos.

### Repository Layout

- **halos-pi-gen/** - Custom Raspberry Pi image builder based on pi-gen
- **cockpit-apt/** - Cockpit package manager with store filtering
- **cockpit-branding-halos/** - Halos branding for Cockpit
- **container-packaging-tools/** - Tool for generating container .deb packages
- **halos-marine-containers/** - Marine app definitions and store configuration
- **halos-metapackages/** - Halos and Halos-Marine metapackages
- **apt.hatlabs.fi/** - Custom APT repository for Halos packages

Each repository is independently managed. The `./run` script provides convenience commands for cloning and updating all repositories at once.

### Development Quick Start

```bash
# Clone all component repositories
./run clone-repos

# Update all repositories to latest
./run pull-all-main

# Check status of all repositories
./run status

# Build an image (requires Docker)
cd halos-pi-gen
./run docker:build "Halos-Marine-HALPI2"
```

Each repository has its own `AGENTS.md` with detailed development documentation.

## Contributing

Contributions are welcome! Each component repository accepts pull requests independently. See the individual repository documentation for specific guidelines.

## License

See individual component repositories for license information.
