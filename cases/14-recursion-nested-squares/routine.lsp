;; 14-recursion-nested-squares: Recursive defun drawing nested squares
(setvar "OSMODE" 0) ; running object snaps would move command points
(defun nest (c s n)
  (if (> n 0)
    (progn
      (command "_.RECTANG"
               (list (- (car c) s) (- (cadr c) s))
               (list (+ (car c) s) (+ (cadr c) s)))
      (nest c (/ s 2.0) (1- n))
    )
  )
)
(nest '(0 0) 8.0 3)
