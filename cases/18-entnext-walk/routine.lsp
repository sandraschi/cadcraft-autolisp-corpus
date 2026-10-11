;; 18-entnext-walk: Walk the database with entnext and count entity types
(setvar "OSMODE" 0) ; running object snaps would move command points
(command "_.LINE" '(0 0) '(10 0) "")
(command "_.LINE" '(0 2) '(10 2) "")
(command "_.CIRCLE" '(5 5) 1)
(setq e (entnext) nl 0 nc 0)
(while e
  (setq ty (cdr (assoc 0 (entget e))))
  (cond ((= ty "LINE") (setq nl (1+ nl)))
        ((= ty "CIRCLE") (setq nc (1+ nc))))
  (setq e (entnext e))
)
(princ (strcat "LINE=" (itoa nl) " CIRCLE=" (itoa nc)))
(princ)
