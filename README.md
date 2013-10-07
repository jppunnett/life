life
====

Conway's Game of Life in Ruby.

I want explore the benefits of OO programming. I'll implement the game of
life using a non-object-oriented approach and then attempt to make changes
to the program while observing how easy or difficult it is.

life.rb is the non-OO version of the program and lifeoo.rb is the OO version.

Already, I see the following changes:

1. How to specify the seed value. To specify the seed, you have to change
the code. Ugh. It would be great if we could specify the seed in a TXT file
and pass it as input to life.

2. Output to GIF format. life.rb outputs each generation to the console.
Outputting to a GIF would allow us to better see the cell changes.
