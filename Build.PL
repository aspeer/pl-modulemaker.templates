use Module::Build;
# See perldoc Module::Build for details of how this works

Module::Build->new( 
    module_name         => '[%  NAME %]',
    dist_author         => '[%  AUTHOR %] <[% EMAIL %]>',
[%- IF LICENSE.match('perl|gpl|artistic') %]
    license             => '[%  LICENSE %]',
[%- END %]
    create_readme       => 1,
    create_makefile_pl  => 'traditional',
    requires        => {
        # module requirements here
    },
    build_requires  => { 
        Test::Simple => 0.44,
    },
)->create_build_script;
