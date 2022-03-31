// SPDX-License-Identifier: GPL-3.0
pragma solidity >= 0.7.0 < 0.9.0;

contract enumShirtColours {

    enum shirtColor {RED, WHITE, BLUE}  // Syntax. Create an 'enum' datatype called shirtColor
    shirtColor constant defaultChoice = shirtColor.BLUE; // Constant variable of type 'shirtColor' derived from the enum
    shirtColor choice;      // Variable of type 'shirtColor' derived from the enum

    function setWhite() public {
        choice = shirtColor.WHITE;
    }

    function getChoice() public view returns (shirtColor) {
        return choice;
    }

    function getDefaultChoice() public pure returns (shirtColor) {
        return defaultChoice;
    }

}

// Structs: Short for 'Structure'. A datatype that stores variables of different types.

contract ComedyStruct {

    struct movie {      // Stating the variables contained in the struct
        string movieTitle;
        string movieDirector;
        uint movieYear;
    }
    
    // The struct 'movie' essentially becomes a datatype so we can create a 'movie' variable
    // same way we create a uint or string variable
    movie comedyMovie;

    // Set static values for the movie struct
    function setMovie() public {
        comedyMovie = movie("Vivo", "Kirk DeMicco", 2021);
    }

    // Allow user enter the values for the movie struct
    function TypeInMovie(string memory title, string memory date, uint year) public {
        comedyMovie = movie(title, date, year);
    }

    function getMovieYear() public view returns(uint) {
        return comedyMovie.movieYear;
    } 

    function getMovieTitle() public view returns(string memory) {
        return comedyMovie.movieTitle;
    } 

}

