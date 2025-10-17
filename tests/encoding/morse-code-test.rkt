#lang racket

(require rackunit "../../dev/encoding/morse-code.rkt")

;; 1) encode a single letter
(check-equal? (encode-to-morse "A") ".-" "encode single letter A")

;; 2) encode a space -> should be slash "/"
(check-equal? (encode-to-morse " ") "/" "encode single space")

;; 3) decode a single morse code
(check-equal? (decode-from-morse ".-") "A" "decode .- to A")

;; 4) simple roundtrip: encode then decode
(check-equal? (decode-from-morse (encode-to-morse "SOS")) "SOS" "roundtrip SOS")

;; 5) empty string cases
(check-equal? (encode-to-morse "") "" "encode empty string")
(check-equal? (decode-from-morse "") "" "decode empty string")

(displayln "Simple morse-code tests finished.")
