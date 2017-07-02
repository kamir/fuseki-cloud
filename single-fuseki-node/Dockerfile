# Use python:2.7.13-alpine
FROM openjdk:8u121-jdk-alpine

RUN apk --no-cache add openssl
RUN apk --no-cache add wget
RUN apk --no-cache add bash
RUN apk --no-cache add mc

RUN wget http://apache.mirror.iphh.net/jena/binaries/apache-jena-fuseki-2.6.0.zip && unzip apache-jena-fuseki-2.6.0.zip

RUN chmod +x /apache-jena-fuseki-2.6.0/fuseki-server 

ENV FUSEKI_HOME /apache-jena-fuseki-2.6.0
ENV FUSEKI_BASE /etc/fuseki

# Expose port 3030
EXPOSE 3030

CMD ["sudo mkdir /etc/fuseki"]
COPY fuseki-cfg/shiro.ini /etc/fuseki/shiro.ini

# Run command on startup:  
CMD ["/apache-jena-fuseki-2.6.0/fuseki-server", "--update", "--mem", "/emdm"]

#
# BUILD the image ...
#
# docker build -t emdm-fuseki-server-image:latest .



#
# DEBUG the image manually ...
#
# docker run -it emdm-fuseki-server-image sh



#
# Remove the image ...	
#
#
# docker rmi emdm-fuseki-server-image -f



#
# Run the image 
#
# docker run -d --publish $DOCKER_IP:3030:3030 --name=emdm-fuseki-server-container-6 emdm-fuseki-server-image



#
# Connect to the running container 
#
# docker exec -it CONT_ID bash
