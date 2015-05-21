# [%  NAME %] - check module loading and create testing directory

use Test::More tests => [% IF NEED_NEW_METHOD %] 2 [% ELSE %] 1 [% END %];

BEGIN { use_ok( '[%  NAME %]' ); }
[% IF NEED_NEW_METHOD %]
my $object = [%  NAME %]->new ();
isa_ok ($object, '[%  NAME %]');
[%- END %]
