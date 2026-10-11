;; 17-entmake-text-strings: entmake TEXT whose string is built with strcat, itoa and rtos
(setvar "DIMZIN" 0) ; rtos honours DIMZIN; the metric template default would print 12.5
(setq n 3)
(entmake
  (list '(0 . "TEXT") '(8 . "0") '(10 0.0 0.0 0.0) '(40 . 2.5)
        (cons 1 (strcat "Rooms: " (itoa n) ", area " (rtos 12.5 2 2)))))
