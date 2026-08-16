#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(require rackunit
         rackunit/text-ui
         "../../src/data-structures/string/alphabets.rkt"
         "../../src/data-structures/string/reverse-string.rkt"
         "../../src/data-structures/string/string-find.rkt"
         "../../src/data-structures/string/string-hash.rkt"
         "../../src/data-structures/string/string-index.rkt"
         "../../src/data-structures/string/string-join-custom.rkt"
         "../../src/data-structures/string/string-split.rkt"
         "../../src/data-structures/string/upper-case-and-lower-case.rkt")

(define string-tests
  (test-suite
   "String operations"

   (test-suite
    "alphabets - valid"
    (test-case "first is a" (check-equal? (first-en-alphabet) 'a))
    (test-case "last is z" (check-equal? (last-en-alphabet) 'z))
    (test-case "26 alphabets" (check-equal? (en-alphabets-length) 26))
    (test-case "en-vowel? hit" (check-true (en-vowel? 'a)))
    (test-case "en-vowel? miss" (check-false (en-vowel? 'b)))
    (test-case "en-consonent? hit" (check-true (en-consonent? 'b)))
    (test-case "en-consonent? miss" (check-false (en-consonent? 'a)))
    (test-case "word? string" (check-true (word? "hi")))
    (test-case "word? list is not a word" (check-false (word? '(a b))))
    (test-case "sentence? proper list of words"
      (check-true (sentence? '(hello 1 "there"))))
    (test-case "sentence? non-list is not a sentence"
      (check-false (sentence? "hi"))))

   (test-suite
    "alphabets - edge"
    (test-case "en-vowel? on non-alphabet symbol" (check-false (en-vowel? 'x9))))

   (test-suite
    "reverse-words / reverse-chars-in-str - valid"
    (test-case "reverse-words swaps word order"
      (check-equal? (reverse-words "hello world") "world hello"))
    (test-case "reverse-chars-in-str reverses chars"
      (check-equal? (reverse-chars-in-str "abc") "cba")))

   (test-suite
    "reverse-words / reverse-chars-in-str - edge"
    (test-case "empty string" (check-equal? (reverse-chars-in-str "") ""))
    (test-case "single char" (check-equal? (reverse-chars-in-str "x") "x")))

   (test-suite
    "string-find (KMP) - valid"
    (test-case "finds pattern at 0"
      (check-equal? (string-find "he" "hello") 0))
    (test-case "finds pattern in middle"
      (check-equal? (string-find "llo" "hello") 2)))

   (test-suite
    "string-find (KMP) - edge"
    (test-case "missing pattern returns #f"
      (check-equal? (string-find "zz" "hello") #f))
    (test-case "starting offset skips earlier match"
      (check-equal? (string-find "l" "hello" 3) 3)))

   (test-suite
    "string-hash-custom - valid"
    (test-case "empty string hashes to 0"
      (check-equal? (string-hash-custom "") 0))
    (test-case "deterministic same input"
      (check-equal? (string-hash-custom "abc") (string-hash-custom "abc"))))

   (test-suite
    "string-hash-custom - edge"
    (test-case "different inputs hash differently"
      (check-not-equal? (string-hash-custom "abc") (string-hash-custom "abd"))))

   (test-suite
    "string-index-of-char - valid"
    (test-case "first occurrence"
      (check-equal? (string-index-of-char #\l "hello") 2)))

   (test-suite
    "string-index-of-char - edge"
    (test-case "absent char returns #f"
      (check-equal? (string-index-of-char #\z "hello") #f))
    (test-case "empty string returns #f"
      (check-equal? (string-index-of-char #\a "") #f)))

   (test-suite
    "string-join-custom - valid"
    (test-case "joins with comma"
      (check-equal? (string-join-custom #\, '("a" "b" "c")) "a,b,c"))
    (test-case "single element"
      (check-equal? (string-join-custom #\, '("only")) "only")))

   (test-suite
    "string-join-custom - edge"
    (test-case "empty list is empty string"
      (check-equal? (string-join-custom #\, '()) "")))

   (test-suite
    "string-split-custom - valid"
    (test-case "splits by comma"
      (check-equal? (string-split-custom #\, "a,b,c") '("a" "b" "c"))))

   (test-suite
    "string-split-custom - edge"
    (test-case "no separator present"
      (check-equal? (string-split-custom #\, "abc") '("abc")))
    (test-case "trailing separator drops trailing empty"
      (check-equal? (string-split-custom #\, "a,b,") '("a" "b"))))

   (test-suite
    "string-downcase-custom / string-upcase-custom - valid"
    (test-case "downcase" (check-equal? (string-downcase-custom "ABC") "abc"))
    (test-case "upcase" (check-equal? (string-upcase-custom "abc") "ABC")))

   (test-suite
    "string-downcase-custom / string-upcase-custom - edge"
    (test-case "empty" (check-equal? (string-downcase-custom "") ""))
    (test-case "digits pass through" (check-equal? (string-upcase-custom "12x") "12X")))))

(run-tests string-tests)
