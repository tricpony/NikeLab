# README #

Read below some comments about what you will find in NikeLab.

### Language ###
The project was written in SwiftUI - my first.

### Quick Help ###
Quick help comments are included where appropriate.

### Page Control ###
The detail view controller of the flow supports page control swiping but does not display the page dots.  With so many they ran off the screen and really provided no added value.  Need better visual feedback.

### Table cells ###
Highlighted and selected cells are configured to behave according to HIG.

### Dependency Injection (DI) ###
My experience with DI includes a pod called Swinject.  Since pods were forbidden, short of implementing Swinject myself I was not sure how to handle this. I did provide init methods where appropriate,
and used protocols to de-couple.

### Unit Tests ###
Some unit tests have been included.
