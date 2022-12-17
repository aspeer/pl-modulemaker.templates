#
#  This file is part of [% build_name %]
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


#  Compiler pragma
#
use strict;
use vars qw($VERSION @EXPORT_OK);
use warnings;


#  Support modules
#
use [% BASE_NAME %]::Util qw(msg err debug Dumper);
use [% BASE_NAME %]::Constant;


#  External modules
#
use Pod::Usage;
use FindBin qw($RealBin $Script);
use Getopt::Long qw(GetOptions :config auto_version auto_help);


#  Constantas
#
use constant {


    #  Command line options in Getopt::Long format
    #
    OPTION_AR => [

        qw(man verbose quiet dump_opt),
    ],


    #  Environment prefix which will override option, e.g. MODULE::NAME_NOBACKUP=1
    #
    OPTION_ENV_PREFIX => '[% BASE_NAME %]',

};



#  Export functions
#
use base 'Exporter';
@EXPORT_OK=qw(getopt);


#  Version Info, must be all one line for MakeMaker, CPAN.
#
$VERSION='[% VERSION %]';


#===================================================================================================


sub getopt {


    #  ARGV usually supplied as array ref but could be anyting
    #
    my ($opt_ar, $opt_default_hr)=@_;
    
    
    #  Update defaults from local home directory
    #
    my %opt_defaults=(%{$opt_default_hr}, %{do(glob("~/.${Script}.option")) || {}} );


    #  Base options will pass to compile. Get option defauts from ENV or Constant/options file
    #
    my %opt=(

        map {
            $_ => do {my $key=sprintf("%s_%s", +OPTION_ENV_PREFIX, uc($_)); defined $ENV{$key} ? $ENV{$key} : $opt_defaults{$_}}
        } keys %opt_defaults

    );


    #  Routine to capture files/names/other actions to process into array
    #
    my $arg_cr=sub {
        #  Eval to handle different Getopt:: module versions.
        push @{$opt{'action_ar'}}, eval { $_[0]->name } || $_[0];
    };


    #  Add standard options to option array ref
    #
    my @opt=(@{+OPTION_AR}, @{$opt_ar}, '<>' => $arg_cr);
    #  Removed \\ '' => \${opt {'stdin'} \\ input.



    #die Dumper(\@opt);

    debug('opt stage 1: %s', Dumper(\%opt));


    #  Now import command line options.
    #
    GetOptions(\%opt, @opt) ||
        pod2usage(2);
    if ($opt{'help'}) { # || !$opt{'action_ar'}) {
        pod2usage( -verbose => 99, -sections => 'SYNOPSIS|OPTIONS|USAGE', -exitval => 1 )
    }
    elsif ($opt{'man'}) {
        pod2usage( -exitstatus=>0, -verbose => 2 ) if $opt{'man'};
    }
    elsif ($opt{'version'}) {
        print "$Script version: $VERSION\n";
    };


    #  Done
    #
    return \%opt;

}

1;

