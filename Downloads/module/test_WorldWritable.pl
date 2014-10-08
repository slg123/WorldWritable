#!/usr/bin/perl 
use strict;
use warnings;
use Test::More;

BEGIN { use_ok( "WorldWritable" ) }
can_ok( "WorldWritable", "find_world_writable" );
can_ok( "WorldWritable", "unset_world_writable" );

mkdir "/tmp/test";     chmod 0777, "/tmp/test";

my $dir = "/tmp/test"; 
my $verbose = 0; 

my $find_world_writable  = WorldWritable::find_world_writable( $dir, $verbose );
my $unset_world_writable = WorldWritable::unset_world_writable( $dir, $verbose );

done_testing;

