# Teamflow

Teamflow is a Spring Boot application management system written in Java that supports full CRUD operations and database migrations. This project is based on the [Taming Thymeleaf Sources](https://github.com/wimdeblauwe/taming-thymeleaf-sources) tutorial. The original project did not include PostgreSQL or migration scripts, which were added to improve learning and usability.

This project is:

- Full CRUD
- JWT authentication
- Postgresql first
- Includes migration scripts



## How to Run Teamflow

### 1. Environment Information

<details>
<summary>Click to expand!</summary>

### Java

```sh
$ java --version
java 17.0.11 2024-04-16 LTS
Java(TM) SE Runtime Environment (build 17.0.11+7-LTS-207)
Java HotSpot(TM) 64-Bit Server VM (build 17.0.11+7-LTS-207, mixed mode, sharing)
```

### Maven

```sh
$ mvn -v
Apache Maven 3.9.7 (8b094c9513efc1b9ce2d952b3b9c8eaedaf8cbf0)
Maven home: /opt/apache-maven-3.9.7
Java version: 17.0.11, vendor: Oracle Corporation, runtime: /opt/jdk-17.0.11
Default locale: en_US, platform encoding: UTF-8
OS name: "linux", version: "6.1.0-21-amd64", arch: "amd64", family: "unix"
```

### PostgreSQL

```sh
$ psql --version
psql (PostgreSQL) 16.3 (Debian 16.3-1.pgdg120+1)
```

### System Information

```sh
OS version: Debian GNU/Linux 12 (bookworm)
RAM available: 14Gi (GiB, or gibibytes)
Hard disk: 28G (GiB)
Intel version: Intel(R) Core(TM) i5-8250U CPU @ 1.60GHz
SSD model: Samsung SSD 860 EVO 500GB
```
</details>

### 2. Setup Database

<details>
<summary>Click to expand!</summary>


1. Access the PostgreSQL command line:

    ```sh
    sudo -u postgres psql
    ```

2. Create the `teamflow` database:

    ```sql
    CREATE DATABASE teamflow;
    ```

3. Create a user:

    ```sql
    CREATE USER allaboutevemirolive WITH ENCRYPTED PASSWORD '123456789';
    ```

4. Grant privileges on the database:

    ```sql
    GRANT ALL PRIVILEGES ON DATABASE teamflow TO allaboutevemirolive;
    ```

5. Connect to the `teamflow` database:

    ```sh
    \c teamflow
    ```

6. Grant privileges on the schema:

    ```sql
    GRANT ALL ON SCHEMA public TO allaboutevemirolive;
    ```

7. Run the Flyway migration script:

    ```sh
    mvn flyway:migrate -Dflyway.url=jdbc:postgresql://localhost/teamflow -Dflyway.user=allaboutevemirolive -Dflyway.password=123456789
    ```

</details>

### 3. Optional and `can be skip` ( _Bring your own schema!_ )

<details>
<summary>Click to expand!</summary>


If you prefer not to use the `public` schema, you can create a new schema and grant privileges as shown below. Then, skip step 6 in the database setup and continue with step below.

1. Create a new schema:

    ```sql
    CREATE SCHEMA teamflow_migrations;
    ```

2. Grant privileges on the new schema:

    ```sql
    GRANT ALL ON SCHEMA teamflow_migrations TO allaboutevemirolive;
    ```

3. Uncomment the following lines in `application.properties` to use the new schema:

    ```properties
    # spring.datasource.driver-class-name=org.postgresql.Driver
    # spring.flyway.schemas=teamflow_migrations
    # spring.jpa.properties.hibernate.default_schema=teamflow_migrations
    ```

4. Run the Flyway migration script:

    ```sh
    mvn flyway:migrate -Dflyway.schemas=teamflow_migrations -Dflyway.url=jdbc:postgresql://localhost/teamflow -Dflyway.user=allaboutevemirolive -Dflyway.password=123456789
    ```

5. Run the application as described in the next section.

See [StackOverflow Question](https://stackoverflow.com/q/75463561/16768401) for more information on why we need to create separate schemas.

</details>

### 4. Run the Application

<details>
<summary>Click to expand!</summary>

1. Start the application:

    ```sh
    mvn clean spring-boot:run
    ```

2. Open your browser and go to `http://localhost:8080`.

3. Log in with the following credentials:

    - **Email:** admin@gmail.com
    - **Password:** admin

    or

    - **Email:** johndoe@example.com
    - **Password:** admin

    
</details>


## Code of Conduct

See [NCOC](https://github.com/domgetter/NCoC/blob/master/README.md).

## License

See [Unlicense](https://github.com/IQAndreas/markdown-licenses/blob/master/unlicense.md).

