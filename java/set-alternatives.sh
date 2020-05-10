#!/bin/sh

VERSION=${VERSION:=15}
jdk="jdk-${VERSION}"

alternatives --install /usr/bin/java  java  /usr/lib/jvm/${jdk}/bin/java ${VERSION} \
 --slave /usr/bin/jaotc jaotc /usr/lib/jvm/${jdk}/bin/jaotc \
 --slave /usr/bin/jar jar /usr/lib/jvm/${jdk}/bin/jar \
 --slave /usr/bin/jarsigner jarsigner /usr/lib/jvm/${jdk}/bin/jarsigner \
 --slave /usr/bin/javac javac /usr/lib/jvm/${jdk}/bin/javac \
 --slave /usr/bin/javadoc javadoc /usr/lib/jvm/${jdk}/bin/javadoc \
 --slave /usr/bin/javap javap /usr/lib/jvm/${jdk}/bin/javap \
 --slave /usr/bin/jcmd jcmd /usr/lib/jvm/${jdk}/bin/jcmd \
 --slave /usr/bin/jconsole jconsole /usr/lib/jvm/${jdk}/bin/jconsole \
 --slave /usr/bin/jdb jdb /usr/lib/jvm/${jdk}/bin/jdb \
 --slave /usr/bin/jdeprscan jdeprscan /usr/lib/jvm/${jdk}/bin/jdeprscan \
 --slave /usr/bin/jdeps jdeps /usr/lib/jvm/${jdk}/bin/jdeps \
 --slave /usr/bin/jhsdb jhsdb /usr/lib/jvm/${jdk}/bin/jhsdb \
 --slave /usr/bin/jimage jimage /usr/lib/jvm/${jdk}/bin/jimage \
 --slave /usr/bin/jinfo jinfo /usr/lib/jvm/${jdk}/bin/jinfo \
 --slave /usr/bin/jjs jjs /usr/lib/jvm/${jdk}/bin/jjs \
 --slave /usr/bin/jlink jlink /usr/lib/jvm/${jdk}/bin/jlink \
 --slave /usr/bin/jmap jmap /usr/lib/jvm/${jdk}/bin/jmap \
 --slave /usr/bin/jmod jmod /usr/lib/jvm/${jdk}/bin/jmod \
 --slave /usr/bin/jps jps /usr/lib/jvm/${jdk}/bin/jps \
 --slave /usr/bin/jrunscript jrunscript /usr/lib/jvm/${jdk}/bin/jrunscript \
 --slave /usr/bin/jshell jshell /usr/lib/jvm/${jdk}/bin/jshell \
 --slave /usr/bin/jstack jstack /usr/lib/jvm/${jdk}/bin/jstack \
 --slave /usr/bin/jstat jstat /usr/lib/jvm/${jdk}/bin/jstat \
 --slave /usr/bin/jstatd jstatd /usr/lib/jvm/${jdk}/bin/jstatd \
 --slave /usr/bin/keytool keytool /usr/lib/jvm/${jdk}/bin/keytool \
 --slave /usr/bin/pack200 pack200 /usr/lib/jvm/${jdk}/bin/pack200 \
 --slave /usr/bin/rmic rmic /usr/lib/jvm/${jdk}/bin/rmic \
 --slave /usr/bin/rmid rmid /usr/lib/jvm/${jdk}/bin/rmid \
 --slave /usr/bin/rmiregistry rmiregistry /usr/lib/jvm/${jdk}/bin/rmiregistry \
 --slave /usr/bin/serialver serialver /usr/lib/jvm/${jdk}/bin/serialver \
 --slave /usr/bin/unpack200 unpack200 /usr/lib/jvm/${jdk}/bin/unpack200
