#
#  This file is part of [% NAME %]
#
[% LICENSE_NOTICE_COMMENT %]
#
#  Full license text is available at:
#
#  <[% LICENSE_URL %]>
#

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
    my ($class, $opt_hr)=@_;
    $opt_hr ||= \1;
    return bless($opt_hr, $class);

}


__END__


=begin markdown

# NAME

[% NAME %] - script short description

# SYNOPSIS

module synopsis
```
```

# DESCRIPTION

[% NAME %] script long description

# USAGE

module usage here
```
```
  
# AUTHOR

[% AUTHOR %] [% EMAIL %]

# LICENSE and COPYRIGHT

This file is part of [% NAME %]

[% LICENSE_NOTICE %]

Full license text is available at:

[% LICENSE_URL %]

=end markdown

=head1 NAME

[% NAME %] - script short description


=head1 SYNOPSIS

module synopsis
 



=head1 DESCRIPTION

[% NAME %] script long description


=head1 USAGE

module usage here
 



=head1 AUTHOR

[% AUTHOR %] [% EMAIL %]


=head1 LICENSE and COPYRIGHT

This file is part of [% NAME %]

[% LICENSE_NOTICE %]

Full license text is available at:

[% LICENSE_URL %]

=cut
