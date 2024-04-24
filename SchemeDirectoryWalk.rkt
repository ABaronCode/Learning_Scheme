;Code for directory walk
(define (walkAndSum walkDirectory)
  ;cond(if did not work) find what type of type D or F
  (cond ((eq? (car walkDirectory) "D") (apply + (handleSubDirectory walkDirectory)));apply adds all values from the helper function
        ((eq? (car walkDirectory) "F") (caddr walkDirectory))));if file, gets size and returns the rest of the directory

;helper function
(define (handleSubDirectory walkDirectory)
  ;map gets remaining values of the subdirectory, with recursive call
  (map walkAndSum (caddr walkDirectory)))


;TEST CASES
;Skeleton tests provided by Professor Phipps(size is 14100)
(define disk `("D" "top"
        (("F" "file1.txt" 30)
         ("D" "sub1"
              (("F" "file1.txt" 1234)
               ("F" "file2.txt" 2345)
               ("F" "file3.txt" 3456)))
	 ("D" "sub2"
             (("F" "file1.txt" 1234)
              ("F" "file2.txt" 2345)
              ("F" "file3.txt" 3456))))))

;Custom Test Directories
;size is 3000
(define diskTwo `("D" "TopDirect"
                      (("D" "SubDirectOne" 
                           (("F" "file1.txt" 1000)
                            ("F" "file2.txt" 1000)
                            ("D" "SubSubDirectOne"
                                (("F" "file3.txt" 500)))
                            ("F" "file4.txt" 500))))))
;Test single file, size is 27
(define diskThree `("F" "File.txt" 27))
;Test single directoyt, size is 600
(define diskFour `("D" "LastDirectory"
                       (("F" "file1.txt" 275)
                        ("F" "file2.txt" 325))))


;Tests multiple sub directories in a sub directory, size is 29100
(define diskFive `("D" "top"
        (("F" "file1.txt" 30)
         ("D" "sub1"
              (("F" "file1.txt" 1234)
               ("F" "file2.txt" 2345)
               ("F" "file3.txt" 3456)))
	 ("D" "sub2"
             (("F" "file4.txt" 1234)
              ("F" "file5.txt" 2345)
              ("F" "file6.txt" 3456)))
         ("F" "file2.txt" 1000)
         ("D" "sub3"
              (("F" "file7.txt" 2000)
              ("F" "file8.txt" 3000)
              ("D" "sub4"
                    (("F" "file9.txt" 4000)
                     ("D" "sub5"
                           (("F" "file10" 5000))))))))))

;tests just directories, size 0
(define diskSix '("D" "top"
                       (("D" "directoryOne"
                        (("D" "directoryTwo"
                         (("D" "directoryThree"
                             (("D" "subDirectory" () ))))))))))

(walkAndSum disk)
(walkAndSum diskTwo)
(walkAndSum diskThree)
(walkAndSum diskFour)
(walkAndSum diskFive)
(walkAndSum diskSix)