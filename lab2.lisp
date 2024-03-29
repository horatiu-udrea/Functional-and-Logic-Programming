;9. Convert a tree of type (1) to type (2).
;l: list -> dotted pair (list, list)
(DEFUN changeType (l)
  (COND
    ((NULL l) nil)
    ((= (CADR l) 0)
      (CONS (LIST (CAR l)) (CDDR l))
    )
    ((= (CADR l) 1)
      (LET ((res (changeType (CDDR l))))
        (CONS (LIST (CAR l) (CAR res)) (CDR res))
      )
    )
    (t
      (LET ((res (changeType (CDDR l))))
        (LET ((rres (changeType (CDR res))))
          (CONS (LIST (CAR l) (CAR res) (CAR rres)) (CDR rres))
        )
      )
    )
  )
)
;l: list -> list
(DEFUN changeTypeWrapper (l)
  (CAR (changeType l))
)

(write (changeTypeWrapper '(A 2 B 0 C 2 D 0 E 1 F 1 G 2 R 0 M 0)))