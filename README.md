# NFL DB and R playing around thing

## Connection Info
* Database: NFL
* User: access (no password, read only)
* Admin: pbk/secret

## Using R wtih MySQL

* Install MySQL Drivers
  `install.packages("RMySQL")`
* Load MySQL Module
  `library(RMySQL)`
* Create Connection
  `dbConnect(dbDriver("MySQL", dbname="{DATABASE NAME}", user="{USER NAME}")`
* Issue Query
  `dbGetQuery({CONECTION}, paste("{SQL QUERY}"))`
