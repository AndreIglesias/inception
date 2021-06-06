CREATE DATABASE wordpress;
CREATE USER 'ciglesia'@'%' IDENTIFIED BY 'ciglesia';
GRANT ALL PRIVILEGES ON *.* TO 'ciglesia'@'%';
FLUSH PRIVILEGES;
update mysql.user set plugin = 'mysql_native_password' where user='root';
