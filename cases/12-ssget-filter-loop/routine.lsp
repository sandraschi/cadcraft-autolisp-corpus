;; 12-ssget-filter-loop: ssget X with a type filter, then ssname loop doubling every radius
(setvar "OSMODE" 0) ; running object snaps would move command points
(command "_.CIRCLE" '(0 0) 1)
(command "_.CIRCLE" '(10 0) 1)
(command "_.CIRCLE" '(20 0) 1)
(command "_.LINE" '(0 5) '(20 5) "")
(setq ss (ssget "_X" '((0 . "CIRCLE")))
      i 0)
(repeat (sslength ss)
  (setq d (entget (ssname ss i)))
  (entmod (subst (cons 40 (* 2.0 (cdr (assoc 40 d)))) (assoc 40 d) d))
  (setq i (1+ i))
)
