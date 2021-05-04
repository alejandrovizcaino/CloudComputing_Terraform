
resource "google_sql_database_instance" "master1" {
  name = "instancia-sql"
  database_version = "MYSQL_5_7"
  region = "europe-west1"
  settings {
    tier = "db-n1-standard-2"
  }
 
}

resource "google_sql_database" "database1" {
  name = "bd-sql"
  instance = "${google_sql_database_instance.master1.name}"
  charset = "utf8"
  collation = "utf8_general_ci"
}

resource "google_sql_user" "users" {
  name = "alex"
  instance = "${google_sql_database_instance.master1.name}"
  host = "%"
  password = "1234"
}