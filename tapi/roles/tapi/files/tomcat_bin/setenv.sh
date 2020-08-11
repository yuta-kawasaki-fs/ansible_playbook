#gclog Setting
DATE=`date +'%Y%m%d-%H%M'`
CATALINA_OPTS="\
${CATALINA_OPTS} \
-XX:+PrintGCDetails \
-XX:+PrintGCDateStamps \
-Xloggc:${CATALINA_BASE}/logs/gc.log.${DATE} \
"

#OutOfMemoryEror HeapDump Setting                                                            
CATALINA_OPTS="\
 ${CATALINA_OPTS} \
 -XX:+HeapDumpOnOutOfMemoryError \
 -XX:HeapDumpPath=${CATALINA_BASE}/logs/hprof-dumps \
"
#JMX setting
CATALINA_OPTS="\
 ${CATALINA_OPTS} \
 -Dcom.sun.management.jmxremote=true \
 -Dcom.sun.management.jmxremote.port=9012 \
 -Dcom.sun.management.jmxremote.ssl=false \
 -Dcom.sun.management.jmxremote.authenticate=false \
"
#JVM Options
export CATALINA_OPTS="\
${CATALINA_OPTS} -server \
 -Xms8G \
 -Xmx8G \
 -XX:+UseG1GC \
 -XX:MetaspaceSize=512M \
 -XX:MaxMetaspaceSize=512M \
 -XX:ParallelGCThreads=16 \
 -XX:ConcGCThreads=4 \
 -XX:+PrintClassHistogram \
"

#PID
CATALINA_PID=/usr/local/tomcat/temp/catalina.pid