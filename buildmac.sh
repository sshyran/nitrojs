v8=$(pwd)
nitrobin=$v8/../nitro/bin
build="/build"
target="$build/v8-make"
set -e
./mountbuild.sh
if [ ! -d $target ]; then
  mkdir $target
fi
cd $target
cmake -D"CMAKE_BUILD_TYPE=Release" -D"MAC=1" -G"Unix Makefiles" $v8
make -j 8
ls -l
