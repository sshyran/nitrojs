v8=$(pwd)
nitrobin=$v8/../../bin
target="/build/v8"
set -e
if [ ! -d $target ]; then
  mkdir $target
fi
cd $target
cmake -D"CMAKE_BUILD_TYPE=Release" -D"PI=1" -G"Unix Makefiles" $v8
make -j 8
ls -l .
