-- Grant the required acces on a database (nfl) to the custodial user;

grant select, show view, trigger, execute on nfl.* to 'custodial'@'localhost';
