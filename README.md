NAME
====

Raku port of Perl's chr() / ord() built-ins

SYNOPSIS
========

    use P5chr; # exports chr() and ord()

    my $a = 65;
    say chr $a;

    $_ = 65;
    say chr();   # bare chr may be compilation error to prevent P5isms in Raku

    my $a = "A";
    say ord $a;

    $_ = "A";
    say ord();   # bare ord may be compilation error to prevent P5isms in Raku

DESCRIPTION
===========

This module tries to mimic the behaviour of Perl's `chr` and `ord` built-ins as closely as possible in the Raku Programmming Language.

ORIGINAL PERL 5 DOCUMENTATION
=============================

    chr NUMBER
    chr     Returns the character represented by that NUMBER in the character
            set. For example, "chr(65)" is "A" in either ASCII or Unicode, and
            chr(0x263a) is a Unicode smiley face.

            Negative values give the Unicode replacement character
            (chr(0xfffd)), except under the bytes pragma, where the low eight
            bits of the value (truncated to an integer) are used.

            If NUMBER is omitted, uses $_.

            For the reverse, use "ord".

            Note that characters from 128 to 255 (inclusive) are by default
            internally not encoded as UTF-8 for backward compatibility
            reasons.

    ord EXPR
    ord     Returns the numeric value of the first character of EXPR. If EXPR
            is an empty string, returns 0. If EXPR is omitted, uses $_. (Note
            character, not byte.)

            For the reverse, see "chr".

PORTING CAVEATS
===============

In future language versions of Raku, it will become impossible to access the `$_` variable of the caller's scope, because it will not have been marked as a dynamic variable. So please consider changing:

    chr;

to either:

    chr($_);

or, using the subroutine as a method syntax, with the prefix `.` shortcut to use that scope's `$_` as the invocant:

    .&chr;

AUTHOR
======

Elizabeth Mattijsen <liz@wenzperl.nl>

Source can be located at: https://github.com/lizmat/P5chr . Comments and Pull Requests are welcome.

COPYRIGHT AND LICENSE
=====================

Copyright 2018-2020 Elizabeth Mattijsen

Re-imagined from Perl as part of the CPAN Butterfly Plan.

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

