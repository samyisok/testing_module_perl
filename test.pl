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
use warnings "all";
use utf8;
use v5.18;

use File::Basename qw(dirname);
use Cwd qw(abs_path);
use lib '/Users/samyisok/Projects/perl-utils/lib';
use Data::Dumper;

use My::Megautils qw/is_int print_sorted_hash_to_file/;
my $i = 1;

my %planets = (
    Ceres   => 2.77,
    Mercury => 0.4,
    Pluto   => 39,
    Saturn  => 9.5,
    Charon  => 39,
);

my %sirno = (
    "4Pipo" => "Pipo",
    "2Nipa" => "Nipa",
    "3Appa" => "Appa",
    "1Zeta" => "Zeta",
);

open( my $file_h, ">", "file.txt" );

sub super_sort {
    my %option;
    my %my_hash;
    my $fh;
    my $first_element;
    if ( @_ == 2 ) {
        %option        = @_;
        %my_hash       = %{ $option{'hash'} };
        $fh            = $option{'file_holder'} ? $option{'file_holder'} : 0;
        $first_element = ( values %{ $option{'hash'} } )[0];
    }
    elsif ( @_ == 1 or @_ > 2 ) {
        my ($tmp) = @_ == 1 ? @_ : &{
            sub { my (%tmp_hash) = @_; return \%tmp_hash }
        }(@_);
        %my_hash       = %{$tmp};
        $fh            = undef;
        $first_element = ( values %my_hash )[0];
    }
    else {
        warn("Input params is undef");
        return 0;
    }
    my $first_element_is_int = is_int $first_element;
    foreach my $my_key (
        sort {
                $first_element_is_int
              ? $my_hash{$a} <=> $my_hash{$b}
              : $my_hash{$a} cmp $my_hash{$b}
        }
        keys %my_hash
      )
    {
        print { $fh ? $fh : \*STDOUT } "$my_key $my_hash{$my_key} \n";
    }
}

print_sorted_hash_to_file( 'hash' => \%sirno, 'file_holder' => $file_h );
#print_sorted_hash_to_file( %planets );

say "HELLO";


  #print map { scalar reverse $_ } sort reverse qw(6 10 3);
  #
  #
  #
  #

