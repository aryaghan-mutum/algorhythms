#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(require rackunit
         rackunit/text-ui
         "../../src/encoding/morse-code.rkt")

(define morse-code-tests
  (test-suite
   "Morse code encode/decode"

   (test-suite
    "encode-to-morse - valid"
    (test-case "single letter" (check-equal? (encode-to-morse "A") ".-"))
    (test-case "SOS" (check-equal? (encode-to-morse "SOS") "... --- ..."))
    (test-case "digit" (check-equal? (encode-to-morse "5") "....."))
    (test-case "lowercase is coerced upper"
      (check-equal? (encode-to-morse "sos") "... --- ..."))
    (test-case "space becomes /"
      (check-equal? (encode-to-morse "A B") ".- / -..."))
    (test-case "all letters and digits"
      (check-equal? (encode-to-morse "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
                    ".- -... -.-. -.. . ..-. --. .... .. .--- -.- .-.. -- -. --- .--. --.- .-. ... - ..- ...- .-- -..- -.-- --.. ----- .---- ..--- ...-- ....- ..... -.... --... ---.. ----."))
    (test-case "punctuation - period"
      (check-equal? (encode-to-morse ".") ".-.-.-"))
    (test-case "sentence with punctuation"
      (check-equal? (encode-to-morse "Hello, world!")
                    ".... . .-.. .-.. --- --..-- / .-- --- .-. .-.. -.. -.-.--")))

   (test-suite
    "encode-to-morse - edge"
    (test-case "empty string" (check-equal? (encode-to-morse "") ""))
    (test-case "single space becomes /" (check-equal? (encode-to-morse " ") "/"))
    (test-case "double space" (check-equal? (encode-to-morse "  ") "/ /")))

   (test-suite
    "encode-to-morse - invalid"
    (test-case "unsupported char raises"
      (check-exn exn:fail? (lambda () (encode-to-morse "#")))))

   (test-suite
    "decode-from-morse - valid"
    (test-case "single letter" (check-equal? (decode-from-morse ".-") "A"))
    (test-case "SOS" (check-equal? (decode-from-morse "... --- ...") "SOS"))
    (test-case "digit" (check-equal? (decode-from-morse ".....") "5"))
    (test-case "slash becomes space"
      (check-equal? (decode-from-morse ".- / -...") "A B"))
    (test-case "all letters and digits round-trip"
      (check-equal? (decode-from-morse ".- -... -.-. -.. . ..-. --. .... .. .--- -.- .-.. -- -. --- .--. --.- .-. ... - ..- ...- .-- -..- -.-- --.. ----- .---- ..--- ...-- ....- ..... -.... --... ---.. ----.")
                    "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"))
    (test-case "sentence with punctuation"
      (check-equal? (decode-from-morse ".... . .-.. .-.. --- --..-- / .-- --- .-. .-.. -.. -.-.--")
                    "HELLO, WORLD!")))

   (test-suite
    "decode-from-morse - edge"
    (test-case "empty string" (check-equal? (decode-from-morse "") ""))
    (test-case "double slash becomes double space"
      (check-equal? (decode-from-morse "/ /") "  ")))

   (test-suite
    "decode-from-morse - invalid"
    (test-case "unsupported morse token raises"
      (check-exn exn:fail? (lambda () (decode-from-morse "......")))))

   (test-suite
    "roundtrip - encode then decode restores upper-cased input"
    (for ([w (in-list '("A" "SOS" "HELLO WORLD" "1234" " " "" "." "HELLO, WORLD!"))])
      (test-case (string-append "roundtrip " w)
        (check-equal? (decode-from-morse (encode-to-morse w)) (string-upcase w)))))))

(run-tests morse-code-tests)
