# EShoppingZone

Responsive Spring Boot and Thymeleaf ecommerce storefront built from the supplied requirements. It supports public search and category browsing, paginated products, registration/login (including a local GitHub demo login), cart management, profile editing, wallet or COD checkout, and previous orders.

## Run in STS

1. In Spring Tool Suite choose **File → Import → Maven → Existing Maven Projects**, then select `E:\EShoppingZone`.
2. Run `StorefrontApplication` from `storefront/src/main/java/com/eshoppingzone/storefront/StorefrontApplication.java` as a Spring Boot App.
3. Open `http://localhost:8080`.

The H2 database is persisted under `storefront/data` while the app is running. The H2 console is at `http://localhost:8080/h2-console` (JDBC URL `jdbc:h2:file:./data/eshoppingzone`).

## Optional Spring Cloud Config and order email

Run `ConfigServerApplication` on port `8888` before starting the storefront to serve external configuration. The config repository is prepared in `config-repository/`; push it to a private GitHub repository and set `CONFIG_SERVER_PROFILE=git` and `CONFIG_REPOSITORY_URI` on the config server. Configure `MAIL_ENABLED=true` and SMTP environment variables to send professional order-confirmation emails after successful checkout. Mail credentials are never committed to this project.
