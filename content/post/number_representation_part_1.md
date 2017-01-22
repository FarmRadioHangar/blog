+++
date     = "2017-01-22T13:37:00+02:00" draft    = true title    = "Number representation in digital electronics -- Part 1 (Numerical bases)"
slug     = "number-representation-in-digital-electronics-part-i"
tags     = ["number", "basis", "representation", "numeral", "binary", "decimal"]
image    = ""
comments = true
share    = true
menu     = ""
author   = "johannes"
+++

In this series of posts, we will look at the different ways that numbers are stored and processed in computers and other electronic devices, as well as some details of the specific data formats used to represent numeric values in computer memory. An important part of this is the binary numeral system, since we usually think of digital data as being in binary form. The binary and decimal systems both use a position-value notation, and this first post will focus on some of the common characteristics of this type of system, and how this allows numbers to be expressed in different bases.

### The role of numerals

Although we sometimes use the two terms interchangeably, numbers and numerals are different things. A *numeral* is a symbolic representation of a number.  Numbers are abstract concepts, and numerals are the names and symbols that denote them. *Numeral systems* (also called number systems) are formal methods and notation for expressing numbers in concrete form &mdash; that is, as numerals.  

<img src="/images/2017/01/heh-1.png" alt="Heh" style="width:260px;"><center style="margin-top:-20px;"><small><i>In the ancient Egyptian hieroglyphic numeral system, the god <a href="https://en.wikipedia.org/wiki/Heh_(god)">Heh</a> symbolized one million.</i></small></center>

### Positional numeral systems

In our ordinary decimal system, known as the *Hindu-Arabic* notation, we write numbers as sequences, or strings, of *digits* &mdash; a digit being one of the symbols 0, 1, 2, 3, 4, 5, 6, 7, 8 or 9. The decimal numbers are said to have a numerical base (or *radix*) ten. We can think of the base as the size of the alphabet from where we choose these individual digits. By constructing strings of length $s$ using characters from this alphabet, we are then able to represent all integers in the interval $[0 .. 10^s-1]$. Conversely, any natural number can be decomposed into a [linear combination](http://mathworld.wolfram.com/LinearCombination.html) of integral powers of ten, multiplied by coefficients chosen in the range from zero to nine. For example, we can express the number 51,304 as the sum

$$ 
5 \cdot 10^4 + 1 \cdot 10^3 + 3 \cdot 10^2 + 0 \cdot 10^1 + 4 \cdot 10^0 = 51 304
$$
