#
#
package [% NAME %];


#  Pragma
#
use strict qw(vars);
use vars qw($VERSION);
use warnings;


#  Support modules
#
use [% NAME %]::Util qw(msg debug err);
use [% NAME %]::Constant;


#  External modules
#


#  Version information in a format suitable for CPAN etc. Must be
#  all on one line
#
$VERSION='[% VERSION %]';


#  All done, init finished
#
1;


#===================================================================================================


sub new {
    
    
    #  Create self ref
    #
    my ($class, $opt_hr)=shift();
    $opt_hr ||= \1;
    return bless({}, $class);

}


__END__

=head1 NAME

[% NAME %] - Module Synopsis/Abstract Here

=head1 LICENSE and COPYRIGHT