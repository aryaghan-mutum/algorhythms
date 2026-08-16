#!/usr/bin/env racket
#lang racket/base

;; Algorhythms CLI Tool
;; Usage: racket cli.rkt <command> [args...]

(require racket/cmdline
         racket/match
         (except-in racket/string string-find)
         racket/format
         "../algorhythms.rkt")

(define (print-help)
  (displayln "Algorhythms CLI - A command-line interface for algorithms")
  (displayln "")
  (displayln "Usage: racket cli.rkt <command> [arguments]")
  (displayln "")
  (displayln "Commands:")
  (displayln "  factorial <n>          Calculate factorial of n")
  (displayln "  prime? <n>             Check if n is prime")
  (displayln "  gcd <a> <b>            Greatest common divisor")
  (displayln "  lcm <a> <b>            Least common multiple")
  (displayln "  morse encode <text>    Encode text to Morse code")
  (displayln "  morse decode <morse>   Decode Morse code to text")
  (displayln "  sort <algorithm> <nums...>  Sort numbers")
  (displayln "    algorithms: bubble, insertion, quick, selection")
  (displayln "  calc add <nums...>     Sum a list of numbers")
  (displayln "  calc sub <nums...>     Left-to-right subtraction")
  (displayln "  calc mul <nums...>     Product of a list of numbers")
  (displayln "  calc div <nums...>     Left-to-right division")
  (displayln "  calc mod <a> <b>       a modulo b (integers)")
  (displayln "  calc pow <base> <n>    base raised to integer n")
  (displayln "  help                   Show this help message")
  (displayln "")
  (displayln "Examples:")
  (displayln "  racket cli.rkt factorial 10")
  (displayln "  racket cli.rkt prime? 17")
  (displayln "  racket cli.rkt morse encode \"SOS\"")
  (displayln "  racket cli.rkt sort quick 5 2 8 1 9")
  (displayln "  racket cli.rkt calc add 1 2 3 4 5"))

(define (parse-numbers args)
  (map string->number args))

(define (run-command args)
  (match args
    [(list) (print-help)]
    [(list "help") (print-help)]
    [(list "--help") (print-help)]
    [(list "-h") (print-help)]
    
    ;; Factorial
    [(list "factorial" n)
     (define num (string->number n))
     (if num
         (displayln (factorial num))
         (displayln "Error: Invalid number"))]
    
    ;; Prime check
    [(list "prime?" n)
     (define num (string->number n))
     (if num
         (displayln (if (prime? num) "true" "false"))
         (displayln "Error: Invalid number"))]
    
    ;; GCD
    [(list "gcd" a b)
     (define na (string->number a))
     (define nb (string->number b))
     (if (and na nb)
         (displayln (gcd na nb))
         (displayln "Error: Invalid numbers"))]
    
    ;; LCM
    [(list "lcm" a b)
     (define na (string->number a))
     (define nb (string->number b))
     (if (and na nb)
         (displayln (lcm na nb))
         (displayln "Error: Invalid numbers"))]
    
    ;; Morse code
    [(list "morse" "encode" text)
     (displayln (encode-to-morse text))]
    
    [(list "morse" "decode" morse)
     (displayln (decode-from-morse morse))]
    
    ;; Sorting
    [(list* "sort" algorithm nums)
     (define numbers (parse-numbers nums))
     (if (andmap number? numbers)
         (let ([sorted (case algorithm
                         [("bubble") (bubble-sort numbers <)]
                         [("insertion") (insertion-sort numbers)]
                         [("quick") (quick-sort numbers <)]
                         [("selection") (selection-sort numbers)]
                         [else #f])])
           (if sorted
               (displayln (string-join (map ~a sorted) " "))
               (displayln "Error: Unknown algorithm. Use: bubble, insertion, quick, selection")))
         (displayln "Error: Invalid numbers"))]
    
    ;; Square
    [(list "square" n)
     (define num (string->number n))
     (if num
         (displayln (square num))
         (displayln "Error: Invalid number"))]
    
    ;; Cube
    [(list "cube" n)
     (define num (string->number n))
     (if num
         (displayln (cube num))
         (displayln "Error: Invalid number"))]

    ;; Calculator: variadic add/sub/mul/div
    [(list* "calc" op nums)
     (define numbers (parse-numbers nums))
     (cond
       [(not (andmap number? numbers))
        (displayln "Error: Invalid numbers")]
       [else
        (with-handlers ([exn:fail? (lambda (e) (displayln (~a "Error: " (exn-message e))))])
          (define result
            (case op
              [("add") (apply add numbers)]
              [("sub") (apply subtract numbers)]
              [("mul") (apply multiply numbers)]
              [("div") (apply divide numbers)]
              [("mod") (match numbers
                         [(list a b) (modulus a b)]
                         [_ (error 'calc "mod requires exactly two integers")])]
              [("pow") (match numbers
                         [(list b n) (power-of b n)]
                         [_ (error 'calc "pow requires base and integer exponent")])]
              [else (error 'calc "unknown op: ~a (use add|sub|mul|div|mod|pow)" op)]))
          (displayln result))])]

    ;; Unknown command
    [else
     (displayln (~a "Unknown command: " (car args)))
     (displayln "Run 'racket cli.rkt help' for usage information")]))

;; Main entry point
(module+ main
  (run-command (vector->list (current-command-line-arguments))))
