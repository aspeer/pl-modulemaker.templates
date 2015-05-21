#!perl -T

use Test::More;

eval "use Test::Pod::Coverage 1.06";
plan skip_all => "Test::Pod::Coverage 1.06 required for testing POD coverage"
    if $@;

eval "use Pod::Coverage 0.17";
plan skip_all => "Pod::Coverage 0.17 required for testing POD coverage"
    if $@;

all_pod_coverage_ok();