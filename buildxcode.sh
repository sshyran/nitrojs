v8=$(pwd)
target="/build/xcode-mame"
set -e
./mountbuild.sh
if [ ! -d $target ]; then
  mkdir $target
fi
cd $target
cmake -D"CMAKE_CONFIGURATION_TYPES=Release;Debug;MinSizeRel;RelWithDebInfo" -D"CMAKE_BUILD_TYPE=Release" -D"MAC=1" -GXcode $v8
# xcodebuild
