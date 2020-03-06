#! /bin/bash
DIST='./automator/MacRipper.app/Contents/MacOS';
STUB='Application Stub';
SRC="./src";
#PIP_PACHAGES="./pip-packages";
#BIN_PYTHON="./python";
#BREW_PACKAGES="./brew-packages";

cp -p "${DIST}/${STUB}" . \
&& rm -rf $DIST \
&& mkdir -p $DIST \
&& cp -r $SRC/* $DIST \
&& mv "$STUB" $DIST;
#&& cp -r $PIP_PACHAGES $DIST \
#&& cp -r $BREW_PACKAGES $DIST \
#&& cp -r $BIN_PYTHON $DIST \

#pkgbuild \
#	--identifier MacRipper \
#	--root ./automator/MacRipper.app \
#	--install-location /Applications/MacRipper.app \
#	--version 1.0.0 \
#	--scripts ./scripts \
#	MacRipper.pkg
#	--ownership preserve \
#	--install-location /Applications \
