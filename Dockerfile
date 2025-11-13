FROM eclipse-temurin:17-jdk-jammy
WORKDIR /app
COPY . /app
RUN javac Hello.java
CMD ["java","Hello"]
