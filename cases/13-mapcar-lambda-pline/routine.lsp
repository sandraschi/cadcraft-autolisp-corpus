;; 13-mapcar-lambda-pline: mapcar with lambda, foreach, and one PLINE fed across several command calls
(setvar "OSMODE" 0) ; running object snaps would move command points
(setq pts '((0 0) (10 0) (10 10) (0 10)))
(setq pts (mapcar '(lambda (p) (mapcar '+ p '(5 5))) pts))
(foreach p pts (command "_.POINT" p))
(command "_.PLINE")
(foreach p pts (command p))
(command "_C")
