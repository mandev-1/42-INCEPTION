CREATE DATABASE wordpress;
CREATE USER 'rbiodies'@'%' IDENTIFIED BY 'Test1234';
-- Grants all privileges to rbiodies user, giving full control over wordpress database
-- These privileges apply to all tables in the wordpress database, as indicated by .*
GRANT ALL PRIVILEGES ON wordpress.* TO 'rbiodies'@'%';
-- Save privilege changes
FLUSH PRIVILEGES;

-- Modify authentication and resource characteristics for database user
-- Allow proxy server to connect as client without authentication
ALTER USER 'root'@'localhost' IDENTIFIED BY 'Test1234';
