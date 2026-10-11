;; 08-layer-create: Create layers with colours through the command-line LAYER
(setvar "OSMODE" 0) ; running object snaps would move command points
(defun c:setup-layers ()
  (command "_.-LAYER" "_N" "Walls" "_C" "1" "Walls" "")
  (command "_.-LAYER" "_N" "Doors" "_C" "3" "Doors" "")
  (command "_.-LAYER" "_N" "Furniture" "_C" "5" "Furniture" "")
)
(c:setup-layers)
