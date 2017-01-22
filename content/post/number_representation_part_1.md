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

<img src="/images/2017/01/heh.png" alt="Heh" style="width:260px;"><center style="margin-top:-20px;"><small><i>In the ancient Egyptian hieroglyphic numeral system, the god <a href="https://en.wikipedia.org/wiki/Heh_(god)">Heh</a> symbolized one million.</i></small></center>

### Positional numeral systems

In our ordinary decimal system, known as the *Hindu-Arabic* notation, we write numbers as sequences, or strings, of *digits* &mdash; a digit being one of the symbols 0, 1, 2, 3, 4, 5, 6, 7, 8 or 9. The decimal numbers are said to have a numerical base (or *radix*) ten. We can think of the base as the size of the alphabet from where we choose these individual digits. By constructing strings of length $s$ using characters from this alphabet, we are then able to represent all integers in the interval $[0 .. 10^s-1]$. Conversely, any natural number can be decomposed into a [linear combination](http://mathworld.wolfram.com/LinearCombination.html) of integral powers of ten, multiplied by coefficients chosen in the range from zero to nine. For example, we can express the number 51,304 as the sum

$$ 
5 \cdot 10^4 + 1 \cdot 10^3 + 3 \cdot 10^2 + 0 \cdot 10^1 + 4 \cdot 10^0 = 51 304
$$

Numeral systems of this kind are called *positional*. Each digit is assigned a weight, based on its position in the sequence. Another property, shared by all the numeral systems we will consider here, is that they have a *uniform* base, i.e., the same base is used in all positions of the string. Let $d\_q \dots d\_2 d\_1 d\_0$ denote an arbitrary natural number $n$. In other words, $d\_i$ is the digit at position $i$ in the decimal string representation of $n$. Then 

$$ 
n = d\_q 10^q + \cdots + d\_2 10^2 + d\_1 10^1 + d\_0. 
$$ 

More generally, for any radix $b$ we can find coefficients $a\_0, a\_1, \dots, a\_q$, such that

$$
n = a\_q b^q + \cdots + a\_2 b^2 + a\_1 b^1 + a\_0 \text{ where } 0 \le a\_i < b \text{ for all $ i $, and $ a\_q \ne 0 $}.
$$

The length of this sequence is $q + 1$, for some integer $q \ge 0$.  To express $q$ in terms of $n$, first consider the real number $x$ such that $b^x = n.$ Then $x = \log\_b n,$ and $q$ is the largest integer less than or equal to $x$. This mapping is known as the *floor* function and we write $q = \lfloor\log_b n\rfloor$. Then, if 

$$
n = \\!\\!\\! \sum\_{i=0}^{\lfloor\log\_b n\rfloor} \\!\\!\\! a\_i b^i \; (0 \le a\_i < b)
$$

there is exactly one way in which we can choose these coefficients. 
