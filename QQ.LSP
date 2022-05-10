(defun C:Q()
(setq OBJECT (car (entsel)))
(setq ENTITY (cdr (assoc '0 (entget OBJECT))))
(if (eq ENTITY "REGION")
	(progn

	(ep OBJECT)

	(setq OBJECT  (entlast))
	(setq ENTITY (cdr (assoc '0 (entget OBJECT))))
	(setq THICKNESS (cdr (assoc '62 (entget OBJECT))))
	(command ".PEDIT" OBJECT "" "j" "all" "" "")
	(command ".CHPROP" "last" "" "thickness" THICKNESS "")
	)

	(progn

	(if (or (eq ENTITY "LWPOLYLINE")  (eq ENTITY "POLYLINE"))

	(progn
	(command ".PEDIT" OBJECT "j" "all" "" ""))

	(progn
	(command ".PEDIT" OBJECT "Y" "j" "all" "" ""))
	)
	))




)
