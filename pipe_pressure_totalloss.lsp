(defun c:tloss (/ viscos od pt q pd vl Re pr k f a b c d e h x1 y1 z1 x2 y2 z2)

(progn 
(setq viscos 1.044) 
(setq od (getreal "\nPipe Outer Diamater: "))
(setq pt (getreal "\nPipe Wall Thickness: "))
(setq q (getreal "\nFlow: "))
(setq pd (- od (* 2 pt)))
(setq vl (/ q 3600 0.786 (expt (* pd 0.001) 2)))
(setq Re (/ (* 1000 vl pd) viscos))
(setq pr 0.05)
(setq k (/ pr pd))

(defun log10 (num)
  (/ (log num) (log 10))
  )

(setq f (/ 1 (expt (* -1.8 (log10 (+ (/ 6.9 Re) (expt (/ k 3.7) 1.1)))) 2)))


(command "line")

(setq a (list  
(setq x1 (cadr (assoc 10 (entget (entlast)))))
(setq y1 (caddr (assoc 10 (entget (entlast)))))
(setq z1 (cdddr (assoc 10 (entget (entlast)))))))

(setq b (list  
(setq x2 (cadr (assoc 11 (entget (entlast)))))
(setq y2 (caddr (assoc 11 (entget (entlast)))))
(setq z2 (cdddr (assoc 11 (entget (entlast)))))))

(setq c (entlast))

(command-s "_circle" a "_d" (/ od 2))
(setq d (entlast))
(command-s "sweep" d "_mo" "_so" c)
(setq e (sqrt (+ (expt (- x1 x2) 2) (expt (- y1 y2) 2) (expt (- z1 z2) 2))))

(setq h (* f (/ e pd) (/ (expt vl 2) (* 2 9.81))))))


