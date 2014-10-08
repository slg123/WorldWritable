#!/usr/bin/perl
use strict;
use warnings;

use File::Basename qw( dirname ); 
use Cwd qw( abs_path ); 

use lib dirname( dirname abs_path $0 ) . '.'; 

use WorldWritable qw( find_world_writable unset_world_writable ); 

my $args = @ARGV;

if ( !$args) {
    print "usage: ./world_writable.pl [directory] [--verbose]\n"; 
    exit;
}

my ( $directory, $verbose ) = @ARGV;

if ( $directory and !$verbose ) {
    find_world_writable( $directory ); 
    unset_world_writable( $directory ); 
} 

if ( $directory and $verbose ) {
    if ( $verbose =~ /--verbose/ ) {
        $verbose = 1; 
    } 
    else {
        print "Unknown argument. Exiting.\n"; 
        exit;
    }
    find_world_writable( $directory, $verbose ); 
    unset_world_writable( $directory, $verbose ); 
}
