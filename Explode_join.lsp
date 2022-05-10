(defun c:xq ()
(princ "n[Change 3D Polyline to Polyline.]")


(setq index 0)
(setq e(ssget))
(setq sayac (sslength e))
( repeat sayac


(setq en (ssname e index)
cl (if(=(cdr(assoc 70(entget en)))1)1) ; closed flag 1=yes
p1 (cdr(assoc 10(entget(entnext en))))
p2 (cdr(assoc 10(entget(entnext(entnext en)))))
)
(command "ucs" "3" p1 p2 "")
(setq fp (trans p1 0 1)) ; save first point

(setvar "blipmode" 0)
(command "pline")
(command fp) ; id first vertex
(while (/=(cdr(assoc 0(setq eg(entget(setq en(entnext en))))))"SEQEND")
(setq pt (trans(cdr(assoc 10 eg))0 1))
(if pt (command pt))
(if (and (not pt) cl)(command fp))
);endwhile
(command "")
(command "ucs" "w")
(setvar "blipmode" 1)

(setq index(+ index 1))
)
(princ)
);end C:xq