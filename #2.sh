
#definition of my_function
 function ma_fonction {
    ls /sys
    ls /proc
 }

# function call
 ma_fonction | grep cpu

 # A function works much like a basic command or a subscript. We can pass parameters ($ 1 / $ 2) to it, it has a return value with the return keyword instead of the exit. We can even use with it the pipe redirects understood as we see in the example In short the only difference between a function and a script or an external command is that there is no creation of the new process
# Now what is less known is that a function in Bash is actually a special case of a larger concept, that of a block of code. It is thus possible to create functions which do not have a name within a script. Thus the preceding code can be written as follows:

{
     ls /sys
     ls /proc
} | grep cpu

# Another practical example, of using a block to condition the execution of a series of commands to the good progress of a first command:

command1 && {
   sous-commande1
   sous-commande2
   ...
}

# In short, a block is an anonymous function, which is executed immediately, which cannot have a parameter passage ($ 1, $ 2 ...) and cannot return a return code (return). Everything else is possible. Now since a function is a block, logic tells us that if it is possible to put a block in a function, it must also be possible to place a function in another function:

function testa {
      function testb {
       echo "I'm in testb"
      }
   echo "I'm in testa"
    testb
}
testa

# And indeed that works very well, as well as putting a function in an anonymous block ... Now one can wonder what are the rules of visibility on the functions. Can two functions in two separate block be called? The answer to this question requires a little manipulation:
function test2 {
  echo "I'm in test2"
}
set | grep test2

# If we run this script:


gaston./test?sh
test2 ()
echo "I'm in test2"

# So a function is nothing more than a variable. Suddenly, the answer to our question lies in the visibility rules associated with them.


#To finish on the blocks of code, know that EVERYTHING is only a block of code. And a single command is a block whose braces have been made optional. Thus the following two syntax are equivalent:

echo -e "coucou\nhi\n" | grep "coucou"


# is equivalent to

{
  echo -e "coucou\nhi\n"
} | {
  grep "coucou"
}