# NFL DB and R playing around thing
Just keeping a record of the 2024 NFL season, mostly to have some data to play around with in R.

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
