;; 16-polar-pentagram: polar and pi building a pentagram
(setvar "OSMODE" 0) ; running object snaps would move command points
(setq c '(0.0 0.0) i 0 step (/ (* 2 pi) 5))
(repeat 5
  (command "_.LINE" (polar c (* i step) 10.0) (polar c (* (+ i 2) step) 10.0) "")
  (setq i (1+ i))
)
