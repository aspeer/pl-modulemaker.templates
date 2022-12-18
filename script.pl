#!/usr/bin/perl

#
#  This file is part of [% NAME %]
#
[% LICENSE_NOTICE_COMMENT %]
#
#  Full license text is available at:
#
#  <[% LICENSE_URL %]>
#

#  Compiler pragma
#
use strict;
use vars qw($VERSION);
use warnings;


#  Script support modules
#
use [% NAME %];
use [% NAME %]::Util qw(msg err debug Dumper);
use [% NAME %]::Opt qw(getopt);
use [% NAME %]::Constant;


#  Other External modules
#


#  Constantas
#
use constant {


    #  Command line options in Getopt::Long format
    #
    OPTION_AR => [

        qw(test),

    ],


    #  Option defaults
    #
    OPTION_DEFAULT_HR => {
        test	=> 1,
    },


};


#  Version Info, must be all one line for MakeMaker, CPAN.
#
$VERSION='[% VERSION %]';


#  Run main
#
exit(${&main(&getopt(+OPTION_AR, +OPTION_DEFAULT_HR)) || die err ()} || 0);    # || 0 stops warnings


#===================================================================================================


sub main {    #no subsort


    #  Get base object blassed with options as first arg.
    #
    my $self=[% NAME %]->new(shift());
    

    #  Do something
    #
    debug('running');


    #  Done
    #
    return \undef;


}


1;
__END__

# Documentation in Markdown. Convert to POD using markpod from 
#
# https://github.com/aspeer/pl-markpod.git 

=begin markdown

# NAME

[% script %] - script short description

# SYNOPSIS

`[% script %] [--option] <arguments>`

# DESCRIPTION

[% script %] script long description

# OPTIONS

**--help** show help synopsis

**--man** show man page

**--version** show version information

# USAGE

script usage here
```
[% script %] --option argument
```
  
# AUTHOR

[% AUTHOR %] [% EMAIL %]

# LICENSE and COPYRIGHT

This file is part of [% NAME %]

[% LICENSE_NOTICE %]

Full license text is available at:

[% LICENSE_URL %]

=end markdown
