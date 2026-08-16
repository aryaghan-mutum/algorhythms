#lang scribble/manual

@require[@for-label[algorhythms
                    racket/base
                    racket/contract]]

@title{Algorhythms}
@author{Anurag Muthyam}

@defmodule[algorhythms]

A Racket library of algorithms and data structures. Every function documented
below is exported by @racketmodname[algorhythms]; there are no submodule
imports required for anything on this page.

@table-of-contents[]

@section{Installation}

Install from the Racket package catalog:

@verbatim{raco pkg install algorhythms}

Or from source:

@verbatim{
git clone https://github.com/aryaghan-mutum/algorhythms.git
cd algorhythms
raco pkg install --link .
}

@section{Quick Start}

@racketblock[
(require algorhythms)

(factorial 10)                 (code:comment "3628800")
(prime? 17)                    (code:comment "#t")
(encode-to-morse "SOS")        (code:comment "\"... --- ...\"")
(add 1 2 3 4 5)                (code:comment "15  (variadic calculator)")
(quick-sort '(3 1 4 1 5) <)    (code:comment "'(1 1 3 4 5)")
]

@section{Calculator (Arithmetic Operators)}

Variadic calculator-style operators that accept any numeric type Racket
supports (exact integers, exact rationals, inexact/decimals, complex).
Under the hood, the binary implementations use pure recursion (@racket[add1]
/ @racket[sub1]) for exact integers and delegate to the built-in numeric
tower for non-integer inputs.

@defproc[(add [n number?] ...) number?]{
  Variadic sum. @racket[(add)] returns @racket[0].
  @racketblock[
  (add 1 2 3 4 5)   (code:comment "15")
  (add 1/2 1/3 1/6) (code:comment "1")
  (add 1.5 2.5)     (code:comment "4.0")
  ]
}

@defproc[(subtract [x number?] [y number?] ...) number?]{
  Left-to-right difference. With a single argument, negates it.
  @racketblock[
  (subtract 100 10 20 30)  (code:comment "40")
  (subtract 7)             (code:comment "-7")
  ]
}

@defproc[(multiply [n number?] ...) number?]{
  Variadic product. @racket[(multiply)] returns @racket[1].
  @racketblock[(multiply 2 3 4) (code:comment "24")]
}

@defproc[(divide [x number?] [y (and/c number? (not/c zero?))] ...) number?]{
  Left-to-right quotient. With a single non-zero argument, returns
  the reciprocal. Raises an exception on any zero divisor.
  @racketblock[
  (divide 100 5 2)  (code:comment "10")
  (divide 4)        (code:comment "1/4")
  ]
}

@defproc[(modulus [a exact-integer?] [b (and/c exact-integer? (not/c zero?))])
         exact-integer?]{
  Integer modulo (matches Racket's @racket[modulo]).
}

@defproc[(power-of [base number?] [n exact-nonnegative-integer?]) number?]{
  @racket[base] raised to non-negative integer @racket[n], via repeated
  multiplication.
}

@defproc[(add-integers-recursive [a exact-integer?] [b exact-integer?])
         exact-integer?]{
  Add two integers using only @racket[add1]/@racket[sub1] — a from-scratch
  recursive demonstration.
}

@defproc[(multiply-integers-recursive [a exact-integer?] [b exact-integer?])
         exact-integer?]{
  Multiply two integers using repeated addition — a from-scratch recursive
  demonstration.
}

@defproc[(multiply-integers-loop [a exact-integer?] [b exact-integer?])
         exact-integer?]{
  Same result as @racket[multiply-integers-recursive], implemented with an
  iterative accumulator loop instead of recursion.
}

@section{Math}

@subsection{Combinatorics}

@defproc[(factorial [n exact-nonnegative-integer?]) exact-nonnegative-integer?]{
  Factorial of @racket[n]. @racket[(factorial 0)] is @racket[1] (base case).
}

@defproc[(unique-permutations [lst list?]) (listof list?)]{
  All distinct permutations of @racket[lst], deduped for repeated elements.
}

@defproc[(pascal-triangle [rows exact-positive-integer?]) (listof (listof exact-positive-integer?))]{
  First @racket[rows] rows of Pascal's triangle as a list of lists.
}

@subsection{Number Theory}

@defproc[(prime? [n exact-integer?]) boolean?]{
  @racket[#t] if @racket[n] is prime.
}

@defproc[(primes-up-to [n exact-integer?]) (listof exact-positive-integer?)]{
  All primes @math{≤ n}, via trial division.
}

@defproc[(primes-up-to-via-sieve [n exact-integer?]) (listof exact-positive-integer?)]{
  All primes @math{≤ n}, via the Sieve of Eratosthenes.
}

@defproc[(prime-factors [n exact-positive-integer?]) (listof exact-positive-integer?)]{
  Prime factorization as a flat list, e.g. @racket[(prime-factors 12)] is @racket['(2 2 3)].
}

@defproc[(gcd-euclidean [a exact-integer?] [b exact-integer?]) exact-integer?]{
  Greatest common divisor via Euclid's algorithm. The built-in @racket[gcd] is
  also re-exported.
}

@defproc[(lcm-custom [a exact-integer?] [b exact-integer?]) exact-integer?]{
  Least common multiple, derived from @racket[gcd-euclidean].
}

@defproc[(fibonacci [n exact-nonnegative-integer?]) exact-nonnegative-integer?]{
  The @racket[n]-th Fibonacci number, computed in @math{O(log n)} via matrix
  exponentiation.
}

@defproc[(collatz-steps [n exact-positive-integer?]) exact-positive-integer?]{
  Number of Collatz-conjecture steps needed to reach @math{1} starting from
  @racket[n] (@math{n/2} if even, @math{3n+1} if odd).
}

@defproc[(leap-year? [year exact-integer?]) boolean?]{
  @racket[#t] when @racket[year] is a Gregorian leap year.
}

@defproc[(palindrome-num? [x exact-integer?]) boolean?]{
  @racket[#t] when the decimal digits of @racket[x] read the same forward and
  backward.
}

@subsection{Arithmetic}

@defproc[(square [n number?]) number?]{Squares @racket[n].}

@defproc[(cube [n number?]) number?]{Cubes @racket[n].}

@defproc[(absolute [n number?]) number?]{Absolute value of @racket[n].}

@defproc[(increment [n number?]) number?]{Returns @racket[(add1 n)].}

@defproc[(double [n number?]) number?]{Returns @racket[(* 2 n)].}

@defproc[(halve [n number?]) number?]{Returns @racket[(/ n 2)].}

@defproc[(sum-to-n [n exact-nonnegative-integer?]) exact-nonnegative-integer?]{
  Sum of the integers @math{1..n}.
}

@defproc[(power [base number?] [n exact-nonnegative-integer?]) number?]{
  Alias for the built-in @racket[expt] via a professional name.
}

@subsection{Statistics}

@defproc[(mean [lst (non-empty-listof real?)]) real?]{Arithmetic mean.}
@defproc[(median [lst (non-empty-listof real?)]) real?]{Median value.}
@defproc[(mode [lst (non-empty-listof any/c)]) any/c]{Most frequent element.}
@defproc[(variance [lst (non-empty-listof real?)]) real?]{Population variance.}
@defproc[(standard-deviation [lst (non-empty-listof real?)]) real?]{Population standard deviation.}
@defproc[(percentile [lst (non-empty-listof real?)] [p (real-in 0 100)]) real?]{
  Value at the given percentile.
}

@subsection{Financial}

@defproc[(simple-interest [principal real?] [time real?] [rate real?]) real?]{
  @math{P × R × T}.
}

@defproc[(compound-interest [principal real?] [time real?] [rate real?]) real?]{
  Standard compound-interest formula.
}

@defproc[(npv [rate real?] [cashflows (listof real?)]) real?]{
  Net Present Value of a stream of cashflows.
}

@defproc[(irr [cashflows (listof real?)]) real?]{
  Internal Rate of Return of a stream of cashflows.
}

@subsection{Matrix}

@defproc[(matrix-multiply [m1 (listof list?)] [m2 (listof list?)]) (listof list?)]{
  Standard matrix multiplication using lists of lists.
}

@defproc[(matrix-transpose [m (listof list?)]) (listof list?)]{Matrix transpose.}
@defproc[(matrix-determinant [m (listof list?)]) real?]{Matrix determinant.}
@defproc[(matrix-inverse [m (listof list?)]) (or/c (listof list?) #f)]{Matrix inverse or @racket[#f] if singular.}
@defproc[(identity-matrix [n exact-positive-integer?]) (listof list?)]{@math{n × n} identity matrix.}

@subsection{Algebra}

@defproc[(solve-linear [a real?] [b real?]) real?]{Solves @math{a·x + b = 0} for @racket[x].}
@defproc[(quadratic-formula [a real?] [b real?] [c real?]) (list/c any/c any/c)]{
  Both roots of the quadratic @math{a·x² + b·x + c = 0}.
}
@defproc[(fast-expt [base number?] [n exact-nonnegative-integer?]) number?]{
  Fast exponentiation in @math{O(log n)}.
}

@subsection{Trigonometry}

@defproc[(sine [x real?]) real?]{Sine of @racket[x] radians (custom Taylor-series).}
@defproc[(cosine [x real?]) real?]{Cosine of @racket[x] radians.}
@defproc[(tangent [x real?]) real?]{Tangent of @racket[x] radians.}
@defproc[(hypotenuse [a real?] [b real?]) real?]{@math{√(a² + b²)}.}
@defproc[(degrees->radians [deg real?]) real?]{Degrees → radians.}
@defproc[(radians->degrees [rad real?]) real?]{Radians → degrees.}

@subsection{Geometry}

@defproc[(circle-area [r real?]) real?]{Area of a circle.}
@defproc[(rectangle-area [len real?] [wid real?]) real?]{Area of a rectangle.}
@defproc[(area-of-triangle [base real?] [height real?]) real?]{Triangle area.}
@defproc[(heron [a real?] [b real?] [c real?]) real?]{Triangle area via Heron's formula.}
@defproc[(sphere-volume [r real?]) real?]{Volume of a sphere.}
@defproc[(cube-volume [s real?]) real?]{Volume of a cube.}
@defproc[(pythagoras [x real?] [y real?]) real?]{@math{√(x² + y²)}.}

@subsection{Logarithms}

@defproc[(log-custom [b real?] [n real?]) real?]{Logarithm base @racket[b] of @racket[n].}

@section{Data Structures}

@subsection{Higher-Order Functions}

@defproc[(mapper [fn procedure?] [lst list?]) list?]{Map @racket[fn] over @racket[lst] from scratch.}
@defproc[(filter-custom [pred procedure?] [lst list?]) list?]{Keep elements satisfying @racket[pred].}
@defproc[(reduce [fn procedure?] [lst list?]) any/c]{Reduce to a single value.}
@defproc[(foldl-custom [fn procedure?] [init any/c] [lst list?]) any/c]{Left fold.}
@defproc[(foldr-custom [fn procedure?] [init any/c] [lst list?]) any/c]{Right fold.}
@defproc[(flatten-list [lst any/c]) list?]{Flatten any nested structure into a single-level list.}
@defproc[(flatmap [lst list?]) list?]{Flatten nested lists (single-argument form).}
@defproc[(compose-fns [fn procedure?] ...) procedure?]{Right-to-left function composition.}
@defproc[(pipe [fn procedure?] ...) procedure?]{Left-to-right function composition.}
@defproc[(curry2 [fn (any/c any/c -> any/c)]) procedure?]{Curry a 2-argument function.}
@defproc[(complement [fn procedure?]) procedure?]{Return a function that negates @racket[fn]'s result.}
@defproc[(make-counter) procedure?]{Return an independent counter that yields 0, 1, 2, ....}

@defproc[(lazy [thunk (-> any/c)]) (-> any/c)]{
  Wrap @racket[thunk] so it evaluates on first call and caches the result
  thereafter.
}

@defproc[(memoize [fn (any/c -> any/c)]) (any/c -> any/c)]{
  Return a memoized version of @racket[fn] that caches results per argument.
  @racketblock[
  (define fib-memo
    (memoize (lambda (n)
               (if (<= n 1) n
                   (+ (fib-memo (- n 1)) (fib-memo (- n 2)))))))
  ]
}

@subsection{Lists}

@defproc[(my-length [lst list?]) exact-nonnegative-integer?]{
  Length via iterative accumulator (a from-scratch counterpart to the built-in
  @racket[length]).
}

@defproc[(my-last [lst (and/c list? (not/c empty?))]) any/c]{Last element.}
@defproc[(penultimate [lst list?]) any/c]{Second-to-last element.}
@defproc[(remove-last [lst list?]) list?]{Return @racket[lst] without its last element.}
@defproc[(nth [lst list?] [pos exact-positive-integer?]) any/c]{1-indexed element access.}
@defproc[(occurrences [item any/c] [lst list?]) exact-nonnegative-integer?]{
  Count occurrences of @racket[item] in @racket[lst] (uses @racket[equal?]).
}
@defproc[(remove-element [item any/c] [lst list?]) list?]{
  Return @racket[lst] with every occurrence of @racket[item] removed.
}
@defproc[(zip [lst list?] ...) (listof list?)]{
  Transpose several lists into a list of tuples, truncating to the shortest.
}
@defproc[(append-custom [lst1 list?] [lst2 list?]) list?]{
  Concatenate two lists using natural recursion (custom to avoid shadowing the
  built-in @racket[append]).
}
@defproc[(copy-list [lst list?]) list?]{Return a fresh flat copy of @racket[lst].}
@defproc[(copy-tree [tr any/c]) any/c]{Return a fresh cons-tree with the same structure and leaves.}
@defproc[(range-1-to-n [n exact-integer?]) (listof exact-positive-integer?)]{
  Build the list @racket['(1 2 ... n)]; empty when @racket[n ≤ 0].
}
@defproc[(alternative-elems [lst list?]) list?]{Every other element, starting with the first.}
@defproc[(pack [lst list?]) (listof list?)]{Group consecutive equal elements into sublists.}
@defproc[(encode [lst list?]) (listof (list exact-nonnegative-integer? any/c))]{
  Run-length encode @racket[lst]: @racket['(a a b c c)] → @racket['((2 a) (1 b) (2 c))].
}
@defproc[(member-custom? [item any/c] [lst list?]) boolean?]{
  @racket[#t] when @racket[item] is present in @racket[lst].
}
@defproc[(palindrome-lst? [lst list?]) boolean?]{
  @racket[#t] when @racket[lst] reads the same forward and backward.
}

@subsection{Sets}

@defproc[(unique-elements [lst list?]) list?]{
  Remove duplicates, preserving first-occurrence order.
}
@defproc[(set-union [a list?] [b list?]) list?]{Set union (deduplicated).}
@defproc[(set-intersection [a list?] [b list?]) list?]{Set intersection, preserving @racket[a]'s order.}
@defproc[(compress [lst list?]) list?]{Collapse consecutive equal elements (Unix @tt{uniq}).}
@defproc[(duplicates-by-elem [lst list?] [item any/c]) list?]{Every occurrence of @racket[item] in @racket[lst].}
@defproc[(set-move-elem-to-last [lst (listof number?)] [e number?]) list?]{
  Move every occurrence of @racket[e] to the end of the list, keeping only one.
}

@subsection{Sorting}

@defproc[(bubble-sort [lst list?] [less? (any/c any/c -> any/c)]) list?]{
  Bubble sort with a comparator. Pass @racket[<] for ascending numeric order.
}
@defproc[(insertion-sort [lst (listof real?)]) (listof real?)]{
  Insertion sort, ascending order.
}
@defproc[(quick-sort [lst list?] [less? (any/c any/c -> any/c)]) list?]{
  Quicksort with a comparator.
}
@defproc[(selection-sort [lst (listof real?)]) (listof real?)]{
  Selection sort, ascending order.
}

@subsection{Strings}

@defproc[(reverse-words [str string?]) string?]{Reverse the order of whitespace-separated tokens.}
@defproc[(reverse-chars-in-str [str string?]) string?]{Reverse the characters of @racket[str].}
@defproc[(string-find [pattern string?] [str string?]) (or/c exact-nonnegative-integer? #f)]{
  KMP substring search; returns the start index or @racket[#f].
}
@defproc[(string-hash-custom [str string?]) exact-nonnegative-integer?]{DJB-style hash of @racket[str].}
@defproc[(string-index-of-char [ch char?] [str string?]) (or/c exact-nonnegative-integer? #f)]{
  0-based index of the first occurrence of @racket[ch], or @racket[#f].
}
@defproc[(string-split-custom [sep char?] [str string?]) (listof string?)]{
  Split @racket[str] on single-character separator @racket[sep].
}
@defproc[(string-join-custom [sep char?] [lst (listof string?)]) string?]{
  Join a list of strings with single-character separator @racket[sep].
}
@defproc[(string-upcase-custom [str string?]) string?]{Upper-case every character.}
@defproc[(string-downcase-custom [str string?]) string?]{Lower-case every character.}

@subsection{Queue}

@defproc[(make-queue) queue?]{Create an empty FIFO queue.}
@defproc[(queue-empty? [q queue?]) boolean?]{@racket[#t] when @racket[q] is empty.}
@defproc[(enqueue! [q queue?] [v any/c]) void?]{Append @racket[v] to the back of @racket[q].}
@defproc[(dequeue! [q queue?]) any/c]{Remove and return the front element; raises on empty.}
@defproc[(queue-peek [q queue?]) any/c]{Return the front element without removing it.}

@subsection{Stack}

@defproc[(make-stack) procedure?]{
  Create a message-passing LIFO stack. Send @racket['empty?], @racket['top],
  @racket['push!], or @racket['pop!].
  @racketblock[
  (define s (make-stack))
  (s 'push! 1)
  (s 'push! 2)
  (s 'top)      (code:comment "2")
  (s 'pop!)
  (s 'top)      (code:comment "1")
  ]
}

@section{Encoding}

@defproc[(encode-to-morse [str string?]) string?]{
  Encode @racket[str] to Morse code (letters, digits, common punctuation).
  Word breaks encode as @racket["/"].
  @racketblock[
  (encode-to-morse "SOS")    (code:comment "\"... --- ...\"")
  (encode-to-morse "HELLO")  (code:comment "\".... . .-.. .-.. ---\"")
  ]
}

@defproc[(decode-from-morse [morse string?]) string?]{
  Decode a Morse-encoded string produced by @racket[encode-to-morse] back to
  upper-case text. Raises on unsupported tokens.
}

@section{License}

BSD-3-Clause License. Copyright (c) 2024, Anurag Muthyam.
