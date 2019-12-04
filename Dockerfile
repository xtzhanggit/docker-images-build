FROM arm32v7/centos:7
MAINTAINER pitong pitong-z@outlook.com

COPY profile.txt /profile.txt
COPY jdk1.8.0_231 /jdk1.8.0_231

RUN cat profile.txt >> /etc/profile \
  && source /etc/profile \
  && ln -s /jdk1.8.0_231/bin/javac /usr/bin/javac \
  && ln -s /jdk1.8.0_231/bin/java /usr/bin/java

RUN yum install python-devel libjpeg libjpeg-devel zlib zlib-devel lcms lcms-devel python-imaging -y \
  && yum clean all && rm -rf /var/cache/yum/*

RUN \cp -rf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' >/etc/timezone
