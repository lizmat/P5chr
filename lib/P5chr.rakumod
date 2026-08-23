use v6.d;

proto sub chr(|) is export {*}
multi sub chr(--> Str:D) {
    die "Chr on caller's topic variable is no longer possible, please
        use '.&chr' syntax instead".naive-word-wrapper;
}
multi sub chr(Int() $n is copy --> Str:D) {
    role InvalidChr { has $.ord }

    $n < 0
      ?? 0xfffd.chr
      !! 128 <= $n <= 255
        ?? "?" but InvalidChr($n)
        !! $n.chr
}

proto sub ord(|) is export {*}
multi sub ord(--> Int:D) { CALLER::LEXICAL::<$_>.ord }
multi sub ord(Str() $s --> Int:D) { $s.ord }

# vim: expandtab shiftwidth=4
