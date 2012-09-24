#!/usr/bin/env perl

use strict;
use warnings;
use Proj::DB;

# 実験用なのでファイルは作らずに、メモリ上で試す。
my $db = Proj::DB->new( {dsn => 'dbi:SQLite:' } );

## テーブルの作成
$db->do(q{
        create table user (
            id     INTEGER PRIMARY KEY AUTOINCREMENT,
            name   TEXT   NOT NULL,
            birth_on DATE
        )
});

# insert into user (name), values ('nekokak');
my $row = $db->create('user', { name => 'nekokak' } );
print $row->id , "\n" ;
print $row->name , "\n" ;

# update user set name = 'yappo' where id = 1
$db->update('user', { name => 'yappo'}, { id => $row->id } );

# select * from user where name = 'nekokak'
$row = $db->search('user', {name => 'yappo'} )->first ;
print $row->id, "\n";
print $row->name, "\n";

# select * from user where id = 1 limit 1
$row = $db->single('user', {id => 1});
print $row->id, "\n";
print $row->name, "\n";

# delete from user where id = 1
$db->delete('user', {id => 1});
