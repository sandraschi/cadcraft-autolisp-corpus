;; 07-ssget-count: ssget X and sslength on a known drawing, result printed with rtos
(setvar "OSMODE" 0) ; running object snaps would move command points
(command "_.LINE" (list 0 0) (list 10 0) "")
(command "_.LINE" (list 0 5) (list 10 5) "")
(command "_.CIRCLE" (list 5 2.5) 1)
(defun c:count-entities (/ ss n)
  (setq ss (ssget "_X"))
  (if ss
    (progn
      (setq n (sslength ss))
      (princ (strcat "\nTotal entities: " (rtos n 2 0)))
    )
    (princ "\nNo entities found.")
  )
  (princ)
)
(c:count-entities)
