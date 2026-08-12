# Container Level Sensor
by Benjie Jiao

[![CC BY-SA 4.0][cc-by-sa-shield]][cc-by-sa]

A DIY sensor for measuring the fill level of a container (e.g. a water tank),
based on an ESP32-C3 and a VL53L0x time-of-flight distance sensor, reporting
to Home Assistant over ESPHome.

## Repository contents

- `hardware/kicad/ContainerLevelSensor/` — KiCad project (schematic + PCB) for
  the sensor board. Open `ContainerLevelSensor.kicad_pro` in KiCad to view or
  edit the design.

  ![Schematic](hardware/kicad/ContainerLevelSensor/ContainerLevelSensor%20v1.1%20-%20Schematic.png)
- `hardware/kicad/Fabrication/` — Generated Gerber/drill files and a ready-to
  order `.zip`, for sending straight to a PCB fab (e.g. PCBWay).
- `hardware/openscad/ContainerLevelSensor.scad` — Parametric enclosure,
  generated with [YAPP_Box](hardware/openscad/YAPP_Box) (included as a git
  submodule — run `git submodule update --init --recursive` before opening
  the `.scad` file in OpenSCAD). `ContainerLevelSensor.stl` is the pre-rendered
  mesh, ready to send to a 3D slicer as-is.
- `hardware/old_revisions/` — Earlier hardware revisions, kept for reference.
- `software/esphome/container-level.yaml` — [ESPHome](https://esphome.io)
  firmware configuration for the ESP32-C3. See "Flashing the firmware" below.

## Flashing the firmware

1. In Home Assistant, install the [ESPHome add-on](https://esphome.io/guides/getting_started_hassio.html)
   from Settings → Add-ons → Add-on Store (search for "ESPHome"), then start it.
2. Open the ESPHome add-on's web UI (or the ESPHome dashboard panel in the
   sidebar) and add a new device, then replace its generated YAML with the
   contents of `software/esphome/container-level.yaml`.
3. The add-on manages Wi-Fi credentials and secrets for you — when prompted,
   enter your Wi-Fi SSID/password; these are stored in its own `secrets.yaml`.
4. Replace the placeholder `api.encryption.key` and `ota.password` values in
   the config with your own (the dashboard can generate these for you when
   creating the device).
5. Connect the ESP32-C3 board over USB to the machine running Home Assistant
   (or use "Wirelessly" for subsequent updates once initially flashed), then
   click **Install** in the ESPHome dashboard for that device.
6. Once flashed, the device auto-connects to Home Assistant via the ESPHome
   integration, exposing the raw `VL53L0x Distance` reading and a computed
   `Level` percentage.

The `Keep Awake Jumper` pin (GPIO3) holds the board awake for
reflashing/debugging; otherwise the board deep-sleeps between readings to
save battery. Adjust `bottom_distance` in the `Level` sensor's lambda to
match the distance (in meters) from the sensor to the bottom of your
container.

## License

This work is licensed under a
[Creative Commons Attribution-ShareAlike 4.0 International License][cc-by-sa].

[![CC BY-SA 4.0][cc-by-sa-image]][cc-by-sa]

[cc-by-sa]: http://creativecommons.org/licenses/by-sa/4.0/
[cc-by-sa-image]: https://licensebuttons.net/l/by-sa/4.0/88x31.png
[cc-by-sa-shield]: https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg