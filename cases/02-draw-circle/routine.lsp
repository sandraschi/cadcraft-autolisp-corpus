;; 02-draw-circle: CIRCLE with centre and radius
(setvar "OSMODE" 0) ; running object snaps would move command points
(defun c:draw-circle ()
  (command "_.CIRCLE" (list 50 25) 20)
)
(c:draw-circle)
