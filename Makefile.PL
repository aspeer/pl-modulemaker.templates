[% PROCESS Makefile.local -%]
use 5.006;
use strict;
use ExtUtils::MakeMaker;
my $mm_ver = $ExtUtils::MakeMaker::VERSION;
if ($mm_ver =~ /_/) { # dev version
    $mm_ver = eval $mm_ver;
    die $@ if $@;
}
my %WriteMakefile=(
    NAME                => '[% NAME %]',
    VERSION_FROM        => '[% FILE %]',
    ABSTRACT_FROM       => '[% FILE %]',,
    EXE_FILES           => [],
    LICENSE             => '[% LICENSE %]',
    AUTHOR              => 
    MIN_PERL_VERSION	=> '5.006',
    PREREQ_PM           =>  {
        'Test::Simple'  =>  0.44
    },
    META_MERGE => { 
        'meta-spec'     => {
            version     => 2
        },
        resources       => {
            homepage    => 'https://github.com/aspeer/PerlTidy-SubSort',
            repository  => {
                type    => 'git',
                url     => 'https://github.com/aspeer/PerlTidy-SubSort.git',
                web     => 'https://github.com/aspeer/PerlTidy-SubSort'
            }
        }
    },
    'depend'            => {
        Makefile        => '$(VERSION_FROM)',
    },
    'dist'		=> {
	COMPRESS        =>  'gzip -9f',
	SUFFIX		=>  '.gz'
    },
);
my %MM_Compat=(
    '6.31'              => [q(LICENSE)],
    '6.46'              => [q(META_MERGE)],
    '6.48'              => [q(MIN_PERL_VERSION)],
    '6.52'              => [q(CONFIGURE_REQUIRES)],
    '6.5503'            => [q(BUILD_REQUIRES)],
    '6.64'              => [q(TEST_REQUIRES)],
);
while (my($mm_ver_test, $ar)=each %MM_Compat) {
    if (version->parse($mm_ver) < version->parse($mm_ver_test)) {
        delete @WriteMakefile{@{$ar}};
    }
}
WriteMakefile(%WriteMakefile);
package MY;
sub post_initialize {
    #  Add license file, other support files here
    #
    my $mm_or=shift();
    $mm_or->{'PM'}{'LICENSE'}='$(INST_LIBDIR)/$(BASEEXT)/LICENSE';
    $mm_or->SUPER::post_initialize;
};












#  Compiler Pragma
#

#  All done, init finished
#
#------------------------------------------------------------------------------

#  Create the Makefile
#
WriteMakefile(

    NAME                                => '[% NAME %]',

    VERSION_FROM                        => '[% FILE %]',

    PREREQ_PM                           =>  {
        'Test::Simple'                  =>  0.44
    },

    'dist'                              =>  {
        COMPRESS                        =>  'gzip -9f',
        SUFFIX                          =>  '.gz',
    },

    'depend'                            =>  {
        Makefile                        =>  '$(VERSION_FROM)',
    },

    ($] >=  5.005 ?
         (ABSTRACT_FROM                 =>  '[% FILE %]',
          AUTHOR                        =>  '[%  AUTHOR %] <[%  EMAIL %]>') : ()
         ),

    ($mm_ver < 6.31 ? () : (
        LICENSE                         =>  '[% LICENSE %]',
    )),

    ($mm_ver <= 6.45 ? () : (
        META_MERGE => { 
            'meta-spec'         => {
                version         => 2
            },
            resources           => {
                homepage        => 'https://github.com/aspeer/[% DISTNAME %]',
                repository      => {
                    type        => 'git',
                    url         => 'https://github.com/aspeer/[% DISTNAME %].git',
                    web         => 'https://github.com/aspeer/[% DISTNAME %]'
                }
            }
        }
    )),

    ($mm_ver < 6.48 ? () : (
        MIN_PERL_VERSION	=>  '5.006',
    )),

   );

package MY;

sub post_initialize {

    #  Add license file, other support files here
    #
    my $mm_or=shift();
    $mm_or->{'PM'}{'LICENSE'}='$(INST_LIBDIR)/$(BASEEXT)/LICENSE';
    $mm_or->SUPER::post_initialize;

};

