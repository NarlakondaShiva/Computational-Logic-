% State and action represented by a common vector state(M,C,B), where M = number
% of missionaries on left side, C = number of cannibals on left side, B = boat
% position (1 = left, 0 = right).
% Goal state is always state(0,0,0).

% Possible actions.
generate_action(state(1,0,1)).
generate_action(state(2,0,1)).
generate_action(state(0,1,1)).
generate_action(state(0,2,1)).
generate_action(state(1,1,1)).

% state <-> negstate form an even loop.
state(state(M,C,B), T) :-
    not negstate(state(M,C,B), T).
negstate(state(M,C,B), T) :-
    not state(state(M,C,B), T).

% action <-> negaction form an even loop.
action(state(M,C,B), T) :-
    not negaction(state(M,C,B), T).
negaction(state(M,C,B), T) :-
    not action(state(M,C,B), T).

% Adds two states together.
add_states(
    state(AMs, ACs, ABoat),
    state(BMs, BCs, BBoat),
    state(CMs, CCs, CBoat)
) :-
        CMs #= AMs + BMs,
        CCs #= ACs + BCs,
        CBoat #= ABoat + BBoat.

% Takes the difference between two states.
sub_states(
    state(AMs, ACs, ABoat),
    state(BMs, BCs, BBoat),
    state(CMs, CCs, CBoat)
) :-
        CMs #= AMs - BMs,
        CCs #= ACs - BCs,
        CBoat #= ABoat - BBoat.

% Applies an action to the current state, depending on the boat position.
apply_action_to_state(0, State, Action, NextState) :-
    add_states(State, Action, NextState).
apply_action_to_state(1, State, Action, NextState) :-
    sub_states(State, Action, NextState).

% Validates that the given state is legal.
legal_state(M, C, state(MLeft, CLeft, _)) :-
    % Validate values.
    MLeft #>= 0,
    CLeft #>= 0,
    MLeft #=< M,
    CLeft #=< C,
    % Validate both sides.
    legal_left_side(MLeft, CLeft),
    legal_right_side(M, C, MLeft, CLeft).

legal_left_side(0, CLeft).
legal_left_side(MLeft, CLeft) :-
    MLeft #<> 0,
    MLeft #>= CLeft.

legal_right_side(M, C, MLeft, CLeft) :-
    MRight #= M - MLeft,
    MRight #= 0.
legal_right_side(M, C, MLeft, CLeft) :-
    MRight #= M - MLeft,
    MRight #<> 0,
    CRight #= C - CLeft,
    MRight #>= CRight.

% Validates the given state is unique.
unique_state(State, T) :-
    unique_state(State, 0, T).

unique_state(_, T, T).
unique_state(State, T1, T) :-
    T1 #< T,
    not state(State, T1),
    T2 #= T1 + 1,
    unique_state(State, T2, T).

% Only one state per time T.
:- state(state(M,C,B), T), M1 #<> M, C1 #>= 0, B1 #>= 0, state(state(M1,C1,B1), T).
:- state(state(M,C,B), T), C1 #<> C, B1 #>= 0, state(state(M,C1,B1), T).
:- state(state(M,C,B), T), B1 #<> B, state(state(M,C,B1), T).

% Only one action per time T.
:- action(state(M,C,B), T), M1 #<> M, C1 #>= 0, B1 #>= 0, action(state(M1,C1,B1), T).
:- action(state(M,C,B), T), C1 #<> C, B1 #>= 0, action(state(M,C1,B1), T).
:- action(state(M,C,B), T), B1 #<> B, action(state(M,C,B1), T).

% Solves the missionary cannibal problem.
missionary_cannibal(M, C, End) :-
    M #>= 0,
    C #>= 0,
    Initial = state(M,C,1),
    state(Initial, 0),
    missionary_cannibal_impl(M, C, Initial, 0, End).

% We are finished when we get to state(0,0,0).
missionary_cannibal_impl(_, _, state(0,0,0), End, End).
missionary_cannibal_impl(M, C, State, T, End) :-
    % Not in the goal state.
    State \= state(0,0,0),
    % Extract where the boat is.
    State = state(_,_,B),
    % Go to next time.
    T1 #= T + 1,
    % Generate an action.
    generate_action(Action),
    % Assert the action.
    action(Action, T1),
    % Apply the action to the current state, creating the next state.
    apply_action_to_state(B, State, Action, Next),
    % Check that the next state is legal.
    legal_state(M, C, Next),
    % Check that the next state is unique.
    unique_state(Next, T1),
    % Assert the state.
    state(Next, T1),
    % Keep going.
    missionary_cannibal_impl(M, C, Next, T1, End).

?- missionary_cannibal(3,3,End).

#show state/2, action/2.