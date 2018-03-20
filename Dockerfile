FROM java:8-jre 
MAINTAINER JaminNXx (https://github.com/jaminNZx)
ENV BLYNK_SERVER_VERSION 0.33.2
RUN mkdir /blynk
RUN curl -L https://github.com/blynkkk/blynk-server/releases/download/v${BLYNK_SERVER_VERSION}/server-${BLYNK_SERVER_VERSION}-java8.jar > /blynk/server.jar
RUN mkdir /data
RUN ln -s /data/server.properties /blynk/server.properties
RUN ln -s /data/mail.properties /blynk/mail.properties
RUN ln -s /data/sms.properties /blynk/sms.properties
EXPOSE 8441 8442 8443 9443 8080
WORKDIR /data
ENTRYPOINT ["java", "-jar", "/blynk/server.jar", "-dataFolder", "/data"]
