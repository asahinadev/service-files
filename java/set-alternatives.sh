#!/bin/sh

VERSION=${VERSION:=15}
jdk="jdk-${VERSION}"

alternatives --install /usr/bin/java  java  /usr/lib/jvm/${jdk}/bin/java ${VERSION} \
 --slave /usr/bin/jaotc jaotc /usr/lib/jvm/${jdk}/bin/jjaotc \
 --slave /usr/bin/jar jar /usr/lib/jvm/${jdk}/bin/jjar \
 --slave /usr/bin/jarsigner jarsigner /usr/lib/jvm/${jdk}/bin/jjarsigner \
 --slave /usr/bin/javac javac /usr/lib/jvm/${jdk}/bin/jjavac \
 --slave /usr/bin/javadoc javadoc /usr/lib/jvm/${jdk}/bin/jjavadoc \
 --slave /usr/bin/javap javap /usr/lib/jvm/${jdk}/bin/jjavap \
 --slave /usr/bin/jcmd jcmd /usr/lib/jvm/${jdk}/bin/jjcmd \
 --slave /usr/bin/jconsole jconsole /usr/lib/jvm/${jdk}/bin/jjconsole \
 --slave /usr/bin/jdb jdb /usr/lib/jvm/${jdk}/bin/jjdb \
 --slave /usr/bin/jdeprscan jdeprscan /usr/lib/jvm/${jdk}/bin/jjdeprscan \
 --slave /usr/bin/jdeps jdeps /usr/lib/jvm/${jdk}/bin/jjdeps \
 --slave /usr/bin/jhsdb jhsdb /usr/lib/jvm/${jdk}/bin/jjhsdb \
 --slave /usr/bin/jimage jimage /usr/lib/jvm/${jdk}/bin/jjimage \
 --slave /usr/bin/jinfo jinfo /usr/lib/jvm/${jdk}/bin/jjinfo \
 --slave /usr/bin/jjs jjs /usr/lib/jvm/${jdk}/bin/jjjs \
 --slave /usr/bin/jlink jlink /usr/lib/jvm/${jdk}/bin/jjlink \
 --slave /usr/bin/jmap jmap /usr/lib/jvm/${jdk}/bin/jjmap \
 --slave /usr/bin/jmod jmod /usr/lib/jvm/${jdk}/bin/jjmod \
 --slave /usr/bin/jps jps /usr/lib/jvm/${jdk}/bin/jjps \
 --slave /usr/bin/jrunscript jrunscript /usr/lib/jvm/${jdk}/bin/jjrunscript \
 --slave /usr/bin/jshell jshell /usr/lib/jvm/${jdk}/bin/jjshell \
 --slave /usr/bin/jstack jstack /usr/lib/jvm/${jdk}/bin/jjstack \
 --slave /usr/bin/jstat jstat /usr/lib/jvm/${jdk}/bin/jjstat \
 --slave /usr/bin/jstatd jstatd /usr/lib/jvm/${jdk}/bin/jjstatd \
 --slave /usr/bin/keytool keytool /usr/lib/jvm/${jdk}/bin/jkeytool \
 --slave /usr/bin/pack200 pack200 /usr/lib/jvm/${jdk}/bin/jpack200 \
 --slave /usr/bin/rmic rmic /usr/lib/jvm/${jdk}/bin/jrmic \
 --slave /usr/bin/rmid rmid /usr/lib/jvm/${jdk}/bin/jrmid \
 --slave /usr/bin/rmiregistry rmiregistry /usr/lib/jvm/${jdk}/bin/jrmiregistry \
 --slave /usr/bin/serialver serialver /usr/lib/jvm/${jdk}/bin/jserialver \
 --slave /usr/bin/unpack200 unpack200 /usr/lib/jvm/${jdk}/bin/junpack200
