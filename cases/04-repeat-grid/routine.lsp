;; 04-repeat-grid: Nested repeat loops with a local variable list
(setvar "OSMODE" 0) ; running object snaps would move command points
(defun c:draw-grid (/ x y)
  (setq x 0)
  (repeat 5
    (setq y 0)
    (repeat 4
      (command "_.LINE" (list x y) (list (+ x 100) y) "")
      (command "_.LINE" (list x y) (list x (+ y 100)) "")
      (setq y (+ y 100))
    )
    (setq x (+ x 100))
  )
)
(c:draw-grid)
