# ⭐ Ultimate Magcubic Projector Rooting Guide

### *(Magisk + HDMI-IN State Detection + IR Override + Debloat)*

This document is a **complete step-by-step reference** for rooting Magcubic / HY300 Pro–type projectors, rebuilding the firmware, and installing Magisk modules to:

* detect **HDMI-IN plug/unplug state**
* auto-switch to HDMI
* override IR remote keys (volume, power, etc.)

It lets you redo the whole procedure later **without guesswork**.

---

# 🚀 1. Requirements

* A **Magcubic / HY300 Pro-series projector (Allwinner / Sunxi)**
* Windows or Linux PC with **ADB**
* USB Debugging enabled
* Original projector firmware dump (from the manufacturer)
* **Magisk** installed after rooting

> ⚠ NOTE: Rooting voids warranty. Do this at your own risk.

---

# 🔧 2. Enable Developer Options

1. Open **Settings → About device**
2. Tap **Build number** 7 times
3. The **Developer options** menu appears

---

# 🔌 3. Enable USB Debugging

```text
Settings → System → Developer options → USB debugging
```

Turn it ON and leave it enabled.

---

# 📦 4. Get, Extract and Patch the Firmware

---

## 4.1. Get the original firmware

1. **Contact the projector manufacturer** and request the full firmware.
2. You should receive a **firmware file** (or package containing it) - most likely a **`.img` file**.

---

## 4.2. Extract `boot.fex` from the `.dmp`

Use **imagewty-tool**:

> [https://github.com/uictorius/imagewty-tool/releases/download/v1.0.0/imagewty-tool-1.0.0-x86_64.zip](https://github.com/uictorius/imagewty-tool/releases/download/v1.0.0/imagewty-tool-1.0.0-x86_64.zip)

* If you are on **Windows**, run this **via WSL (Linux subsystem)**.
* Use `imagewty-tool` on the firmware **`.img` file**.
* The tool will **create a folder ending by `.dmp`** 
* Inside this extracted folder, locate **`boot.fex`**.

---

## 4.3. Download Magisk APK

Download the official Magisk APK here:

> [https://github.com/topjohnwu/Magisk/releases](https://github.com/topjohnwu/Magisk/releases)

Keep it for later installation on the projector, and also for patching if needed.

---

## 4.4. Patch `boot.fex` with Magisk Patcher

Use the online Magisk patcher you specified:

> [https://circlecashteam.github.io/MagiskPatcher/](https://circlecashteam.github.io/MagiskPatcher/)

Steps:

1. Select your extracted **`boot.fex`**.
2. Enable **all options except *recovery*** (as you wrote: “toutes les options sauf recovery”).
3. Let the tool patch the file.
4. Download the patched file.
5. **Rename it to `boot.fex`** again.
6. **Overwrite** the original `boot.fex` in the extracted `.dmp` folder (i.e. replace the stock boot with the Magisk-patched one).

---

## 4.5. Repack the `.dmp` into a rooted image

From that modified dump:

* **Repack the `.dmp` with imagewty-tool to create**:

```text
update_rooted.img
```

This `update_rooted.img` is the **new rooted firmware image** that you will flash with PhoenixSuit.

---

# 🧰 5. Windows: Disable Core Isolation & Install PhoenixSuit Driver

1. **Disable Windows Defender Core Isolation**
   (Otherwise the unsigned USB driver may fail to install.)

2. Run the driver installer:

   ```text
   PhoenixSuit_V1.19\Drivers\DPInst64.exe
   ```

3. Open **Device Manager** and check the device:

   * If the driver is **not** correctly installed:

     * Right-click the device → **Update driver**
     * Choose “Browse my computer for drivers”
     * Point it to: `PhoenixSuit_V1.19\Drivers`
   * The driver **must not show any error icon**.

---

# ⚡ 6. Put the Projector into FEL Mode (Flash Mode)

Exact sequence :

1. **Turn everything off:**

   * Power off the projector
   * Unplug **USB**
   * Unplug **power**

2. On the projector remote:

   * Press and hold the **Power button for 5 seconds**

3. While still holding the button:

   * Plug in the **USB cable** to the PC

4. Wait **10 seconds**

5. Plug in the **power adapter**

6. Wait **about 5 seconds**
   → the projector should power on automatically

7. Now **release** the Power button

At this point the PC should detect the projector in **FEL mode**.

---

# 🔥 7. Flash `update_rooted.img` with PhoenixSuit

1. Launch **PhoenixSuit**
2. Select the **disk image**: `update_rooted.img`
3. Start the flashing process

When it finishes and the device reboots:

> ✅ **The projector is now rooted.**
> (Boot image is Magisk-patched.)

---

# 📱 8. Finish Magisk Setup on the Projector

1. Install / open the **Magisk APK** on the projector.
2. Let Magisk do its **initial setup / installation**.
3. Reboot when it asks you to.

Magisk root is now **fully operational on the projector**.

---

# 🧩 9. Install Magisk Modules (HDMI + IR override)

1. **Install the attached Magisk modules if you want Android TV**
2. You can add your own extra modules.
   For example, you can have a module that:
   * **Automatically switches to HDMI** input
   * **Intercepts IR remote commands** (volume, power)
   * Forwards those IR actions to a **Fire Stick**, so you no longer need the projector’s own remote.
   * Block chinese hosts

Result: one remote to control everything (projector power/volume + Fire Stick).



---

# 🏁 DONE

Your Magcubic / HY300 Pro-type projector is now:

* ✔ Rooted (Magisk-patched `boot.fex`)
* ✔ Magisk fully installed
* ✔ HDMI-IN state detectable
* ✔ Ready for **auto-HDMI** behavior
* ✔ IR keys can be overridden (e.g. for Fire Stick control)
