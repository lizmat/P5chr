use v6.*;
use Test;
use P5chr;

plan 4;

ok defined(::('&chr')),       'is &chr imported?';
ok !defined(P5chr::{'&chr'}), 'is &chr externally NOT accessible?';
ok defined(::('&ord')),       'is &ord imported?';
ok !defined(P5chr::{'&ord'}), 'is &ord externally NOT accessible?';

# vim: expandtab shiftwidth=4
