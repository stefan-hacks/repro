### repro - Reproducible Environment Manager

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

`repro` is a powerful CLI tool for Debian-based systems that automatically tracks and manages packages across multiple package managers (apt, brew, cargo, flatpak, snap). It creates reproducible system environments with zero manual configuration and provides easy system restoration.

## Features

- 🔍 **Automatic Package Tracking**: Detects installed packages across 5 package managers
- 💾 **Smart Backups**: Creates timestamped backups with hostname_date format
- 🔁 **System Reproduction**: 1-command system provisioning on new machines
- 🔎 **Package Search**: Unified search across all package managers
- ⚙️ **GNOME Settings**: Automatic backup/restoration of desktop settings
- ⏱️ **Auto Monitoring**: Hourly package tracking via systemd
- 🎨 **Colorized UI**: Intuitive interface with helpful status indicators

## Supported Package Managers
- APT (Debian/Ubuntu packages)
- Homebrew (Linuxbrew)
- Cargo (Rust packages)
- Flatpak
- Snap

## Installation

```bash
bash <(curl -sL https://raw.githubusercontent.com/yourusername/repro/main/install.sh)
```

## Usage

```
Usage: repro [OPTION] [ARGUMENTS]

Options:
  -d, --detect        Detect installed packages (update state)
  -i, --install       Install packages from current state
  -b, --backup        Create new backup
  -r, --restore ID    Restore specific backup (by name or number)
  -l, --list          List current package state
  -s, --search PKG    Search for package across all managers
  -m, --monitor       Enable automatic package monitoring
  --list-backups      List available backups
  -v, --version       Show version information
  -h, --help          Show this help message

Examples:
  repro -d              # Update package state
  repro -b              # Create new backup
  repro -r mypc_20250101120000  # Restore specific backup
  repro -r 2            # Restore backup #2 from list
  repro -s firefox      # Search for firefox package
```

## Backup Structure
Backups are stored in `~/.config/repro/backups/` with hostname-timestamp format:
```
~/.config/repro/
├── backups/
│   ├── mypc_20250101120000/
│   │   ├── apt.txt
│   │   ├── brew.txt
│   │   ├── cargo.txt
│   │   ├── flatpak.txt
│   │   ├── snap.txt
│   │   └── gnome.txt
│   └── ... 
├── state/
│   ├── apt.txt
│   ├── ...
└── repro.log
```

## Workflow

1. **Initialize**:
   ```bash
   repro --detect   # Scan installed packages
   repro --backup   # Create initial backup
   ```

2. **Daily Use**:
   ```bash
   repro --monitor  # Enable automatic tracking
   ```

3. **New System Setup**:
   ```bash
   repro --install  # Recreate your entire environment
   ```

4. **Package Search**:
   ```bash
   repro --search chromium
   ```

## Requirements
- Debian-based Linux distribution (Ubuntu, Mint, etc.)
- Bash 4.0+
- Standard package managers (apt, brew, cargo, flatpak, snap)

## License
MIT © 2023 stefan-hacks
