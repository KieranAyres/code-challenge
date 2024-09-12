## Requirements

![alt text](documentation/image-1.png)

### Example registration number: CA 12 ABC 

## Area codes for licences

![alt text](documentation/image-2.png)

For Birmingham, can do something like this - %w[A B C].sample

For Swansea, can do something like this - ('A'...'K').sample (Or a regex in that area)

For Cardiff, can do something like this - ('L'...'Z').sample (Or a regex in that area)

Letters not allowed - %w[I, K, M, Y]

## Age Identifier

![alt text](documentation/image-3.png)

## Assumptions

- I can remove any reference to the make vin as they aren't used to define the registration numbers
- Nice to have - output a hash, with reg, make, and vin


You will need to author code which performs the following functions:

1.	For each vehicle in the dataset, generate a valid Vehicle Registration Number using the rules defined above.  
2.	Output the following information:
a.	Total number of registration numbers generated.
- In theory - this should be simple, load all reg numbers into an array and just do a .count on the array
b.	Total number of registration numbers generated per registration are
3.	Were there any vehicles where the Vehicle Registration Number could not be determined? If so, how many? 

