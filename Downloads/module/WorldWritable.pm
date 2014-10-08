package WorldWritable;

use strict;
use warnings;
use File::Find;
use Exporter;
use autodie; 
use vars qw( $VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS ); 

$VERSION     = 1.00; 
@ISA         = qw( Exporter ); 
@EXPORT      = (); 
@EXPORT_OK   = qw( find_world_writable unset_world_writable ); 
%EXPORT_TAGS = ( 
                 DEFAULT => [ qw( &find_world_writable ) ],
                 Both    => [ qw( &find_world_writable &unset_world_writable ) ]
);

my @world_writable_files;

sub find_world_writable {
    my $dir     = shift;
    my $verbose = shift;
    find( \&wanted, $dir ); 
    for ( @world_writable_files ) {
        if ( $verbose ) {
            print "$_ [world writable file or directory!]\n"; 
        } 
        else {
            print $_, "\n"; 
        }
    }
}

sub wanted {
    return unless (stat)[2] & 2;
    push @world_writable_files, $File::Find::name; 
}

use File::stat;
use Fcntl qw( :mode ); 
sub unset_world_writable {
    my $dir     = shift;
    my $verbose = shift;
    for ( @world_writable_files ) {
        if ( $verbose ) {
            print "$_ [turning off global write permission!]\n"; 
        } 
        else {
            print $_, "\n"; 
        }
        my $st = stat( $_ ); 
        my $mode = $st->mode;
        chmod ( $mode & ~S_IWOTH, $_ ); # turn off write bits 
    }
}
1;
