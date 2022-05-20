%*
    Problem 7
*%

%*
    You are given three complete lists of facts of the form
        course(math), course(graphs), ...
        student(john), student(mary), ...
        took(john, math), took(mary, graphs), ...

    Students can graduate only if they have taken all the courses in the first
    list. Write a program that, given the above information, determines
    which students can graduate.
    Make sure that, given the following sample knowledge base,
        student(john).
        student(mary).
        course(math).
        course(graphs).
        took(john, math).
        took(john, graphs).
        took(mary, graphs).
    
    your program is able to conclude
        can graduate(john).
        -can graduate(mary).
*%

% Knowledge base.
student(john).
student(mary).
course(math).
course(graphs).
took(john, math).
took(john, graphs).
took(mary, graphs).

% Took is a complete list.
-took(Student, Course) :-
    student(Student),
    course(Course),
    not took(Student, Course).

% A student cannot graduate if...
-can_graduate(Student) :-
    student(Student),
    % there is some course...
    course(Course),
    % that the student did not take.
    -took(Student, Course).

% A student can graduate if...
can_graduate(Student) :-
    student(Student),
    % we cannot prove the student cannot graduate.
    not -can_graduate(Student).

#show can_graduate/1.
#show -can_graduate/1.