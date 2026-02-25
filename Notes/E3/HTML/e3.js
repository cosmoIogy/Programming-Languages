/*
NAME: Blair Bourque
EMAIL: bbb023@latech.edu
DATE: 2/25/26
COURSE: CSC 3303
QUARTER: Winter
ASSIGNMENT: E3: Conversion App

*/

// Add your code below here
 function metersToFeet() {
    var inputElement = document.getElementById("value");
    var resultElement = document.getElementById("result");

    var number = parseFloat(inputElement.value);

    if (isNaN(number)) {
        resultElement.textContent = "Error";
    } else {
        var converted = number * 3.28084;
        resultElement.textContent = converted + " feet";
    }
}

function feetToMeters() {
    var inputElement = document.getElementById("value");
    var resultElement = document.getElementById("result");

    var number = parseFloat(inputElement.value);

    if (isNaN(number)) {
        resultElement.textContent = "Error";
    } else {
        var converted = number / 3.28084;
        resultElement.textContent = converted + " meters";
    }
}