#lang racket

(provide encode-to-morse
         decode-from-morse)

(require racket/string)

;; Morse code table: character -> morse (strings)
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

;; Morse code reverse map: morse string -> character string
(define morse->char
  (for/hash ([k (in-hash-keys morse-code-table)])
    (values (hash-ref morse-code-table k) k)))

(define (string-empty? str)
  (= (string-length str) 0))

;; Encode a string to Morse code (space-separated)
(define (encode-to-morse input)
  (cond
    [(not input) (error "Input cannot be null")]
    [(string-empty? input) ""]
    [else
     (string-join
      (for/list ([c (string->list (string-upcase input))])
        (let ([morse (hash-ref morse-code-table (string c) #f)])
          (if morse
              morse
              (error (string-append "Unsupported character: " (string c))))))
      " ")]))

;; Decode a Morse code string to text
(define (decode-from-morse morse-str)
  (cond
    [(not morse-str) (error "Input cannot be null")]
    [(string-empty? morse-str) ""]
    [else
     (string-join
      (for/list ([code (string-split morse-str " ")])
        (let ([char (hash-ref morse->char code #f)])
          (if char
              char
              (error (string-append "Unsupported morse code: " code)))))
      "")]))
