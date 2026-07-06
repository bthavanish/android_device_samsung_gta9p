# Device Tree for Samsung Galaxy Tab A9+ 5G (gta9p)

## Device specifications

| Device | Samsung Galaxy Tab A9+ 5G |
| --- | --- |
| Model | SM-X216B |
| SoC | Qualcomm SM6375 (Snapdragon 695) |
| Display | 1200x1920, 120Hz, 450 dpi |
| RAM | 4/8 GB |
| Storage | 64/128 GB |
| Android | 14 (LineageOS 21) |

## Build instructions

```bash
repo init -u https://github.com/LineageOS/android.git -b lineage-21
repo sync
```

```bash
. build/envsetup.sh
lunch lineage_gta9p-userdebug
mka bacon
```

## Device-specific source

- [device/samsung/gta9p-common](https://github.com/LineageOS/android_device_samsung_gta9p-common)

## Extracting proprietary blobs

```bash
# Place the Samsung firmware zip in the device tree directory
python3 extract-files.py
```

## Regenerating vendor makefiles

```bash
python3 setup-makefiles.py
```
