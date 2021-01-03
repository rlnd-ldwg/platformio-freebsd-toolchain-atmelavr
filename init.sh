#!/bin/sh

# avr toolchain

: ${AVR_DIR:="/usr/local/avr"}
: ${AVR_GCC_DIR:="/usr/local/lib/gcc/avr"}

VERSION="1.50400.190710"
DESC="toolchain-atmelavr"
REPO_NAME="platformio-freebsd-${DESC}"
REPO_OWNER="rlnd-ldwg"

ARCH=`uname -p`
OS=`uname -s | tr '[[:upper:]]' '[[:lower:]]'`

if [ ! -z $1 ]; then
    VERSION="$1"
fi

ln -s -f ${AVR_DIR} .
mkdir -p lib/gcc
ln -s -f ${AVR_GCC_DIR} lib/gcc/avr

cat <<__EOF__ >package.json
{
    "description": "${DESC}",
    "name": "${DESC}",
    "system": [
        "${OS}_${ARCH}"
    ],
    "url": "https://github.com/${REPO_OWNER}/${REPO_NAME}",
    "version": "${VERSION}"
}
__EOF__

cat <<__EOF__ >.piopm
{"type": "tool", "name": "$DESC", "version": "$VERSION", "spec": {"owner": "platformio", "id": 8203, "name": "$DESC", "requirements": null, "url": null}}
__EOF__


# avrdude

: ${AVRDUDE:="/usr/local/bin/avrdude"}
: ${AVRDUDE_CONF:="/usr/local/etc/avrdude.conf"}

VERSION="1.60300.200527"
DESC="tool-avrdude"
REPO_NAME="platformio-freebsd-${DESC}"
REPO_OWNER="rlnd-ldwg"

mkdir bin
ln -s ${AVRDUDE} bin/avrdude

cat <<__EOF__ >package.json
{
    "description": "${DESC}",
    "name": "${DESC}",
    "system": [
        "${OS}_${ARCH}"
    ],  
    "url": "https://github.com/${REPO_OWNER}/${REPO_NAME}",
    "version": "${VERSION}"
}
__EOF__
 
cat <<__EOF__ >.piopm
{"type": "tool", "name": "$DESC", "version": "$VERSION", "spec": {"owner": "platformio", "id": , "name": "$DESC", "requirements": null, "url": null}}
__EOF__

