#lang racket

(for ((i 5))
          (println i))     ;prints 1 to 5 numbers

(writeln "...")

(for ((i (list 1 2 3 4 5)))
      (println i))         ;prints 1 to 5 numbers

(writeln "...")

(for ((i '(1 2 3 4 5)))
      (println (* i i)))   ;squares the numbers

(writeln "...")

(for/list ((i (list 1 2 3 4 5)))
      (* i i))             ;'(1 4 9 16 25)

(for/hash ((i (list 1 2 3 4 5)))
  (values (number->string i)
          (* i i)))        ;'#hash(("1" . 1) ("3" . 9) ("2" . 4) ("5" . 25) ("4" . 16))