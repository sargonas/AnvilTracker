# AnvilTracker

A (currently very basic) system for tracking 3D Printing filaments, and your prints.
Designed for tracking used filaments, remaining amounts, total materials costs
and sold profits (optionally) in place of my bulky, complicated, and cumbersome
spreadsheet I've been using. :)

I wish there was some witty story behind the branding of the name, but quite simply
I refer to my 3D Printing business as Voxel Forge, and figured something about Anvils
made sense!

## Current features:
 - Enter and track each physical spool of filament and it's metrics.
 - Enter and track each print you run.
 - Track filament consumed per spool pased on prints.
 - Basic user authentication for general security.
 - Importing of batches of Filaments or Prints via CSV.

## Future plans:
 - Reporting system for reports on time and materials cost/profits
 - Tagging for prints for more detailed reporting.
 - Additional tracking of filament materials for logging of optimal settings
 - A much better UI for great sexiness



###CSV Import instructions
CSV importing is extremely basic currently. To use it, you'll need to make sure
the format is exactly what is expected, for the time being. Column headers need
to match the DB column names, and the print_time column needs to be in seconds.
The columns can be in any order, however, though the date currently has to be in
**DD-MM-YYY** format. For filaments, Archived status is a boolean that should be
set to 1 for true and 0 for false.

####Prints import format:

| printed_date | name | print_time | filament_id | extruder_id | length | weight | volume | price |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| DD/MM/YYY | textual name | seconds | filament.id of filament | extruder name | decimal | decimal | decimal | decimal |
| 17/05/2016 | Test Sphere | 7800 | 15 | mb2 | 42378.1 | 14.99 | 18.623 | 0.00 |

####Filaments import format:

| name | material | color | diameter | weight | length | cost | archived |
| --- | --- | --- | --- | --- | --- | --- | --- |
| name | material type | color | filament's diameter | weight of spool | length of spool | cost of spool | boolean |
| CF white #1 | PLA | white | 2.85 | 750 | 90000 | 35.00 | 0 |

## Development environment setup
### c9.io

1. Create a new workspace, choose hosted, paste repo address.
2. From the IDE, open terminal
3. Modify your PostgreSQL Authentication Method. It needs to be more permissive.
```
sudo vi /etc/postgresql/9.3/main/pg_hba.conf
```
Change
```
local   all             postgres                                peer
```
To
```
local   all             postgres                                trust
```
4. Install gems
```
bundle install
```
5. Start PostgreSQL, run rake tasks
```
sudo service postgresql start
rake db:create && rake db:migrate
```
6. Start server via the "Run" button under the "Run Configuration" console tab. (You can open a new tab for this with the console + tab icon)
7. (optional) for local mail server functions to work you'll need to set your ENV variables. The ENVs are set on C9 under the "Run Configuration" console tab by clicking ENV on the far right. Be sure to restart the server after setting these if it is running!
    - MAIL_HOSTNAME (hostname of the SMTP server)
    - MAIL_DOMAIN (the part after the @, not server domain)
    - MAIL_USERNAME (smtp login email address)
    - MAIL_PASSWORD (smtp login password)
    
Be sure to restart the server after setting these if it is running!