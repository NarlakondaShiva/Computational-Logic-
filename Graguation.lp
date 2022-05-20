%Graduation Checking 

course(math).
course(graphs).
student(john). 
student(mary).
took(john,graphs).
took(john,math).
took(mary,graphs).
-took(Student,Course) :-student(Student), course(Course),not took(Student,Course).
#show cangraduate/1.
#show -cangraduate/1.
-cangraduate(Student) :- student(Student), -took(Student,Course).
cangraduate(Student) :-student(Student),not -cangraduate(Student).

