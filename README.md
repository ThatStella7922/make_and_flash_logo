![Logo image](logo.png)
# make_and_flash_logo
by ThatsNiceGuy - Repo Version v2.11\
Currently Available [Release](https://github.com/ThatsNiceGuy/make_and_flash_logo/releases) is v2.11\
A bundle to convert and flash a logo to your Pinecil.

I originally wrote this small "utility" (more like script) to make flashing a logo to my Pinecil easier, as entering the commands manually to convert, convert again and then flash to my Pincil was getting really annoying. After a bit of time, I had this ready and after some polishing up, I decided it was ready to be released.\
After lots of updates, the user experience is now pretty decent.

Expect some updates, as this is gonna be my little "project" for the next little while.

### Features
- Quick and easy logo conversion and flashing
- Good (it's still a command prompt window) user experience
- Error handling
- Basic Preferences system
- ???

### Requirements
- Windows 10 x64 PC
  - macOS and Linux aren't supported and there are no plans for supporting these OSes.
- Python 3.x must be installed and callable via just 'python'
  - basically just make sure it's in your PATH variable
- Pillow needs to be installed via Pip
  - **PIL (Python Imaging Library) will not work! You need Pillow!**
- Your Pinecil must be running IronOS v2.15 or later
  - For version v2.1 and later of make_and_flash_logo, IronOS v2.15 or later is MANDATORY.
    - Use v2.0 or older of make_and_flash_logo if you don't want to update your Pinecil.
- Your Pinecil needs to have the WinUSB driver installed (You can use [Zadig](https://zadig.akeo.ie/) to install it)
- Compatible logo image
  - 96x16 monochrome (black and white) PNG file
  - Example image included

### Usage
1. Download the latest version from [Releases](https://github.com/ThatsNiceGuy/make_and_flash_logo/releases) and unzip it
2. **(Optional)** Place your `logo.png` inside the folder, same place where the scripts are.\
<sub>If you don't do this, you will be asked for the file path in scripts that convert logos.</sub>

Now you can either:
- Quick use:
  1. Connect Pinecil in DFU if you haven't already
  2. Run make_and_flash_logo
  3. Go through initial setup if you haven't already
  4. (Provide path of the logo if asked) and wait for it to convert
  5. If no errors, your Pinecil will now show your custom logo on boot!

- Read the INSTRUCTION to know the full capabilities and features
  1. This is what I recommend, it has extra notes and stuff in it.

### Included scripts
- (**Recommended**) make_and_flash_logo script
  - This will easily and quickly convert and flash a logo to your Pinecil in one click, handling everything behind the scenes and leaving your original logo image untouched.

If you need only some of the functionality of this script, there are also two smaller scripts:
- make_logo
  - This script will easily and quickly convert a logo to the Pinecil (`.bin`) and TS100/TS80/TS80P (`.hex`) formats
- flash_logo 
  - This script will easily and quickly flash a converted logo to the Pinecil. (TS100/TS80/TS80P flashing is not supported)
- flash_ironos
  - This script will quickly flash an updated IronOS to your Pinecil that is already running IronOS

Instructions for all the scripts are in the INSTRUCTION

### Updates
No updating mechanism is implemented. You can check the releases page for new versions.

#### Repo Version vs Currently Available Release?
Repo Version you can think of like a nightly build or something built on every commit. **Likely untested, probably unfinished things.** To use these, you can check whether the repo version is higher than the currently available release version, and if it is then you can clone the repo and poke at the files. This is not recommended to do because as said previously stuff is unfinished and sometimes untested.

Currently Available Release is something I finish, test, and call 'good enough to release'. These are complete releases.\
See **Usage** above for details on how to get the releases.

### Limitation of Liability
By using any of the scripts provided here, you agree that you take full responsibility for anything that may happen, whether it be a successful flash or a bricked Pinecil. I will work with you to resolve bugs, BUT I am not obligated to replace damaged hardware (if any) or compensate you in any way.
  
Your use of these scripts are your responsibility and I will not be held responsible if anything happens.

### Contribution
Contribution is welcomed and you can contribute as easily as opening an issue to report bugs or opening a pull request to improve the script or the documentation.

### Credits
Most of the documentation, and the img2ts100.py script:
https://github.com/Ralim/IronOS/blob/master/Documentation/Logo.md

The objcopy binary used in this bundle:
https://github.com/metalcode-eu/windows-arm-none-eabi/blob/master/bin/arm-none-eabi-objcopy.exe

The dfu-util 0.10 binary used in this bundle:
http://dfu-util.sourceforge.net/releases

As for the licensing, I own nothing but the make_and_flash_logo script and provided documentation. If you use/modify my script, just credit me. No monetary use of it is allowed. Other files used here may have different policies.

If you are the owner of any of the included binaries, please [contact me](https://github.com/ThatsNiceGuy/ThatsNiceGuy#contact) or open an issue if you have any concerns with the usage of or removal of these files.\
This is a small project for my convenience, and I don't intend to violate any licensing terms or profit off of this.

Thanks for looking!\
With ❤️ from ThatsNiceGuy
