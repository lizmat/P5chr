[![Actions Status](https://github.com/lizmat/P5chr/actions/workflows/linux.yml/badge.svg)](https://github.com/lizmat/P5chr/actions) [![Actions Status](https://github.com/lizmat/P5chr/actions/workflows/macos.yml/badge.svg)](https://github.com/lizmat/P5chr/actions) [![Actions Status](https://github.com/lizmat/P5chr/actions/workflows/windows.yml/badge.svg)](https://github.com/lizmat/P5chr/actions)

NAME
====

Raku port of Perl's chr() / ord() built-ins

SYNOPSIS
========

```raku
use P5chr; # exports chr() and ord()

my $a = 65;
say chr $a;

my $a = "A";
say ord $a;
```

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

With the arrival of RakuAST, it has become impossible to access the topic variable (`$_`) of the caller's scope. So Perl's idiom of calling `chr` or `ord` has become impossible. Code such as:

```raku
say chr;
```

should be changed to either:

```raku
say chr($_);
```

or, using the subroutine as a method syntax, with the prefix `.` shortcut to use that scope's `$_` as the invocant:

```raku
say .&chr;
```

By the way, the Raku built-ins `chr` and `ord` subroutines have almost the same semantics as their Perl counterparts (apart from the topic from caller feature, which no longer works). So in most cases it should not be needed to be using this module at all anymore.

AUTHOR
======

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/P5chr . Comments and Pull Requests are welcome.

If you like this module, or what I'm doing more generally, committing to a [small sponsorship](https://github.com/sponsors/lizmat/) would mean a great deal to me!

COPYRIGHT AND LICENSE
=====================

Copyright 2018, 2019, 2020, 2021, 2026 Elizabeth Mattijsen

Re-imagined from Perl as part of the CPAN Butterfly Plan.

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

