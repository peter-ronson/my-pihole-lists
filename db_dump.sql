/* WARNING: Script requires that SQLITE_DBCONFIG_DEFENSIVE be disabled */
PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
DROP TABLE IF EXISTS 'domainlist_by_group';
DROP TABLE IF EXISTS 'group';
DROP TABLE IF EXISTS 'domainlist';
DROP TABLE IF EXISTS 'adlist';
CREATE TABLE IF NOT EXISTS "group"
(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    enabled BOOLEAN NOT NULL DEFAULT 1,
    name TEXT UNIQUE NOT NULL,
    date_added INTEGER NOT NULL DEFAULT (cast(strftime('%s', 'now') as int)),
    date_modified INTEGER NOT NULL DEFAULT (cast(strftime('%s', 'now') as int)),
    description TEXT
);
INSERT INTO "group" VALUES(0,1,'Default',1727041671,1727041671,'The default group');
CREATE TABLE domainlist
(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    type INTEGER NOT NULL DEFAULT 0,
    domain TEXT NOT NULL,
    enabled BOOLEAN NOT NULL DEFAULT 1,
    date_added INTEGER NOT NULL DEFAULT (cast(strftime('%s', 'now') as int)),
    date_modified INTEGER NOT NULL DEFAULT (cast(strftime('%s', 'now') as int)),
    comment TEXT,
    UNIQUE(domain, type)
);
INSERT INTO domainlist VALUES(2,0,'try.abtasty.com',1,1727085671,1727085671,'Added from Query Log');
INSERT INTO domainlist VALUES(3,0,'cdn.speedcurve.com',1,1727085675,1727085675,'Added from Query Log');
INSERT INTO domainlist VALUES(5,0,'static.adsafeprotected.com',1,1727085685,1727085685,'Added from Query Log');
INSERT INTO domainlist VALUES(6,0,'cdn.tagcommander.com',1,1727085703,1727085703,'Added from Query Log');
INSERT INTO domainlist VALUES(7,0,'ariane.abtasty.com',1,1727085732,1727085732,'Added from Query Log');
INSERT INTO domainlist VALUES(8,0,'cm.g.doubleclick.net',1,1727085756,1727085756,'Added from Query Log');
INSERT INTO domainlist VALUES(9,0,'dcinfos-cache.abtasty.com',1,1727085773,1727085773,'Added from Query Log');
INSERT INTO domainlist VALUES(10,0,'w.usabilla.com',1,1727085782,1727085782,'Added from Query Log');
INSERT INTO domainlist VALUES(11,0,'ib.adnxs.com',1,1727085847,1727085847,'Added from Query Log');
INSERT INTO domainlist VALUES(13,0,'prof.estat.com',1,1727085932,1727085932,'Added from Query Log');
INSERT INTO domainlist VALUES(14,0,'www.googletagmanager.com',1,1727085997,1727085997,'Added from Query Log');
INSERT INTO domainlist VALUES(15,0,'api.eu.amplitude.com',1,1727086012,1727086012,'Added from Query Log');
CREATE TABLE adlist
(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    address TEXT NOT NULL,
    enabled BOOLEAN NOT NULL DEFAULT 1,
    date_added INTEGER NOT NULL DEFAULT (cast(strftime('%s', 'now') as int)),
    date_modified INTEGER NOT NULL DEFAULT (cast(strftime('%s', 'now') as int)),
    comment TEXT,
    date_updated INTEGER,
    number INTEGER NOT NULL DEFAULT 0,
    invalid_domains INTEGER NOT NULL DEFAULT 0,
    status INTEGER NOT NULL DEFAULT 0,
    abp_entries INTEGER NOT NULL DEFAULT 0,
    type INTEGER NOT NULL DEFAULT 0,
    UNIQUE(address, type)
);
INSERT INTO adlist VALUES(1,'https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts',1,1727041671,1727041671,'Migrated from /etc/pihole/adlists.list',1742999102,135310,0,2,0,0);
CREATE TABLE domainlist_by_group
(
    domainlist_id INTEGER NOT NULL REFERENCES domainlist (id),
    group_id INTEGER NOT NULL REFERENCES "group" (id),
    PRIMARY KEY (domainlist_id, group_id)
);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(1,2,0);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(2,3,0);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(3,5,0);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(4,6,0);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(5,7,0);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(6,8,0);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(7,9,0);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(8,10,0);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(9,11,0);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(10,13,0);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(11,14,0);
INSERT INTO domainlist_by_group(rowid,domainlist_id,group_id) VALUES(12,15,0);
COMMIT;
