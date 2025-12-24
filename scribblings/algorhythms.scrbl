#lang scribble/manual

@require[@for-label[racket/base algorhythms]]

@title{Algorhythms}
@author{Anurag Muthyam}

@defmodule[algorhythms]

A Racket library of algorithms and data structures.

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

;; Calculate factorial
(factorial 10)  ; => 3628800

;; Encode to Morse code
(encode-to-morse "SOS")  ; => "... --- ..."
]

@section{Math Functions}

@subsection{Combinatorics}

@defproc[(factorial [n exact-nonnegative-integer?]) exact-nonnegative-integer?]{
  Returns the factorial of @racket[n].
  
  @racketblock[
  (factorial 0)   ; => 1
  (factorial 5)   ; => 120
  (factorial 10)  ; => 3628800
  ]
}

@subsection{Number Theory}

@defproc[(prime? [n exact-positive-integer?]) boolean?]{
  Returns @racket[#t] if @racket[n] is prime, @racket[#f] otherwise.
}

@defproc[(gcd-v1 [a integer?] [b integer?]) integer?]{
  Returns the greatest common divisor of @racket[a] and @racket[b].
}

@defproc[(lcm-v1 [a integer?] [b integer?]) integer?]{
  Returns the least common multiple of @racket[a] and @racket[b].
}

@subsection{Arithmetic}

@defproc[(square [n number?]) number?]{
  Returns the square of @racket[n].
}

@defproc[(cube [n number?]) number?]{
  Returns the cube of @racket[n].
}

@defproc[(abs-v1 [n number?]) number?]{
  Returns the absolute value of @racket[n].
}

@section{Data Structures}

@subsection{Higher-Order Functions}

@defproc[(filter-v1 [pred procedure?] [lst list?]) list?]{
  Returns a list containing only elements of @racket[lst] for which @racket[pred] returns true.
}

@defproc[(reduce-v1 [fn procedure?] [init any/c] [lst list?]) any/c]{
  Reduces @racket[lst] to a single value by applying @racket[fn] cumulatively.
}

@defproc[(foldr-v1 [fn procedure?] [init any/c] [lst list?]) any/c]{
  Right-fold over @racket[lst] with @racket[fn] and initial value @racket[init].
}

@defproc[(flatten-v1 [lst list?]) list?]{
  Flattens a nested list structure into a single list.
}

@defproc[(flatmap [fn procedure?] [lst list?]) list?]{
  Maps @racket[fn] over @racket[lst] and flattens the result.
}

@subsection{Sorting Algorithms}

@defproc[(bubble-sort [lst list?]) list?]{
  Sorts @racket[lst] using the bubble sort algorithm.
}

@defproc[(insertion-sort [lst list?]) list?]{
  Sorts @racket[lst] using the insertion sort algorithm.
}

@defproc[(quick-sort [lst list?]) list?]{
  Sorts @racket[lst] using the quicksort algorithm.
}

@defproc[(selection-sort [lst list?]) list?]{
  Sorts @racket[lst] using the selection sort algorithm.
}

@section{Encoding}

@defproc[(encode-to-morse [str string?]) string?]{
  Encodes a string to Morse code.
  
  @racketblock[
  (encode-to-morse "SOS")    ; => "... --- ..."
  (encode-to-morse "HELLO")  ; => ".... . .-.. .-.. ---"
  ]
}

@defproc[(decode-from-morse [morse string?]) string?]{
  Decodes a Morse code string back to text.
}

@section{Utilities}

@defproc[(memoize [fn procedure?]) procedure?]{
  Returns a memoized version of @racket[fn] that caches results.
  
  @racketblock[
  (define fib-memo
    (memoize (lambda (n)
               (if (<= n 1) n
                   (+ (fib-memo (- n 1)) (fib-memo (- n 2)))))))
  ]
}

@defproc[(lazy [thunk procedure?]) procedure?]{
  Creates a lazy evaluation wrapper around @racket[thunk].
}

@section{License}

BSD-3-Clause License

Copyright (c) 2024, Anurag Muthyam
