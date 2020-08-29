# runlines
This package provides a convenient way run R code from inside the console.  
Either line or section arguments are excepted in the first two arguments.  
A section is defined by RStudio standards: "Any comment line which includes at least four trailing dashes (-), equal signs (=), or pound signs (#) automatically creates a code section."

Explicitly state the R-script with r(file = "analysis.R"), by default the first file ending with .R (or .r) is taken as the file argument.

##Examples:  
r() runs the entire script  
r(5) runs the entire script beginning with line 5  
r(5, 10) runs the lines 5-10  
r(-5) runs the last 5 lines of the script  
r(-5, 20) runs the lines 15-20  
r("Data Cleaning", 10) runs the first 10 lines in the section named "Data Cleaning" 

o() runs only the header, i.e. everything up to the first section  
o(20) runs only line 20  
o("Analysis") runs only the Analysis section  

s() runs the last section  
s(4) runs the 4th section  
s(2, 5) runs the sections 2-5 (excluding 5)  

ps() prints number of lines and the available sections and does not accept any arguments  