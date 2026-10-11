;; 01-draw-line: LINE through command with 2D point lists
(setvar "OSMODE" 0) ; running object snaps would move command points
(defun c:draw-line ()
  (command "_.LINE" (list 0 0) (list 100 50) "")
)
(c:draw-line)
