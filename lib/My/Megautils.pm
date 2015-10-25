package My::Megautils;

use strict;
use warnings;

use Exporter qw/import/;


our @EXPORT_OK =qw/is_int/;


sub is_int{
    my ($my_int) = @_;
    return $my_int =~ /^[0-9,.E]+$/ ? 1 : 0;
    }



1;
