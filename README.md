# PadKontrol Looper Module

This module provides a Pure Data patch for the PadKontrol Looper project.

## Installation

    patchbox module install https://github.com/jamiewannenburg/padkontrol-looper.git

Manual

1. SSH into your Raspberry Pi
2. Navigate to the patchbox modules directory:
   ```bash
   cd /home/patchbox/modules
   ```
3. Clone this repository:
   ```bash
   git clone https://github.com/jamiewannenburg/padkontrol-looper.git
   ```
4. Restart Patchbox:
   ```bash
   sudo systemctl restart patchbox
   ```

## Usage

The module will be available in the Patchbox menu under "PadKontrol Looper".

    patchbox module activate padkontrol-looper

## Requirements

- Patchbox OS
- Pure Data
- PadKontrol MIDI controller

## License

This module is licensed under the MIT License. 