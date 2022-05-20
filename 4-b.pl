% Blocks.
block(a).
block(b).
block(c).

% Places.
place(p).
place(q).
place(r).

% Locations.
location(B) :- block(B).
location(P) :- place(P).

% Start state.
start(a, b).
start(b, p).
start(c, r).

% Goal state.
goal(a, b).
goal(b, c).
goal(c, r).

% on <-> negon forms an even loop.
on(B, L, T) :-
    block(B),
    location(L),
    T #>= 0,
    not negon(B, L, T).
negon(B, L, T) :-
    block(B),
    location(L),
    T #>= 0,
    not on(B, L, T).

% move <-> negmove forms an even loop.
move(B, L, T) :-
    block(B),
    location(L),
    T #> 0,
    not negmove(B, L, T).
negmove(B, L, T) :-
    block(B),
    location(L),
    T #> 0,
    not move(B, L, T).

% Saves the current world at time T, with block B moved.
% Asserts the proper on(...) are in the answer set.
save_world(T, B) :-
    T1 #= T - 1,
    not -assert_previous_world(T, T1, B),
    not block_in_more_than_one_position(T).

-assert_previous_world(0, _, _) :-
    start(B, L),
    negon(B, L, 0).

-assert_previous_world(T, T1, B) :-
    T #> 0,
    block(B1),
    B1 \= B,
    on(B1, L, T1),
    negon(B1, L, T).

% Moves block B onto location L at time T.
make_move(B, L, T) :-
    move(B, L, T),
    on(B, L, T),
    not more_than_one_move(B, L, T).

% True if there is more than one move at time T.
more_than_one_move(B, L, T) :-
    block(B1),
    location(L1),
    B \= B1,
    move(B1, L1, T).
more_than_one_move(B, L, T) :-
    block(B1),
    location(L1),
    L \= L1,
    move(B1, L1, T).

% True if block is in more than one position at time T.
block_in_more_than_one_position(T) :-
    block(B),
    location(L),
    on(B, L, T),
    location(L1),
    L \= L1,
    on(B, L1, T).

% Solves the blocks world problem in time T.
blocks_world(T) :-
    save_world(0, none),
    blocks_world(0, T).

% Finished, no block out of place.
blocks_world(T, T) :-
    not block_out_of_place(T).
% Some block is out of place.
blocks_world(T, End) :-
    T1 #= T + 1,
    block_out_of_place(T),
    % Generate a valid move.
    generate_valid_move(B, L, T),
    % Make the move.
    make_move(B, L, T1),
    % Save the current world.
    save_world(T1, B),
    % Verify we have moved to a unique state.
    unique_state(T1),
    % Go to next state.
    blocks_world(T1, End).

% Block is out of place.
block_out_of_place(T) :-
    goal(B, L),
    not on(B, L, T).

% Generate a valid move, preferring immediate moves to the goal state.
generate_valid_move(B, L, T) :-
    goal(B, L),
    clear(B, T),
    clear(L, T).
generate_valid_move(B, L, T) :-
    block(B),
    location(L),
    B \= L,
    clear(B, T),
    clear(L, T).

% A location is clear if there is no block on top of it at time T.
clear(L, T) :-
    not block_on_top(L, T).

block_on_top(L, T) :-
    block(B),
    on(B, L, T).
    
unique_state(T) :-
    unique_state(0, T).

unique_state(T, T).
% A state is unique if there is some block on a different location at this time
% for every time before.
unique_state(T1, T) :-
    T1 #< T,
    different_location(T1, T),
    T2 #= T1 + 1,
    unique_state(T2, T).

different_location(T1, T2) :-
    block(B),
    on(B, L1, T1),
    on(B, L2, T2),
    L1 \= L2.

?- blocks_world(T).

#show move/3.