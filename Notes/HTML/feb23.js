// One line comments

/*
Multi-line comments
*/

/* 
The DOM stands for the Document Object Model, which means objects and methods already exist 
to access the element of an html page. The object variable for the html page is named "document"
*/

// Declare a variable to hold a reference to the h2 tag that contains the 0 digit 
let counterElement = document.getElementById("counter")

// Test to see if we can manipulate the text inside the h2 tag
// counterElement.innerText = "go eight"

// Create a variable that will dynamically change the display of the h2 tag as the button is pressed
let count = 0

// Write a function that is executed WITH EACH button click. It will update the count variable and display it
function incre() {
    count++
    counterElement.innerText = count 
}

function reset() {
    count = 0
    counterElement.innerText = count
}

function save() {
    let currentCount = 
}