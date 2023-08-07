use v6.*;
use Test;
use P5chr;

plan 4;

is ord('A'),   65, 'did we get the right number from single';
is ord('ABC'), 65, 'did we get the right number from multiple';

with 'A'   { is .&ord, 65, 'did we get the right number from single' }
with 'ABC' { is .&ord, 65, 'did we get the right number from multiple' }

# vim: expandtab shiftwidth=4
