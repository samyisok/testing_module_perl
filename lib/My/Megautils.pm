package My::Megautils;

use strict;
use warnings;

use Exporter qw/import/;


our @EXPORT_OK =qw/is_int print_sorted_hash_to_file/;

sub is_int{
    my ($my_int) = @_;
    return $my_int =~ m/^[-+]?\d+(?:\.\d*)?(?:[eE][-+]?\d+(?:\.\d*)?)?$/ ? 1 : 0;
    }




sub print_sorted_hash_to_file{
    my %option;
    my %my_hash;
    my $fh;
    my $first_element;
    if ( @_ == 4 ) {
        %option        = @_;
        %my_hash       = %{ $option{'hash'} };
        $fh            = $option{'file_holder'} ? $option{'file_holder'} : 0;
        $first_element = ( values %{ $option{'hash'} } )[0];
    }
    elsif ( @_ == 1 or @_ > 4 ) {
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





1;



=pod

=head1 is_int()

Usage:

    is_int("1") # return 1 
    is_int("Hello") #return 0
    is_int("3.4E+38") # return 1
    is_int("-4") # return 1
    is_int("0.1"); # return 1


=head1 print_sorted_hash_to_file()

sort hash by valuse, and printed or save to file.


=head2 input:

    my %planets = (
        Ceres   => 2.77,
        Mercury => 0.4,
        Pluto   => 39,
        Saturn  => 9.5,
        Charon  => 39,
    );

    print_sorted_hash_to_file( %planets );

=head2 output:

    Mercury 0.4
    Ceres 2.77
    Saturn 9.5
    Charon 39
    Pluto 39  


=head2 variant 2, input:

    my %sirno = (
        "4Pipo" => "Pipo",
        "2Nipa" => "Nipa",
        "3Appa" => "Appa",
        "1Zeta" => "Zeta",
    );

    open( my $file_h, ">", "file.txt" );
    print_sorted_hash_to_file( %planets );
    close($file_h);

=head2 output:

    #cat file.txt
    3Appa Appa
    2Nipa Nipa
    4Pipo Pipo
    1Zeta Zeta


=cut



