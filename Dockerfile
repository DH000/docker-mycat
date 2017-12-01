# 外网
# FROM registry.cn-hangzhou.aliyuncs.com/dthan/debian-wget:1.6
# 内网
FROM registry-internal.cn-hangzhou.aliyuncs.com/dthan/debian-wget:1.6

# install jre
RUN cd /usr/local && wget --no-cookies --no-check-certificate --header "Cookie:gpw_e24=http%3a%2f%2fwww.oracle.com%2ftechnetwork%2fjava%2fjavase%2fdownloads%2fjdk7-downloads-1880260.html;oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u152-b16/aa0333dd3019491ca4f6ddbe78cdb6d0/server-jre-8u152-linux-x64.tar.gz && tar -zxvf server-jre-8u152-linux-x64.tar.gz && rm -f server-jre-8u152-linux-x64.tar.gz

ENV JAVA_HOME /usr/local/jdk1.8.0_152
ENV CLASSPATH ${JAVA_HOME}/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV PATH $PATH:${JAVA_HOME}/bin

# install mycat
ADD http://dl.mycat.io/1.6-RELEASE/Mycat-server-1.6-RELEASE-20161028204710-linux.tar.gz /usr/local/
RUN cd /usr/local && tar -zxvf Mycat-server-1.6-RELEASE-20161028204710-linux.tar.gz && rm -f Mycat-server-1.6-RELEASE-20161028204710-linux.tar.gz

VOLUME /usr/local/mycat/conf
EXPOSE 8066 9066
CMD ["/usr/local/mycat/bin/mycat", "console"]