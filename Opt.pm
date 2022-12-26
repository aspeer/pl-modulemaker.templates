#
#  This file is part of [% build_name %].
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

        qw(man verbose quiet debug dump_opt),
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


#  All done, init finished
#
1;
#===================================================================================================


#  Note early debugging here only available by setting environment variable <script>_DEBUG=1 as
#  debug option not read until all options processed
#

#===================================================================================================

sub getopt {


    #  ARGV usually supplied as array ref but could be anyting
    #
    my ($opt_ar, $opt_default_hr)=@_;
    
    
    #  Update defaults from local home directory if file present
    #
    my %opt_defaults=%{$opt_default_hr};
    if (-f (my $opt_defaults_fn=glob("~/.${Script}.option"))) {
        debug("opt defaults file found: $opt_defaults_fn");
        my $hr=eval { do($opt_defaults_fn) } ||
            return err("error reading options file $opt_defaults_fn, check syntax");
        debug('opt defaults file: %s', Dumper($hr));
        %opt_defaults=(%opt_defaults, %{$hr});
    }
    else {
        debug("opt defaults file not found: $opt_defaults_fn");
    }
    debug('opt defaults final: %s', Dumper(\%opt_defaults));


    #  Base options will pass to compile. Get option defauts from ENV or Constant/options file
    #
    my %opt=(

        map {
            $_ => do {my $key=sprintf("%s_%s", +OPTION_ENV_PREFIX, uc($_)); defined $ENV{$key} ? $ENV{$key} : $opt_defaults{$_}}
        } keys %opt_defaults

    );
    debug('stage 1 opt: %s', Dumper(\%opt));


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
    debug('option array: %s', Dumper(\@opt));


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
    
    
    #  Dump options if required, set debugging
    #
    {
        no strict qw(refs);
        (my $script=$Script)=~s/\.pl$//;
        ${"${script}::DEBUG"}++ if $opt{'debug'};
    }
    debug('stage 2 opt: %s', Dumper(\%opt));
    die Dumper(\%opt) if $opt{'dump_opt'};


    #  Done
    #
    return \%opt;

}

__END__
