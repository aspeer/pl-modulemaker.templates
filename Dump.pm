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
use [% BASE_NAME %]::Util qw(err debug script Dumper);
use [% BASE_NAME %]::Constant;


#  External modules
#
use Cwd;
use File::Spec;
use IO::File;
use Fcntl qw(:flock);
use FindBin qw($RealBin $Script);


#  Export functions
#
use base 'Exporter';
@EXPORT_OK=qw(dump_load dump_save);


#  Version Info, must be all one line for MakeMaker, CPAN.
#
$VERSION='[% VERSION %]';


#  All done, init finished
#
1;
#===================================================================================================


sub dump_load {


    #  Load Dumper file from disk
    #
    #my ($self, $fn)=@_;
    my $fn=shift();
    $fn=&dump_fn($fn);
    debug("loading data from: $fn");
    my $data_hr=eval {do($fn)} || do {
        return err ("unable to load dump file $fn, $@") if $@
    };
    $data_hr ||= {};
    return $data_hr;

}


sub dump_save {


    #  Save Dumper file to disk
    #
    #my ($self, $hr, $fn)=@_;
    my ($hr, $fn)=@_;


    #  Construct file name
    #
    $fn=&dump_fn($fn);
    debug("saving data to: $fn");
    

    #  Open file, lock
    #
    my $fh=IO::File->new($fn, O_RDWR | O_CREAT) ||
        return err ("unable to open map file $fn, $!");
    flock($fh, LOCK_EX) ||
        return err ('unable to lock map file');


    #  Update
    #
    truncate($fh, 0);
    print $fh Dumper($hr);
    return $fh->close();


}


sub dump_fn {


    #  Supply and/or construct suitable dump file name
    #
    my $fn=shift();
    $fn ||= '.'.&script();
    $fn=File::Spec->catfile(cwd(), $fn)
        unless ($fn=~/^\//);
    return $fn;
    
}
