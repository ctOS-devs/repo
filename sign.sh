#!/bin/sh

apk index -vU -o APKINDEX.tar.gz *.apk
abuild-sign -k /root/.abuild/root-67b84d1c.rsa APKINDEX.tar.gz
