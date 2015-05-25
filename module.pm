#  
#
package [% NAME %];


#  Pragma
#
use strict qw(vars);
use vars qw($VERSION);
use warnings;
no warnings qw(uninitialized);
sub BEGIN {local $^W=0}


#  External modules
#
use [% NAME %]::Constant;


#  Version information in a format suitable for CPAN etc. Must be
#  all on one line
#
$VERSION='[% VERSION %]';


#  All done, init finished
#
1;


#===================================================================================================


__END__

=head1 NAME

[% NAME %] - Module Synopsis/Abstract Here

