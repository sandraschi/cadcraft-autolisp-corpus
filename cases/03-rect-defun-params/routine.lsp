;; 03-rect-defun-params: Plain defun with parameters calling RECTANG
(setvar "OSMODE" 0) ; running object snaps would move command points
(defun draw-rect (w h)
  (command "_.RECTANG" (list 0 0) (list w h))
)
(draw-rect 100 80)
