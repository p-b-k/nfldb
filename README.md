# NFL DB and R playing around thing
Just keeping a record of the 2024 NFL season, mostly to have some data to play around with in R.

# Current Status
* The data is up to date through week 8.
* There is not yet any date/time data associated with the games. That is coming.
* I am interested in developing some kind of strength of schedule metric, but like to do it in R

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

## More R Tips and Tricks

* `DataFrame$field` is the same as `DataFrame[, c("field")]`.
  It is different from `DataFrame[c("field")]` in that the later returns a data frame (with column info) while the former return vectors (that is, just the data from the column).
