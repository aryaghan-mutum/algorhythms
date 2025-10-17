#lang racket

(provide encode-to-morse decode-from-morse)

(require racket/string)

;; Complete Morse code encoder/decoder for Racket
;; - encode-to-morse implemented WITHOUT using map (uses recursion)
;; - decode-from-morse uses the reverse hash (morse -> char)
;; - punctuation, digits, letters and space included

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Morse code table: character -> morse (strings)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define morse-code-table
  (hash
   ;; Letters
   "A" ".-"    "B" "-..."  "C" "-.-."  "D" "-.."   "E" "."
   "F" "..-."  "G" "--."   "H" "...."  "I" ".."    "J" ".---"
   "K" "-.-"   "L" ".-.."  "M" "--"    "N" "-."    "O" "---"
   "P" ".--."  "Q" "--.-"  "R" ".-."   "S" "..."   "T" "-"
   "U" "..-"   "V" "...-"  "W" ".--"   "X" "-..-"  "Y" "-.--"
   "Z" "--.."
   ;; Digits
   "0" "-----" "1" ".----" "2" "..---" "3" "...--" "4" "....-"
   "5" "....." "6" "-...." "7" "--..." "8" "---.." "9" "----."
   ;; Punctuation
   "." ".-.-.-" "," "--..--" "?" "..--.." "'" ".----."
   "!" "-.-.--" "/" "-..-." "(" "-.--." ")" "-.--.-"
   "&" ".-..." ":" "---..." ";" "-.-.-." "=" "-...-"
   "+" ".-.-." "-" "-....-" "_" "..--.-" "\"" ".-..-."
   "$" "...-..-" "@" ".--.-."
   ;; Space (use "/" in Morse to represent a word-space)
   " " "/"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Reverse map: morse string -> character string
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define morse->char
  (for/hash ([k (in-hash-keys morse-code-table)])
    (values (hash-ref morse-code-table k) k)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; encode-to-morse : string -> string
;; encode WITHOUT using map (use recursion)
;; unknown characters are skipped
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (encode-char-to-morse ch)
  ;; ch is a single-character string
  (hash-ref morse-code-table (string-upcase ch) "")) ; returns "" if not found

;; Produce a space-separated Morse string.
;; We'll build a list of codes by recursion, then join with spaces.
(define (encode-to-morse input)
  (define (rec chars acc) ; acc is a list of codes in reverse order
    (cond
      [(null? chars) (string-join (reverse acc) " ")]
      [else
       (let* ([ch-str (string (car chars))]
              [code  (encode-char-to-morse ch-str)])
         (if (string=? code "")
             (rec (cdr chars) acc)          ; skip unknown char
             (rec (cdr chars) (cons code acc))))]))
  (rec (string->list input) '()))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; decode-from-morse : string -> string
;; Split on spaces; "/" represents a space in decoded text.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (decode-from-morse morse-str)
  (define codes (string-split morse-str " "))
  (define decoded-chars
    (map (lambda (code)
           (cond
             [(string=? code "/") " "]                    ; word separator
             [else (hash-ref morse->char code "")]))     ; "" for unknown codes
         codes))
  (string-join decoded-chars ""))
