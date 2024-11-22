# The Henslowe-Alleyn Digitisation Project

This is the repository for the Henslowe-Alleyn Digitisation Project at
[Kings Digital Lab](https://kdl.kcl.ac.uk).

The project has been containerised using
[Docker Compose](https://docs.docker.com/compose/).
The containerised setup includes the following services:

1. [`kdl-apache-proxy`](https://gitlab.kdl.kcl.ac.uk:5050/docker-images/core/kdl-apache-proxy):
   This service provides a reverse proxy for the edition, routing requests to
   the appropriate backend service.
1. [`django`](https://hub.docker.com/_/python): This services runs the Django
   application, providing the core functionality/frontend of the edition.
1. [`postgres`](https://hub.docker.com/_/postgres): This service provides a
   Postgres database for the Django application.
1. [`cantaloupe`](https://hub.docker.com/r/islandora/cantaloupe): This service
   provides a JPG2000 image server for the project, providing high-quality
   images for the edition.

## Getting Started

Follow these steps to set up and run the project using Docker Compose.

**Note** that these instructions cover only the local setup; server deployment
is not covered here.

### Pre-requisites

Before you begin, ensure you have the following installed on your system:

- [Docker](https://www.docker.com/products/docker-desktop/)
- [Docker Compose](https://docs.docker.com/compose/)

### Running the application

1. **Clone this repository**
1. **Set up the environment file**

Create a `.env` file inside the compose directory with the following content:

```sh
# Set to false in production
DEBUG=true
# Set to true in production
PRODUCTION=false

DJANGO_ALLOWED_HOSTS=henslowe-alleyn.org.uk,henslowe-os.kdl.kcl.ac.uk,django,localhost,127.0.0.1
DJANGO_ADMINS=("Name", "email@example.com")
DJANGO_SECRET_KEY=generated_secret_key
DJANGO_DEFAULT_FROM_EMAIL=email@example.com
DJANGO_EMAIL_HOST=smtp.example.com
DJANGO_EMAIL_PORT=25

POSTGRES_HOST=db
POSTGRES_PORT=5432
POSTGRES_DB=db_name
POSTGRES_USER=db_user
POSTGRES_PASSWORD=db_password
```

Ensure to replace the placeholder values with your own values.

1. **Start the services**

   Use the provided helper script `docker.sh` to build and start the services:

   ```bash
   cd compose
   docker compose up --build
   ```

1. **Access the application**

   Once all services are running, you can access the web application via your
   web browser at [http://localhost/](http://localhost/).

To stop the application press CTRL+C in the same terminal window where the
`docker compose` command is running.

1. **Restore the database**

   To restore the database from a backup file, place the backup file in the
   `volumes/db_backups` directory and run the following command:

   ```bash
   docker compose exec db restore db_backup_name.sql.gz
   ```

   **Note** Django may need to be stopped before restoring the database. In any
   case, it is recommended to restart the services after restoring the database.
