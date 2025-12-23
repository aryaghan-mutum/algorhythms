#lang racket

;; Morse Code Encoding/Decoding Examples

(require algorhythms)

(displayln "=== Morse Code Examples ===\n")

;; Basic encoding
(displayln "--- Encoding Text to Morse ---")
(printf "'SOS' => ~a\n" (encode-to-morse "SOS"))
(printf "'HELLO' => ~a\n" (encode-to-morse "HELLO"))
(printf "'WORLD' => ~a\n" (encode-to-morse "WORLD"))
(printf "'RACKET' => ~a\n" (encode-to-morse "RACKET"))
(displayln "")

;; Morse alphabet reference
(displayln "--- Morse Code Alphabet ---")
(displayln "A: .-     B: -...   C: -.-.   D: -..")
(displayln "E: .      F: ..-.   G: --.    H: ....")
(displayln "I: ..     J: .---   K: -.-    L: .-..")
(displayln "M: --     N: -.     O: ---    P: .--.")
(displayln "Q: --.-   R: .-.    S: ...    T: -")
(displayln "U: ..-    V: ...-   W: .--    X: -..-")
(displayln "Y: -.--   Z: --..")
(displayln "")

;; Numbers
(displayln "--- Encoding Numbers ---")
(printf "'12345' => ~a\n" (encode-to-morse "12345"))
(printf "'67890' => ~a\n" (encode-to-morse "67890"))
(displayln "")

;; Complete message
(displayln "--- Complete Message ---")
(define message "HELLO WORLD")
(printf "Message: ~a\n" message)
(printf "Morse: ~a\n" (encode-to-morse message))
