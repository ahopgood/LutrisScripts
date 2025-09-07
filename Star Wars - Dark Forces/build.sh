#!/usr/bin/env bash

VERSION="v1.22.300"

sudo apt-get install -y cmake libsdl2-dev libsdl2-image-dev

mkdir tfe-build
git clone -b ${VERSION} --depth 1 https://github.com/luciusDXL/TheForceEngine.git

cd tfe-build
cmake -S ../TheForceEngine
make -j9 # build speed up for an 8 core machine (remove to run single threaded)

cd ..
# It is important to use /* on the directories to follow the symlinks to the source code when archiving
# List of directories is obtained via observing the filesystem changes made by the make install command
tar cfJ theforceengine.tar.xz tfe-build/Captions/* \
  tfe-build/Documentation/* \
  tfe-build/EditorDef/* \
  tfe-build/ExternalData/* \
  tfe-build/Fonts/* \
  tfe-build/Mods/* \
  tfe-build/Shaders/* \
  tfe-build/SoundFonts/* \
  tfe-build/Tests/* \
  tfe-build/TheForceEngine/* \
  tfe-build/UI_Images/* \
  tfe-build/UI_Text/* \
  tfe-build/theforceengine

echo "Removing build directory and TheForceEngine git checkout"
rm -rf tfe-build
rm -rf TheForceEngine