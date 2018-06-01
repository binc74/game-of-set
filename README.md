# Project 2
### Game of Set

### **Important*
* In this project, the Gosu gem is used for the graphics, so this gem needs to be installed to run this program
    * For Windows, install Gosu by typing this command ```gem install gosu```
    * For Linux, here are the commands to install the Gosu gem
    ```
    # Dependencies for both C++ and Ruby
    sudo apt-get install build-essential libsdl2-dev libsdl2-ttf-dev libpango1.0-dev \
                         libgl1-mesa-dev libopenal-dev libsndfile-dev libmpg123-dev \
                         libgmp-dev
    
    # To install Ruby itself - if you are using rvm or rbenv, please skip this step
    sudo apt-get install ruby-dev
    
    # If you are using a Ruby version manager (i.e. rvm or rbenv)
    gem install gosu
    # If you are using system Ruby, you will need "sudo" to install Ruby libraries (gems)
    sudo gem install gosu
    ```
* No input checking implemented, so the player should make sure they enter valid input

* Our way of determine the winner may be different (we use not only score but also player attempts, and if multiple 
player obtains the highest score and with same amount of attempt, this situation count as no winner)

### Running the Program
* To run the program run the following command: `ruby main.rb` or simply run the main.rb class
* Enter the number of players when asked
* Enter the names of the players
* Choose a difficulty (1-3)
* A new window will appear with the game
* Click on 3 cards to choose a set. Click a card again to deselect it
* A card is selected when it is lit up
* A message will appear on the bottom left of the screen informing the player if they have selected a set ot not
* Change players by clicking on the name of the desired player
* After the game is exited or ended a log will be printed in the terminal showing each set won by each player

### Functionality
* Hint - gives some kind of hint based on the difficulty selected

* Difficulty

    1 - Hint shows two cards from a set, and the initial dealers hand contains more than 4 sets of available sets
    
    2 - Hint shows one card from a set, and the initial dealers hand contains 3 to 4 sets of available sets
    
    3 - No hint, and the initial dealers hand contains 1 to 2 sets of available sets
   
* Timer - Counts the seconds gone by since the game started

* Sets Remain -  Shows the number of sets left

* Winner - Displays the current winner (the winner is the one with the highest score, and if multiple players have the 
same highest score, choose the one with least attempt. If multiple player have same highest score and attempts, this situation count as 
no winner)

* Last Set Found - Shows the last set found

* Restart - Restarts the game

* Game Log - Prints in terminal after game ends

* Multiple players - Up to 4 players

### Notes
* One of our members, Josh, had some important things to deal with. He was out of town in the second week, 
so he might not have been pushing often in the second week. But instead, he contributed a huge amount of work in the first week,
so work balance is fine

### Roles
* Overall Project Manager: Josh Wright
* Coding Manager: Bin Chen
* Testing Manager: Jeb Alawi
* Documentation: Houyi Fan

### Contributions
Please list who did what for each part of the project.
Also list if people worked together (pair programmed) on a particular section.

Bin Chen:
Research through the Gosu gems, build a naive MVC structure as the foundation of this project, and implement and test deck.rb

Josh Wright: Came up with the initial/primitive model designs including Card, Deck, Player, and Game. 
Implemented the Card class, a large portion of the Game class, some game_test methods, and some of the Deck class. 
Edited features: hint button, and winner display.

Jeb Alawi:
Implemented Last Set Found, Timer, selection of cards in GUI, Hint button, replacing cards from a set in GUI. test cases

Houyi Fan:
Added image for each card. Implemented Restart button, result message, difficulty, and the code to determine who is the current winner. 
