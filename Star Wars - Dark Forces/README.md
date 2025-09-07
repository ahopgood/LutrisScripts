# Star Wars - Dark Forces

## Technical notes:
* Fetches and uses the Linux gog installer for Dark Forces
* Uses The Force Engine (TFE) release tag [v1.22.300](https://github.com/luciusDXL/TheForceEngine/releases/tag/v1.22.300)

## Credits
* The Force Engine (TFE): https://github.com/luciusDXL/TheForceEngine
* Inspired by the script here from [legluondunet/MyLittleLutrisScripts/](https://github.com/legluondunet/MyLittleLutrisScripts/tree/master/Star%20Wars%20-%20Dark%20Forces)

## Building TFE
* `build.sh` script follows the [linux build guide](https://github.com/luciusDXL/TheForceEngine?tab=readme-ov-file#linux) for TFE
* It essentially does the following steps:
  * Installs cmake, libsdl2 and lidsdl2-image
  ```
  sudo apt-get install libsdl2-dev libsdl2-image-dev cmake
  ```
  * Creates a build directory
  * Checks out the TFE project
  * Runs cmake and outputs the build artifacts to the build directory
  * Creates a compressed archive of the artifacts via tar with xz compression


## Testing the Lutris Script 
* Start a local web server to host your copy of TFE
```
python3 -m http.server 8080
```
* Build a local version of Lutris script template pointing to `http://localhost:8080`
  ```
  ./local.sh
  ``` 
  * This updates the `engine:` field to point to `http://localhost:8080/theforceengine.tar.xz`
  * And generates the file `local.local.Star Wars - Dark Forces - GOG - TFE.yaml`
* Run the Lutris script: 
```
lutris -i "${PWD}"/local.Star\ Wars\ -\ Dark\ Forces\ -\ GOG\ -\ TFE.yaml
```