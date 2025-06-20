# Use official Java 17 image from Eclipse Temurin
FROM eclipse-temurin:17-jdk

# Set working directory inside the container
WORKDIR /app

# Copy everything from your project into the container
COPY . .

# Grant permissions to Maven wrapper and build the project
RUN chmod +x mvnw && ./mvnw clean package -DskipTests

# Run the built JAR (assuming it's in target/*.jar)
CMD ["java", "-jar", "$(ls target/*.jar)"]
