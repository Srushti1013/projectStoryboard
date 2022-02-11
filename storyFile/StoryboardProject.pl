% Simple Story Board Project - Who Killed Steve?

% Programing language - Prolog

% Tool - SWIProlog
                             

% BN description:

% Story world name: Who killed Steve (Minecraft)?

% M1: Chicken tired of watching its family get cooked for food

% M2: Skeleton bored and wanted drama

% A1: Chicken pecked Steve

% A2: Skeleton always shoots arrows for amusement

% O1: Chicken is always hungry

% O2: Lots of seeds dropped near cliff

% O3: Steve despawn remains below cliff (crime scene)

% O4: Used arrows found near the cliff

% O5: Skeleton chased steve endlessly
                             
                             

:- dynamic p/2.
:- dynamic p/3.
                             
                             
% Operator definitions needed for forward chaining if-then rules.
:- op(800,fx,if).
:- op(700,xfx,then).
:- op(300,xfy,or).
:- op(200,xfy,and).

% Defining BN graph:

parent(chicken, hungry_S). % M1: Chicken tired of watching its family get cooked for food, O1: Chicken is always hungry

parent(chicken, peck_S).   % M1:Chicken tired of watching its family get cooked for food, A1: Chicken pecked Steve

parent(skeleton, shoot_S). % M2:Skeleton bored and wanted drama, A2: Skeleton always shoots arrows for amusement

parent(skeleton, chase_S). % M2:Skeleton always shoots arrows for amusement, O5: Skeleton chased steve endlessly

parent(peck_S, seeds_L).   % A1:Chicken pecked Steve, O2: Lots of seeds dropped near cliff

parent(peck_S, despawn_S). % A1:Chicken pecked Steve, O3: Steve despawn remains below cliff (crime scene)

parent(shoot_S, despawn_S).% A2:Skeleton always shoots arrows for amusement, O3: Steve despawn remains below cliff (crime scene)

parent(shoot_S, arrow_C).  % A2:Skeleton always shoots arrows for amusement, O4: Used arrows found near the cliff


% Prior probabilities:

p(chicken, 0.5).
p(skeleton, 0.5).

% BN conditional probability tables:

p(hungry_S,chicken,0.8).
p(hungry_S,not(chicken),0.1).

p(peck_S,chicken,0.9).
p(peck_S,not(chicken),0.05).

p(seeds_L,peck_S,0.9).
p(seeds_L,not(peck_S),0.1).

p(chase_S,skeleton,0.8).
p(chase_S,not(skeleton),0.1).

p(shoot_S,skeleton,0.9).
p(shoot_S,not(skeleton),0.05).

p(arrow_C,shoot_S,0.9).
p(arrow_C,not(shoot_S),0.1).


p(despawn_S,[peck_S,chase_S], 0.5).
p(despawn_S,[not(peck_S),chase_S],0.7).
p(despawn_S,[peck_S,not(chase_S)],0.9).
p(despawn_S,[not(peck_S),not(chase_S)],0.01).

% Defining FC rules.

% IF CHICKEN IS THE KILLER (has higher probability then):
% input: yes, yes, yes
if chicken and just and happy_ending and forgiveness then 'Steve Respawns'.
if 'Steve Respawns' then 'Steve feeds his chicken'.
if 'Steve feeds his chicken' then 'Chicken is happy'.
if 'Chicken is happy' then 'Chicken does not plan any more murders :)'.

% input: no, no, no
if chicken and unjust and bad_ending and punishment then 'steve respawns angry'.
if 'steve respawns angry' then 'searches for the chicken'.
if 'searches for the chicken' then 'captures the chicken'.
if 'captures the chicken' then 'cooks the chicken'.

% input: yes, no, yes
if chicken and just and bad_ending and forgiveness then 'steve respawns sad'.
if 'steve respawns sad' then 'forgives the chicken'.
if 'forgives the chicken' then 'steve moves to new location'.
if 'steve moves to new location' then 'chicken has no food or home'.

% input: yes, yes, no
if chicken and just and happy_ending and punishment then 'Steve Respawns upset'.
if  'Steve Respawns upset' then 'Does not forgive'.
if 'Does not forgive' then 'chases chicken out of there'.
if 'chases chicken out of there' then 'lives in peace'.

% input: no, yes, yes
if chicken and unjust and happy_ending and forgiveness then 'Steve Respawn'.
if  'Steve Respawn' then 'Steve forgive chicken'.
if 'Steve forgive chicken' then 'Chicken makes steve a friend'.
if 'Chicken makes steve a friend' then 'lives together in peace'.

% input: no, yes, no
if chicken and unjust and happy_ending and punishment then 'Steve Respawn upset again '.
if  'Steve Respawn upset again ' then 'Chicken made a chicken army'.
if 'Chicken made a chicken army' then 'Steve surrenders to chicken'.
if 'Steve surrenders to chicken' then 'Chicken makes steve to farm for endless amount of seeds'.
if 'Chicken makes steve to farm for endless amount of seeds' then 'Steve does not forgive but happy to not despawn'.
                             
% input: yes, no, no
if chicken and just and bad_ending and punishment then 'steve respawns confused'.
if 'steve respawns confused' then 'searches everywhere for chicken'.
if 'searches everywhere for chicken' then 'steve hunts day and night'.
if 'steve hunts day and night' then 'Steve and Chicken face off for a final battle'.
                             
% input: no, no, yes
if chicken and unjust and bad_ending and forgiveness then 'steve respawns dazed'.
if 'steve respawns dazed' then 'searches for chicken'.
if 'searches for chicken' then 'steve forgives the chicken'.
if 'steve forgives the chicken' then 'Steve hungry'.
if 'Steve hungry' then 'Steve eats the chicken to survive'.


% IF SKELETON IS THE KILLER (has higher probability then):
% input: yes, yes, yes
if skeleton and just and happy_ending and forgiveness then 'Steve Respawns at night'.
if 'Steve Respawns at night' then 'Steve looks for skeleton'.
if 'Steve looks for skeleton' then 'forgives skeleton'.
if 'forgives skeleton' then 'Steve joins Skeleton to chase and shoot other mobs :)'.
                             
% input: no, no, no
if skeleton and unjust and bad_ending and punishment then 'steve respawns furious'.
if 'steve respawns furious' then 'Steve crafts sheild and weapon'.
if 'Steve crafts sheild and weapon' then 'hunts all skeletons around the area'.
if 'hunts all skeletons around the area' then 'Feeds the killer skeleton bones to his dog'.
                             
% input: yes, no, yes
if skeleton and just and bad_ending and forgiveness then 'Steve respawns'.
if 'Steve respawns' then 'searches for skeleton'.
if 'searches for skeleton' then 'Tells Skeleton he forgives'.
if 'Tells Skeleton he forgives' then 'Skeleton shoots steve again for fun lol'.
                             
% input: yes, yes, no
if skeleton and just and happy_ending and punishment then 'Steve respawns upset'.
if  'Steve respawns upset' then 'Chases skeleton with his dog'.
if 'Chases skeleton with his dog' then 'Skeleton runs away'.
if 'Skeleton runs away' then 'Lives in peace for a while'.
                             
% input: no, yes, yes
if skeleton and unjust and happy_ending and forgiveness then 'Steve respawns confused'.
if  'Steve respawns confused' then 'Skeleton was never caught'.
if 'Skeleton was never caught' then 'Steve forgives the Skeleton'.
if 'Steve forgives the Skeleton' then 'Steve goes to prepare himself for the next fight'.
                             
% input: no, yes, no
if skeleton and unjust and happy_ending and punishment then 'Steve respawns determined'.
if  'Steve respawns determined' then 'Skeleton gets away'.
if 'Skeleton gets away' then 'Steve seeks revenge on Skeleton'.
if 'Steve seeks revenge on Skeleton' then 'Steve gets Skeleton and gives bones to dog'.
                             
% input: yes, no, no
if skeleton and just and bad_ending and punishment then 'Steve respawns ready and knows it was Skeleton'.
if  'Steve respawns ready and knows it was Skeleton' then 'Skeleton gets army of skeletons'.
if 'Skeleton gets army of skeletons' then 'Skeletons fire down steve'.
if 'Skeletons fire down steve' then 'Steve was outmatch and despawns again'.
                             
% input: no, no, yes
if skeleton and unjust and bad_ending and forgiveness then 'Steve respawn'.
if  'Steve respawn' then 'Skeleton got witch to cast night spell'.
if 'Skeleton got witch to cast night spell' then 'Skeleton hunts steve'.
if 'Skeleton hunts steve' then 'Steve was never able to leave the house again'.

% Calling story:
                             
story :- solve_mystery, finish_story, forward.

% Implementing solve_mystery which asks the user for the observations and then calls the BN using the prob predicate 

solve_mystery:- write('Answer these questions to solve the murder of Steve with y or n followed by %"."'),nl,
                write('Did you see an egg on the ground?  (y/n): '), read(X), processQ1(X, Q1), nl,
                write('Were seeds planted at Steves home? (y/n): '), read(Y),processQ2(Y,Q2), nl,
                write('Was it night time? (y/n): '),read(Z), processQ4(Z,Q4), nl,
                write('Did you see arrows in the area? (y/n): '),read(A), processQ5(A,Q5),


prob(chicken, [Q1, Q2, despawn_S, Q4, Q5], P1),
prob(skeleton, [Q1, Q2, despawn_S, Q4, Q5], P2),


write('The probability that the Chicken killed Steve is: '), write(P1), nl,
write('The probability that the Skeleton killed Steve is: '), write(P2), nl,
compare(P1,P2).

processQ1(y, Q1) :- Q1 = hungry_S.
processQ1(n, Q1) :- Q1 = not(hungry_S).

processQ2(y, Q2) :- Q2 = seeds_L.
processQ2(n, Q2) :- Q2 = not(seeds_L).

processQ4(y, Q4) :- Q4 = chase_S.
processQ4(n, Q4) :- Q4 = not(chase_S).

processQ5(y, Q5) :- Q5 = arrow_C.
processQ5(n, Q5) :- Q5 = not(arrow_C).

%if chicken has higher probability then assert fact chicken else assert fact skeleton.
compare(P1,P2) :- P1>P2, !, assert(fact(chicken)).
compare(P1,P2) :- assert(fact(skeleton)).

                             
% Implementing finish_story which asks 3 questions to get user preferences,
% then asserts the answers as facts. Then calls forward to start forward chaining.


finish_story :- write('Answer these questions about your story preferences with y or n followed by %"."'),nl,
                write('Do you think the murder was justified?  (y/n): '), read(X), assert_just(X),nl,
                write('Do you like happy endings? (y/n): '), read(Y), assert_end(Y),nl,
                write('Do you think Steve forgives? (y/n): '),read(Z), assert_forgive(Z).

assert_just(y):- !, assert(fact(just)).
assert_just(n):- !, assert(fact(unjust)).
assert_just(_) :- write('Invalid response'), nl, fail.

assert_end(y):-  !, assert(fact(happy_ending)).
assert_end(n):- !, assert(fact(bad_ending)).
assert_end(_) :- write('Invalid response'), nl, fail.

assert_forgive(y):-  !, assert(fact(forgiveness)).
assert_forgive(n):- !, assert(fact(punishment)).
assert_forgive(_) :- write('Invalid response'), nl, fail.
