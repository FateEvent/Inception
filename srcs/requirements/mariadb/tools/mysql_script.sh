#!/bin/bash

if ! [ -d "/var/lib/mysql/${SQL_DBNAME}" ]; then
    mysql_install_db;
    service mysql start;

    mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DBNAME}\`;"
    mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
    mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DBNAME}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
    sleep 5
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
    sleep 5
    mysqladmin -u root -p"${SQL_ROOT_PASSWORD}" flush-privileges;
    mysqladmin -u root -p"${SQL_ROOT_PASSWORD}" shutdown;
fi
exec mysqld_safe --user ${SQL_USER};

# https://dev.mysql.com/doc/refman/8.0/en/mysql-command-options.html#option_mysql_bind-address
# https://stackoverflow.com/questions/21944936/error-1045-28000-access-denied-for-user-rootlocalhost-using-password-y/42967789#42967789