BRANCH=`git rev-parse --abbrev-ref HEAD`
VERSION=$(echo "$branch" | grep -oP '(?<=release_)[0-9]+\.[0-9]+\.[0-9]+(?=-based)')

cmake -S llvm --preset=release -DCMAKE_INSTALL_PREFIX=llvm-msvc2022/ && \
cmake --build build-release/ && \
cmake --build build-release/ --target install && \
cp ./build-release/lib/clang.lib llvm-msvc2022/lib && \
tar cvzf llvm-$VERSION-msvc2022.tgz llvm-msvc2022/
