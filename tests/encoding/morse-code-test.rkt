#lang racket

(require rackunit "../../dev/encoding/morse-code.rkt")

(define (test-encode)
  (check-equal? (encode-to-morse "A") ".-" "encode A")
  (check-equal? (encode-to-morse " ") "/" "encode space")
  (check-equal? (encode-to-morse "5") "....." "encode digit")
  (check-equal? (encode-to-morse "SOS") "... --- ..." "encode SOS")
  (check-equal? (encode-to-morse "A B") ".- / -..." "encode with space")
  (check-equal? (encode-to-morse "sos") "... --- ..." "encode lowercase")
  (check-equal? (encode-to-morse "") "" "encode empty")
  (check-equal? (encode-to-morse "  ") "/ /" "encode double space")
  (check-equal? (encode-to-morse "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
    ".- -... -.-. -.. . ..-. --. .... .. .--- -.- .-.. -- -. --- .--. --.- .-. ... - ..- ...- .-- -..- -.-- --.. ----- .---- ..--- ...-- ....- ..... -.... --... ---.. ----."
    "encode all chars")
  (check-exn exn:fail? (lambda () (encode-to-morse "#")) "encode unsupported")
  (check-equal? (encode-to-morse ".") ".-.-.-" "encode period")
  (check-equal? (encode-to-morse "Hello, world!") ".... . .-.. .-.. --- --..-- / .-- --- .-. .-.. -.. -.-.--" "encode punctuation"))

(define (test-decode)
  (check-equal? (decode-from-morse ".-") "A" "decode .-")
  (check-equal? (decode-from-morse "/") " " "decode /")
  (check-equal? (decode-from-morse ".....") "5" "decode digit")
  (check-equal? (decode-from-morse "... --- ...") "SOS" "decode SOS")
  (check-equal? (decode-from-morse ".- / -...") "A B" "decode with slash")
  (check-equal? (decode-from-morse "") "" "decode empty")
  (check-equal? (decode-from-morse "/ /") "  " "decode double slash")
  (check-equal? (decode-from-morse
    ".- -... -.-. -.. . ..-. --. .... .. .--- -.- .-.. -- -. --- .--. --.- .-. ... - ..- ...- .-- -..- -.-- --.. ----- .---- ..--- ...-- ....- ..... -.... --... ---.. ----.")
    "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    "decode all chars")
  (check-equal? (decode-from-morse ".-.-.-") "." "decode period")
  (check-equal? (decode-from-morse
    ".... . .-.. .-.. --- --..-- / .-- --- .-. .-.. -.. -.-.--")
    "HELLO, WORLD!" "decode punctuation")
  (check-exn exn:fail? (lambda () (decode-from-morse "......")) "decode unsupported"))

(define (test-roundtrip)
  (for ([w '("A" "SOS" "HELLO WORLD" "1234" " " "" "." "HELLO, WORLD!")])
    (check-equal? (decode-from-morse (encode-to-morse w)) (string-upcase w)
                  (string-append "roundtrip " w))))

;; Run all tests
(test-encode)
(test-decode)
(test-roundtrip)

(displayln "All morse-code encode/decode function-grouped tests finished.")
