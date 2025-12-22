;;; #lang racket

;;; ; Generate Pythagorean triplet`
;;; ;;; create pythagorean triplets procedure that takes limit as arg and it must return N number of pythagorean triplets
;;; ;;; do it in best, worst cases

;;; (define (pyth-triples-geenrator limit)
;;;   (for*/list ((x (in-range 1 limit))
;;;               (y (in-range x limit))
;;;               (z (in-range y limit))
;;;               #:when (= (+ (sqr x) (sqr y)) (sqr z)))
;;;   (list x y z)))

;;; (pyth-triples-geenrator 20)

;;; ;result: '((3 4 5) (5 12 13) (6 8 10) (8 15 17) (9 12 15))
