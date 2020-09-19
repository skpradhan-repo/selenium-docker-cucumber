FROM openjdk:8u191-jre-alpine3.8

RUN apk add curl jq

# Workspace
WORKDIR /usr/share/samsoft

# ADD .jar under target from host
# into this image
ADD target/selenium-docker.jar 			selenium-docker.jar
ADD target/selenium-docker-tests.jar 	selenium-docker-tests.jar
ADD target/libs							libs

# in case of any other dependency like .csv / .json / .xls
# please ADD that as well

# ADD suite files
# ADD book-flight-module.xml				book-flight-module.xml
# ADD search-module.xml					search-module.xml

# ADD health check script
#ADD healthcheck.sh                      healthcheck.sh
#RUN wget https://s3.amazonaws.com/selenium-docker/healthcheck/healthcheck.sh

# BROWSER
# HUB_HOST
# MODULE

ENTRYPOINT java -cp selenium-docker.jar:selenium-docker-tests.jar:libs/* \
               -DHUB_HOST=$HUB_HOST \
               -DBROWSER=$BROWSER \
               -Dcucumber.options="$CUCUMBER_OPTIONS" \
               org.testng.TestNG \
               -testclass \
               com.runner.TestRunner