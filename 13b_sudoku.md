### What are some important considerations when deciding how to design
### a new application or software development project?

I first need to figure out all of the features I want to implement
in the application. This will help give me an idea of what sort of
things might be repeated so that I can extract their functions and
properties to be shared.

I have to also take into account things that might change and build
these into the code. For example, in my Javascript game, I tried to
extract out the level information in terms of grass and street into the
game constants and variables file to make it easy to add in further levels.

Next, I would need to determine what sort of components I would need
in my program to implement the features I desire. In my Rails project,
I used React to render the front-end, so I had to determine what sorts
of components I would have in my front-end.


## Sudoku

How would you write a program to solve Sudoku? (high level description)

I could see two ways to do it.

1. recursion_solver function starts here.
This first one is an inefficient way. I would go square by square,
first by column across, then by row downwards. I will have a function that checks
what squares can go there by checking existing rows', columns', and grids' filled
squares including that square. I will create for every square an array of possible moves.

Then, I will go through each of these arrays, extracting the number from the array
one-by-one, plug that number into its position on a duped board, then run the
recursion_solver on the duped board, until the board is full.

If the board runs into an illegal state where I can't put in a next number and
it's not full, then return false. Else, if the board is full, return the board.
If true (board counts as true), stop and return the board. If false,
I will move onto the next square with a non-empty array. Again, it will return false
if it can't solve the board.

2. The second would be a variation of the above, but instead of going column
by column and row by row, I could start off by looking for the square with
the smallest number of available moves, then playing those moves, until an
illegal state was reached or the board was full. I would tweak it so that instead
of seeing if there were no possible moves left, I could stop it early when I
realized that at least one square had no possible moves left. 
