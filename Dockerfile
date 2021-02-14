FROM java
ADD ./target/hello-world-war-1.0.6.war /target/hello-world-war-1.0.6.war
ADD ./run.sh /run.sh
RUN chmod a+x /run.sh
EXPOSE 8888:8080
CMD /run.sh
