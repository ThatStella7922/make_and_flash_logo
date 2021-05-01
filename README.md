# make_and_flash_logo
by ThatsNiceGuy - Bundle Version 1.2\
A bundle to convert and flash a logo to your Pinecil.

I originally wrote this small "utility" (more like script) to make flashing a logo to my Pinecil easier, as entering the commands manually to convert, convert again and then flash to my Pincil was getting really annoying. After a bit of time, I had this ready and after some polishing up, I decided it was ready to be released.\
The user experience is a bit rough around the edges but it's functional.

Expect updates, as this is gonna be my little "project" for the next little while.

### Requirements
- Windows 10 x64 PC
- Python 3.x must be installed and callable via just 'python'
- Pillow needs to be installed with Pip
- Your Pinecil must be running IronOS
- Your Pinecil needs to have the WinUSB driver installed
- Compatible logo image (96x16 black and white only)

### Usage
Download the latest version from [Releases](https://github.com/ThatsNiceGuy/make_and_flash_logo/releases), then unzip it and open the README inside. It contains plenty of info.

TLDR (but please do read the README):
- Throw your logo.png into the folder
- Connect Pinecil in DFU if you haven't already
- Run utility
- If no errors, you're done

### Included scripts
- (**Recommended**) make_and_flash_logo script
  - This will easily and quickly convert and flash a logo to your Pinecil in one click, handling everything behind the scenes and leaving your original logo image untouched.

If you need only some of the functionality of this script, there are also two smaller scripts:
- make_logo
  - This script will easily and quickly convert a logo to the Pinecil (`.bin`) and TS100/TS80/TS80P (`.hex`) formats
- flash_logo 
  - This script will easily and quickly flash a converted logo to the Pinecil. (TS100/TS80/TS80P flashing is not supported)

### Updates
No updating mechanism is implemented. You can check the releases page for new versions.

### Support
No support is provided. Use of this application is your own responsibility.\
Instructions and more are in the README.

### Contribution
Contribution is welcomed and you can contribute as easily as opening an issue to report a bug or opening a pull request to improve the script or the documentation.

### Credits
Most of the documentation, and the img2ts100.py script:
https://github.com/Ralim/IronOS/blob/v2.14.1/Documentation/Logo.md

The objcopy binary used in this bundle:
https://github.com/metalcode-eu/windows-arm-none-eabi/blob/master/bin/arm-none-eabi-objcopy.exe

The dfu-util 0.10 binary used in this bundle:
http://dfu-util.sourceforge.net/releases

As for the licensing, I own nothing but the make_and_flash_logo script and provided documentation. If you use/modify my script, just credit me. No monetary use of it is allowed. Other files used here may have different policies.

If you are the owner of any of the included binaries, please [contact me](https://github.com/ThatsNiceGuy/ThatsNiceGuy#contact) or open an issue if you have any concerns with the usage of these files or for removal.\
This is a small project for my convenience, and I don't intend to violate any licensing terms or profit off of this.
