use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
#  Foobar::Gherkin

WriteMakefile(
    NAME         => '[%  NAME %]',
    VERSION_FROM => '[%  FILE %]', # finds $VERSION
    AUTHOR       => '[%  AUTHOR %] ([%  EMAIL %])',
    ABSTRACT     => '[% ABSTRACT %]',
    PREREQ_PM    => {
                     'Test::Simple' => 0.44,
                    },
);
