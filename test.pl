#!/usr/bin/env perl 
#===============================================================================
#
#         FILE: test.pl
#
#        USAGE: ./test.pl
#       AUTHOR: Sergey Magochkin (), magaster@gmail.com
#      VERSION: 1.0
#      CREATED: 10/24/2015 19:47:48
#===============================================================================

use strict;
use warnings;
use utf8;
use v5.18;

use File::Basename qw(dirname);
use Cwd qw(abs_path);
use lib '/Users/samyisok/Projects/perl-utils/lib';

use My::Megautils qw/is_int/;
my $i = 1;

my %planets = (
    Mercury => 0.4,
    Venus   => 0.7,
    Earth   => 1,
    Mars    => 1.5,
    Ceres   => 2.77,
    Jupiter => 5.2,
    Saturn  => 9.5,
    Uranus  => 19.6,
    Neptune => 30,
    Pluto   => 39,
    Charon  => 39,
);

my %sirno = (
    "4Pipo" => "Pipo",
    "2Nipa" => "Nipa",
    "3Appa" => "Appa",
    "1Zeta" => "Zeta",
);

OPEN(my $fh, ">", "file.txt");


sub super_sort {
    my %option        = @_;
    my $first_element = ( values %{ $option{'hash'} } )[0];
    my %my_hash       = %{ $option{'hash'} };
    my $file_holder   = $option{'file_holder'} ? $option{'file_holder'} : 0;
    if ( is_int $first_element and $file_holder ) {
        say "True and Exist";
        foreach my $my_key (
            sort { $my_hash{$a} <=> $my_hash{$b} }
            keys %my_hash
          )
        {
            print $fh, "$my_key $my_hash{$my_key} \n";
        }
    }
    elsif ( ( is_int $first_element) == 0 ? 1 : 0 and $file_holder ) {
        say "FALSE and Exist";
        foreach my $my_key (
            sort { $my_hash{$a} cmp $my_hash{$b}  }
            keys %my_hash
          )
        {
            print $fh "$my_key $my_hash{$my_key} \n";
        }
    }
    elsif ( is_int $first_element and ($file_holder) ? 0 : 1 ) {
        say "TRUE and not exist";
        foreach my $my_key (
            sort { $my_hash{$a} <=> $my_hash{$b}  }
            keys %my_hash
          )
        {
            print "$my_key $my_hash{$my_key} \n";
        }
    }
    else {
        say "FALSE and not Exist";
        foreach my $my_key (
            sort { $my_hash{$a} cmp $my_hash{$b}  }
            keys %my_hash
          )
        {
            print "$my_key $my_hash{$my_key} \n";
        }
    }
    close $fh;
}

super_sort( 'hash' => \%sirno, 'file_holder' => $fh );

#print map { scalar reverse $_ } sort reverse qw(6 10 3);
#
#
#
#

