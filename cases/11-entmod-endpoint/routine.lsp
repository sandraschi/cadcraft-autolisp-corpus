;; 11-entmod-endpoint: entmod replacing a point group (group 11, line end point)
(setvar "OSMODE" 0) ; running object snaps would move command points
(command "_.LINE" '(0 0) '(10 0) "")
(setq d (entget (entlast)))
(entmod (subst (list 11 10.0 5.0 0.0) (assoc 11 d) d))
