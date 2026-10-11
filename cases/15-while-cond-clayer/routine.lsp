;; 15-while-cond-clayer: while loop with cond choosing the current layer per iteration
(setvar "OSMODE" 0) ; running object snaps would move command points
(command "_.-LAYER" "_N" "BIG" "")
(setq r 1.0)
(while (<= r 4.0)
  (setvar "CLAYER" (cond ((< r 2.5) "0") (T "BIG")))
  (command "_.CIRCLE" '(0 0) r)
  (setq r (+ r 1.0))
)
(setvar "CLAYER" "0")
