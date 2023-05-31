#!/bin/sh

service mysql start;
sleep 5
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
echo ${SQL_DATABASE}
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"

#terminate the MySQL service by sending a signal to the process ID stored in the /var/run/mysqld/mysqld.pid file. 
kill $(cat /var/run/mysqld/mysqld.pid)

mysqld

# https://dev.mysql.com/doc/refman/8.0/en/mysql-command-options.html#option_mysql_bind-address
# https://stackoverflow.com/questions/21944936/error-1045-28000-access-denied-for-user-rootlocalhost-using-password-y/42967789#42967789