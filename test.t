# [%  NAME %] - check module loading and create testing directory

use Test::More tests => 3;

BEGIN { use_ok( '[%  NAME %]' ) }
require_ok('[%  NAME %]');
my $object = [%  NAME %]->new ();
isa_ok ($object, '[%  NAME %]');
