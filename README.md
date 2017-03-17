Common Programming Interview Questions
-------------------------------------------
This repo serves to provide solutions to interview questions that are often encountered during technical interviews. I've taken some from Facebook and other large companies - some are questions that I designed myself. 

The code seen here is meant to be accompanied by articles that can be found on my technical blog. You can find the start of the series by clicking [here](http://karansatia.com/blog-1/2017/2/28/interview-question-practice-series-pt-1).

The reasoning behind this was initially just to practice some algorithmic challenges. However, after trying to compare some of my solutions to what I found through research, I realized that plenty of these questions don't have any good answers online. The code that can be found is fragmented, untested and often doesn't follow the question to the letter. For example, if a question requires that the answer use constant space, every code solution will completely ignore that (critical) piece of instruction.

Question List
-------------------------------------------

1. **Facebook FE Interview** Given a multi-dimensional array, write a function to flatten it without high-order functions.
2. **Facebook iOS Interview** Recursively and iteratively pairwise swap linked list nodes. If the number of nodes is odd, leave the last node alone. If you start with `var testList = 2->5->9->15->5` your output should be `5->2->15->9->5`. 
3. **I made this up** Write an alorithm to initialize a linked list from an array that has been passed in. Write it as a function in a class extension or an init method. The array might be multi-dimensional. This is meant to test your knowledge of writing extensions / convenience and designated initializers.
4. **Hearst iOS Engineer Interview** I was given this in a later interview round with Hearst. Given an array and a "sum" integer, write a function to determine whether two values exist in the array that can add up to the sum. *Pay attention to performance*.
5. **I made this up** Design an LRU (pseudocode) cache in Swift. See solution here.
