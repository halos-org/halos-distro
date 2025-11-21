# HaLOS Cockpit Branding

Custom branding for Cockpit web interface with Hat Labs logo and HaLOS branding.

## Overview

This package provides custom Cockpit branding that replaces the default Debian logo with the Hat Labs logo and displays "HaLOS" as the brand name on the login screen.

## Structure

```
etc/cockpit/branding/
├── branding.css         # Custom CSS for logo and brand text
├── logo.svg             # Hat Labs logo (SVG, primary)
├── logo.png             # Hat Labs logo (PNG fallback, 100x100)
├── apple-touch-icon.png # iOS home screen icon (180x180)
└── favicon.ico          # Browser favicon (32x32)
```

## How It Works

Cockpit uses `/etc/cockpit/branding/` as an override directory that takes precedence over distribution-specific branding. When present, these files are served on the login screen without authentication.

The branding includes:
- **Badge (#badge)**: Hat Labs logo in upper-right corner of login screen (100x100px)
- **Brand text (#brand)**: "HaLOS" displayed above login fields
- **Accent color**: Custom blue-gray color (#576679) matching Hat Labs branding

## Installation

### Manual Installation

```bash
sudo mkdir -p /etc/cockpit/branding
sudo cp etc/cockpit/branding/* /etc/cockpit/branding/
sudo systemctl restart cockpit
```

### For HaLOS Image

This directory should be included in the HaLOS image build process. The files will be copied to `/etc/cockpit/branding/` during image creation.

For pi-gen integration, add to your stage configuration:

```bash
# In stage-halos/01-cockpit-branding/00-run.sh
install -d "${ROOTFS_DIR}/etc/cockpit/branding"
install -m 644 files/branding.css "${ROOTFS_DIR}/etc/cockpit/branding/"
install -m 644 files/logo.* "${ROOTFS_DIR}/etc/cockpit/branding/"
install -m 644 files/apple-touch-icon.png "${ROOTFS_DIR}/etc/cockpit/branding/"
install -m 644 files/favicon.ico "${ROOTFS_DIR}/etc/cockpit/branding/"
```

## Testing

After installation, access Cockpit at https://your-device:9090

You should see:
1. Hat Labs logo in the upper-right corner
2. "HaLOS" brand text above the login fields
3. Hat Labs favicon in browser tab

If branding doesn't appear, check:
- Files are readable: `ls -l /etc/cockpit/branding/`
- Cockpit is running: `systemctl status cockpit`
- Browser cache is cleared (Ctrl+Shift+R)

## Customization

To modify the branding:

1. **Logo**: Replace `logo.svg` and regenerate PNG files:
   ```bash
   rsvg-convert -w 100 -h 100 logo.svg -o logo.png
   rsvg-convert -w 180 -h 180 logo.svg -o apple-touch-icon.png
   rsvg-convert -w 32 -h 32 logo.svg | convert - favicon.ico
   ```

2. **Brand text**: Edit `branding.css` and change the `content:` value in `#brand::before`

3. **Accent color**: Edit `branding.css` and change `--ct-color-host-accent` value

## References

- [Cockpit Branding Documentation](../cockpit/doc/branding.md)
- [PatternFly Colors](https://www.patternfly.org/design-foundations/colors/)
