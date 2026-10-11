;; 10-entmod-layer: entget, assoc, subst and entmod to move an entity to another layer
(setvar "OSMODE" 0) ; running object snaps would move command points
(command "_.-LAYER" "_N" "WALLS" "")
(command "_.LINE" '(0 0) '(10 0) "")
(setq e (entlast)
      d (entget e))
(entmod (subst (cons 8 "WALLS") (assoc 8 d) d))
