%*
    Problem 9
*%

%*
    Using the notions of hierarchy and defaults as detailed in Section 5.4,
    write an ASP program to represent the following information. Be as
    general as you can.
        A Selmer Mark VI is a saxophone.
        Jake’s saxophone is a Selmer Mark VI.
        Mo’s saxophone is a Selmer Mark VI.
        Part of a saxophone is a high D key.
        Part of the high D key is a spring that makes it work.
        The spring is normally not broken.
        Mo’s spring for his high D key is broken.
    Make sure that your program correctly entails that Jake’s saxophone
    works while Mo’s is broken. For simplicity, assume that no one has
    more than one saxophone, and hence, saxophones can be identified by
    the name of their owner.
*%

% Classes.
class(saxophone).
class(selmer_mark_vi).

% Inheritance.
is_subclass(selmer_mark_vi, saxophone).

% Parts.
part(high_d_key).
part(high_d_key_spring).

% Objects.
object(jakes_saxophone).
object(mos_saxophone).

% Types.
is_a(jakes_saxophone, selmer_mark_vi).
is_a(mos_saxophone, selmer_mark_vi).

% Class membersip.
member(X, Class) :- is_a(X, Class).
member(X, Class) :- is_a(X, Sub), is_subclass(Sub, Class).

% Part relationships.
part_of(high_d_key, saxophone).
part_of(high_d_key_spring, high_d_key).
% Part is a part of X if...
part_of(Part, X) :-
    part(Part),
    % there is some larger part this part is a part of...
    part_of(Part, LargerPart),
    % and the larger part is a part of X.
    part_of(LargerPart, X).
% Part is a part of object X if...
part_of(Part, X) :-
    part(Part),
    object(X),
    % X is a member of a class...
    member(X, Class),
    % that Part is a part of.
    part_of(Part, Class).
% Part is a part of class X if...
part_of(Part, X) :-
    part(Part),
    % X is a subclass of a class...
    is_subclass(X, Class),
    % that Part is a part of.
    part_of(Part, Class).

% Part is broken on object X if...
broken(Part, X) :-
    object(X),
    % Part is a part of X...
    part_of(Part, X),
    % and there is some underlying part...
    part_of(UnderlyingPart, Part),
    % that is broken.
    broken(UnderlyingPart, X).

% Part is not broken on object X if...
-broken(Part, X) :-
    object(X),
    part(Part),
    % there is no proof any part is broken.
    not broken(Part, X).

% The high D key spring is not broken if...
-broken(high_d_key_spring, X) :-
    object(X),
    part_of(high_d_key_spring, X),
    % no abnormality can be proved.
    not ab(-broken(high_d_key_spring, X)).
% Abnormality with respect to -broken:
% Part is broken on X.
ab(-broken(Part, X)) :- broken(Part, X).

% X is broken if there is some part on X that is broken.
broken(X) :- object(X), part_of(Part, X), broken(Part, X).
% X is not broken if there is no proof X is broken.
-broken(X) :- object(X), not broken(X).

% X works if it is not broken.
works(X) :- object(X), not broken(X).
% X does not work if it cannot be proved to work.
-works(X) :- object(X), not works(X).

% Known broken parts.
broken(high_d_key_spring, mos_saxophone).

#show -broken/2.
#show broken/2.
#show broken/1.
#show works/1.