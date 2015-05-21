package [%  NAME %];
use strict;
use warnings;
use Carp;

BEGIN {
    use Exporter ();
    use vars qw ($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);
    $VERSION     = "0.92";
    @ISA         = qw (Exporter);
    @EXPORT      = qw ();
    @EXPORT_OK   = qw ();
    %EXPORT_TAGS = ();
}

[%- IF NEED_POD %]
#--------------------------------------------------------------------------#
# main pod documentation 
#--------------------------------------------------------------------------#

# Below is the stub of documentation for your module. You better edit it!

=head1 NAME

[%  NAME %] - Put abstract here 

=head1 SYNOPSIS

 use [%  NAME %];
 blah blah blah

=head1 DESCRIPTION

Description...

=head1 USAGE

Usage...

=cut

[% END %]
[%- IF NEED_NEW_METHOD -%]
[% new_method -%]
sub new {
    my ($class, $parameters) = @_;
    
    croak "new() can't be invoked on an object"
        if ref($class);
        
    my $self = bless ({ }, $class);
    return $self;
}
[% END %]
1; #this line is important and will help the module return a true value
__END__
[% IF NEED_POD %]
[%- IF CHANGES_IN_POD -%]
=head1 HISTORY
[% END %]
=head1 BUGS

Please report bugs using the CPAN Request Tracker at L<http://rt.cpan.org/>

=head1 AUTHOR

[% AUTHOR %] [% IF CPANID %]([% CPANID %])[% END %]
[%- IF ORGANIZATION %]

[% ORGANIZATION %]
[%- END %]

[% EMAIL %]

[% WEBSITE %]

=head1 COPYRIGHT

Copyright (c) [% COPYRIGHT_YEAR %] by [% AUTHOR %]

[%  LicenseParts.COPYRIGHT %]

=cut
[%- END -%]
