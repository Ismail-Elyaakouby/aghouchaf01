FROM java
ADD ./target/myproject-0.0.1-SNAPSHOT.jar /target/hello-world-war-1.0.6.war
ADD ./run.sh /run.sh
RUN chmod a+x /run.sh
EXPOSE 8888:8080
CMD /run.sh
