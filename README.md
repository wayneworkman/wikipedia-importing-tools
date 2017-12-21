Hello, you're reading this because you're probably interested in standing up a copy of Wikipedia. I went about doing this myself and found only a couple good resources online (which were invaluable to me) but the instructions were sort of old and lacking in areas. These instructions below tell you how to stand up Wikipedia on MariaDB in hopefully Debian 9 or newer. There is debian 8 instructions scattered about through this, but I wanted to leave that stuff in there rather than delete it forever. So if you're on Debian 9 or newer, skip the Debian 8 stuff.

Hard disk space: You really need about 250GB of free (and really super fast) disk space for this project (2017). After all data transformations and importing is completed, you can delete a lot of the work files and be down to about 100GB in use (2017). 

The instructions are sometimes loose in spots, generically saying "edit this file". Deal with it.

This isn't a linux tutorial, it's a guide for those familiar with Linux who want to stand up a copy of Wikipedia, and is tailored as such to that audience.




INSTRUCTIONS:



========================== Needed Packages ==========================

Debian 8:
```
apt-get install -y pbzip2 curl mysql-client mysql-common mysql-server apache2 libapache2-mod-php5 php5 php5-common php5-cli php5-mysql php5-mcrypt php5-curl php5-gd php5-intl php-pear apt-get default-jre
```

Debian 9:
```
apt-get install -y pbzip2 curl mariadb-client mariadb-common mariadb-server apache2 libapache2-mod-php php php-common php-cli php-mysql php-mcrypt php-curl php-gd php-intl php-pear php-mbstring default-jre zstd
```

========================== Fix Vim Mouse ============================

For Debian 9, un-do Vim's default mouse config:
```
sed -i.bak 's/set mouse=a/\"set mouse=a/' /usr/share/vim/vim80/defaults.vim
```

==================== Get latest copy of mediawiki ===================

mediawiki 1.28:
```
curl -O https://releases.wikimedia.org/mediawiki/1.28/mediawiki-1.28.0.tar.gz
tar -xvzf mediawiki-1.28.0.tar.gz
```

mediawiki 1.3:
```
curl -O https://releases.wikimedia.org/mediawiki/1.30/mediawiki-1.30.0.tar.gz
tar -xvzf mediawiki-1.30.0.tar.gz
```

Delete the default index.html file:
```
rm -f /var/www/html/index.html
```

Copy contents of extracted directory to /var/www/html

change ownership of /var/www/html/* recursively to www-data:www-data or httpd if centos/fedora/rhel
```
chown -R www-data:www-data /var/www/html/*
```

============= Location of php.ini if You want to mess with it ========

Debina 8:
```
vim /etc/php5/apache2/php.ini
```

Debian 9 (was not needed):
```
vim /etc/php/7.0/apache2/php.ini
```


================ Secure wikimedai some ==================

Set apache to securely handle the images dir. Edit this file:
```
vim /etc/apache2/apache2.conf
```

Put this in there at the bottom:
```
<Directory "/var/www/html/images">
   # Ignore .htaccess files
   AllowOverride None

   # Serve HTML as plaintext, don't execute SHTML
   AddType text/plain .html .htm .shtml .phtml .php .php3 .php4 .php5 .php7

   # Don't run arbitrary PHP code.
   php_admin_flag engine off

   # If you've other scripting languages, disable them too.
</Directory>
```


===================== Setup Services =========================

Enable the needed services on boot:
```
systemctl enable apache2
systemctl enable mysql
systemctl restart apache2
systemctl restart mysql
```


======================= Setup database =======================

Create a necessary database for wikipedia and a user with permission to use it. Execute these one by one, do not copy/paste:
```
mysql
create database wikipedia;
CREATE USER 'wiki'@'localhost' IDENTIFIED BY 'testing';
GRANT ALL ON wikipedia.* TO 'wiki'@'localhost' WITH GRANT OPTION;
quit
```



========================== Setup wikimedia =====================

Visit the home page via your server IP address in a web browser. Go through the installer.

Enable every single EXTENSION available - this makes all of wikipedia's formating look like information instead of jibberish. IF YOU SKIP THIS, you basically have to start over if you want to enable these later because I've not figured out how to enable them after the fact yet. Learn from my mistakes, enable every extension right here!

When asked, download LocalSettings.php from web-interface, then move it to the server at /var/www/html
Reset permissions again to www-data:www-data
```
chown -R www-data:www-data /var/www/html/*
```


============================ Downloading a wikipedia dump ============

#Download the latest file:
https://dumps.wikimedia.org/enwiki/

These links are for the successful dump from June 1st, 2017. They may not be available when you try this, you will need new links. These files are about 13GB compressed, you will have to extract them and do further manipulations. Recommended to have 250GB of free space available on the partition you will do the work on.
```
nohup wget https://dumps.wikimedia.org/enwiki/20170601/enwiki-20170601-pages-articles-multistream-index.txt.bz2 &
nohup wget https://dumps.wikimedia.org/enwiki/20170601/enwiki-20170601-pages-articles-multistream.xml.bz2 &
```


============================ Debian 8 special package needs ==========================

Install java Debian 8:
Add to /etc/apt/sources.list
```
deb http://http.debian.net/debian jessie-backports main
```

Install zstd:
Add to /etc/apt/sources.list
```
deb http://ftp.de.debian.org/debian sid main
```
apt-get -y install zstd
#Then disable the sid repository.



============================= Use pbzip to decompress ============================ 

pbzip2  - is an awesome and parallel implimentation of bzip2. I really think pbzip2 should just replace bzip2.

example:
```
pbzip2 -v -d -k -m10000 file.bz2
```
Options:
* -v      verbose
* -d      decompress
* -k      keep the original file 
* -m10000 use 10Gb of RAM

What I used:
```
pbzip2 -v -d -k -m2000 enwiki-20170601-pages-articles-multistream.xml.bz2
```

===================== do not use importDump.php - terrible idea =====================

Do not do this, horrible idea. it will NEVER get done!
Import wikipedia dump:
```
nohup php /var/www/html/maintenance/importDump.php /var/enwiki-20170320-pages-articles-multistream.xml &
```


============================== Convert XML to SQL =============================

This step was by far the most difficult. I tried using the terrible and slow importDump.php and let this run for WEEKS, without even a dent in the workload. Wikimedia has a tool called mwdumper that they do not appear to maintain anymore. However, mwdumper is BYFAR the best tool to convert this XML file into SQL because it does the job blazingly fast. The official repository (that you shouldn't use) on githup is:

https://github.com/wikimedia/mediawiki-tools-mwdumper

That's the broken copy. I found all community contributed patches for this tool in web posts, forked the project, and applied the patches. I've The patched sourcecode is available from here:

https://github.com/wayneworkman/mediawiki-tools-mwdumper

I've included a binary of the compiled tool for convienence, but you may need to compile to fix further problems with future changes. Please if you fix anything in my fork, submit the pull request to me because WikiMedia foundation has abandoned their github codebase.


Convert that massive xml file to SQL (recommended):
```
nohup java -server -jar mwdumper-1.26.jar --format=sql:1.5 /root/enwiki-20170601-pages-articles-multistream.xml | zstd -zc > /root/enwiki-20170601-pages-articles-multistream.sql.zst &
```


How to do it without compressing the output (extremely not recommended):
```
nohup java -server -jar mwdumper-1.26.jar --format=sql:1.5 /root/enwiki-20171201-pages-articles-multistream.xml > /root/enwiki-20171201-pages-articles-multistream.sql &
```

====================== Split the SQL file into smaller files ============================

```
Split that huge file into 200-500MB chunks:
nohup split --additional-suffix=".sql" --lines=1000 enwiki-20170601-pages-articles-multistream.sql &
```

============================ Fix database problem ==========================

This was needed for wikimedia 1.28 and 2016's dumps. I don't know if it's needed or not for 1.3 and 2017's dumps. I did it anyway and it worked out fine.
add page_counter:
```
mysql
use wikipedia
ALTER TABLE page ADD page_counter bigint unsigned NOT NULL default 0;
quit
```
=========================== Configure MariaDB/MySQL for big inserts ==============

Edit:   /etc/mysql/my.cnf
max_allowed_packet = 256M

Reload mysql/mariadb:
```
systemctl restart mariadb
```
or
```
systemctl restart mysqld
```


================================== Import the data =============================

To import the data, use the utility script called importSplits.sh This script will access your splits directory and start importing. You can create a stop file (as defined in the script) if for some reason you wanted to stop at a safe spot to reboot or whatever.

Run the script like this:

```
./importSplits.sh
```




