# Install GHC-7.10 on CircleCI instance
#
# Note that you need to set GHC-7.8.3 in CircleCI
# for this script to work.

# Get current directory
d0=`pwd`
# GMP
sudo apt-get install libgmp3-dev
# Go up one directory
cd ..
# GHC-7.10 installation starts
mkdir ghc-script
cd ghc-script
# Get the compiler
wget https://www.haskell.org/ghc/dist/7.10.1/ghc-7.10.1-x86_64-unknown-linux-deb7.tar.bz2
tar jxvf ghc-7.10.1-x86_64-unknown-linux-deb7.tar.bz2
cd ghc-7.10.1
# Install it
cp /usr/lib/x86_64-linux-gnu/libgmp.so.10 ghc-7.10.1/libgmp.so.10
./configure
sudo make install
# Exit the GHC directory
cd ..
# Update binaries
sudo cp /usr/local/bin/ghc /opt/ghc/7.8.3/bin/ghc
sudo cp /usr/local/bin/ghc-pkg /opt/ghc/7.8.3/bin/ghc-pkg
sudo cp /usr/local/bin/haddock /opt/ghc/7.8.3/bin/haddock
# Check GHC version
ghc --version
# Cabal installation
wget http://hackage.haskell.org/package/cabal-install-1.22.2.0/cabal-install-1.22.2.0.tar.gz
tar zxvf cabal-install-1.22.2.0.tar.gz
cd cabal-install-1.22.2.0
sh bootstrap.sh
sudo cp /home/ubuntu/.cabal/bin/cabal /opt/cabal/1.20/bin/cabal
# Check Cabal version
cabal --version
# Return to original directory
cd $d0
