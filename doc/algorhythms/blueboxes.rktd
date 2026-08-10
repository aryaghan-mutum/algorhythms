1024
((3) 0 () 1 ((q lib "algorhythms/main.rkt")) () (h ! (equal) ((c def c (c (? . 0) q quick-sort)) q (1030 . 3)) ((c def c (c (? . 0) q factorial)) q (0 . 3)) ((c def c (c (? . 0) q selection-sort)) q (1087 . 3)) ((c def c (c (? . 0) q encode-to-morse)) q (1148 . 3)) ((c def c (c (? . 0) q square)) q (318 . 3)) ((c def c (c (? . 0) q cube)) q (371 . 3)) ((c def c (c (? . 0) q reduce-v1)) q (561 . 5)) ((c def c (c (? . 0) q lazy)) q (1348 . 3)) ((c def c (c (? . 0) q prime?)) q (94 . 3)) ((c def c (c (? . 0) q memoize)) q (1286 . 3)) ((c def c (c (? . 0) q filter-v1)) q (475 . 4)) ((c def c (c (? . 0) q gcd-v1)) q (164 . 4)) ((c def c (c (? . 0) q bubble-sort)) q (911 . 3)) ((c def c (c (? . 0) q decode-from-morse)) q (1214 . 3)) ((c def c (c (? . 0) q lcm-v1)) q (241 . 4)) ((c def c (c (? . 0) q insertion-sort)) q (969 . 3)) ((c def c (c (? . 0) q foldr-v1)) q (668 . 5)) ((c def c (c (? . 0) q abs-v1)) q (422 . 3)) ((c def c (c (? . 0) q flatten-v1)) q (774 . 3)) ((c def c (c (? . 0) q flatmap)) q (831 . 4))))
procedure
(factorial n) -> exact-nonnegative-integer?
  n : exact-nonnegative-integer?
procedure
(prime? n) -> boolean?
  n : exact-positive-integer?
procedure
(gcd-v1 a b) -> integer?
  a : integer?
  b : integer?
procedure
(lcm-v1 a b) -> integer?
  a : integer?
  b : integer?
procedure
(square n) -> number?
  n : number?
procedure
(cube n) -> number?
  n : number?
procedure
(abs-v1 n) -> number?
  n : number?
procedure
(filter-v1 pred lst) -> list?
  pred : procedure?
  lst : list?
procedure
(reduce-v1 fn init lst) -> any/c
  fn : procedure?
  init : any/c
  lst : list?
procedure
(foldr-v1 fn init lst) -> any/c
  fn : procedure?
  init : any/c
  lst : list?
procedure
(flatten-v1 lst) -> list?
  lst : list?
procedure
(flatmap fn lst) -> list?
  fn : procedure?
  lst : list?
procedure
(bubble-sort lst) -> list?
  lst : list?
procedure
(insertion-sort lst) -> list?
  lst : list?
procedure
(quick-sort lst) -> list?
  lst : list?
procedure
(selection-sort lst) -> list?
  lst : list?
procedure
(encode-to-morse str) -> string?
  str : string?
procedure
(decode-from-morse morse) -> string?
  morse : string?
procedure
(memoize fn) -> procedure?
  fn : procedure?
procedure
(lazy thunk) -> procedure?
  thunk : procedure?
