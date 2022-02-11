# Story World: Murder Mystery Interactive Story Chat

## Who killed Steve? - Minecraft Edition

### Basic Overview:
The primary goal of this project is to design and implement an interactive story telling system using Prolog, forward-chaining rules, and a Bayesian network (BN). 
The system recives four clues from the user to solve a mystery/crime using a Bayesian network model. 
The system then informs the user of the most likely solution and asserts it as a fact. 
This system asks the user three more questions about his preferences and assert them as facts as well.
In the end it uses the asserted facts and the Forward chain rules to narrate the story after the crime.

### Story Description:
Steve was mining stone near the cliff top when suddenly he was “pushed” off the cliff which caused him to lose all his inventory and despawn. 
A villager (You) was the one to witness this tragedy. 
The two suspects near this crime scene were a bored Skeleton archer and Steves’ ever-hungry adorable chicken.
It is up to you to decide who was the real killer! 
Who could be responsible for Steve's descent?  

Answer the questions asked by Dectective Pig honestly to determine who the culprit is!

### Bayesian Network Model:

<img width="729" alt="BNModel" src="https://user-images.githubusercontent.com/69876473/153525667-257b7bfe-555b-496e-a065-9f53270fe3c1.png">

M1: Chicken tired of watching its family get cooked for food: chicken

M2: Skeleton bored and wanted drama :skeleton

A1: Chicken pecked Steve: peck_S

A2: Skeleton always shoots arrows for amusement:shoot_S

O1: Chicken is always hungry:hungry_S

O2: Lots of seeds dropped near cliff:seed_L

O3: Steve despawn remains below cliff (crime scene):despawn_S

O4: Used arrows found near the cliff:arrow_C 

O5: Skeleton chased Steve endlessly: chase_S
