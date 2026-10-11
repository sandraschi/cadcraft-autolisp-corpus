;; 06-dimension-defun-args: Points passed as defun arguments into DIMLINEAR
(setvar "OSMODE" 0) ; running object snaps would move command points
(defun c:dim-walls (pt1 pt2 pt3)
  (command "_.DIMLINEAR" pt1 pt2 pt3)
)
(c:dim-walls (list 0 0) (list 5000 0) (list 2500 -500))
