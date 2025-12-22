#lang racket

(require "math/combinatorics/factorial.rkt")
(require "encoding/morse-code.rkt")

(provide
  (all-from-out "math/combinatorics/factorial.rkt")
  (all-from-out "encoding/morse-code.rkt"))

;;TODO:
;;; > (string-append "foo" "bar" "baz")
;;; "foobarbaz"
;;; > (string-append "Age: " (number->string 25))
;;; "Age: 25"
;;; > (string-join '("foo" "bar" "baz") ",")
;;; "foo,bar,baz"

;;; (define (string-empty? str)
;;;   (= (string-length str) 0))
