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

### Counting the digits

In a program implementation &mdash; even though we could use the logarithm directly to find the number of characters needed to represent a number &mdash; a common approach is to simply divide the number by the radix, in a loop, until the quotient becomes zero. For example, in C:

    int num_digits (int n) {
        int i = 1;
        while ((n /= 10))
            ++i;
        return i;
    }

Note that this works for any base &mdash; not only ten. Simply add a second parameter for the base, e.g., `(int n, int base)` and change the while statement to `while ((n /= base))`. To also count the sign character for negative numbers, change the first line to `int i = (n < 0) ? 2 : 1;`.


### The basis representation theorem

The fact that every natural number is uniquely identified in the way we have just described, is established by a result in number theory known as the *basis representation theorem*. To prove this theorem, we first need the following lemma.

*Lemma 1.* The sum of a geometric series with $n - 1$ terms, common ratio $r$, and initial value one is $(r^n - 1)(r - 1)^{-1}$. In symbols;

$$ 
\forall r \in \mathbb{R} \; (r \ne 1), n \in \mathbb{N} : (r - 1)(1 + r + r^2 + \dots + r^{n - 1}) = r^n - 1.
$$ 

*Proof.* Let $S\_n = 1 + r + r^2 + \dots + r^{n - 1}$. Multiply by $r$ on both sides, so that

$$
  \begin{align}
    rS\_n &= r(1 + r + r^2 + \dots + r^{n - 1}) \\\
         &= r + r^2 + \dots + r^n.
  \end{align}
$$ 

Then, $rS\_n - S\_n = S\_n(r - 1) = (r + r^2 + \dots + r^n) - (1 + r + r^2 + \dots + r^{n - 1})$ and $S\_n = \frac{r^n - 1}{r - 1}$. We will now state the basis representation theorem in more formal terms.

*Theorem.* Given a base $b$, where $b$ is any integer greater than one, and a natural number $n$, there exist integers $d\_0, d\_1, \dots, d\_q \; (0 \le d\_i < b)$ 
such that $n = d\_q b^q + \cdots + d\_2 b^2 + d\_1 b^1 + d\_0$ and $d\_q \ne 0$. We call this the representation of $n$ in base $b$. Furthermore, this representation is unique.

*Proof.* The proof has two parts. We first have to show that a representation exists for every $n$, and subsequently that any such representation is unique.

#### Proof of existence

The argument is by induction on $n$ and the statement we would like to prove is the following:

$$
P(n) \equiv \forall b \in \mathbb{Z} \; (b > 1), \exists q \in \mathbb{Z} \; (q \ge 0), d\_0, d\_1, \dots, d\_q \in \mathbb{Z} \; (0 \le d_i < b) \; \text{s.t.} \\\ n = d\_q b^q + \cdots + d\_2 b^2 + d\_1 b^1 + d\_0 \; \text{and where} \; d\_q \ne 0. 
$$

*Base case:* For $n = 1$, set $q = 0$ and $d\_0 = n = 1$. Then, $P(1)$ holds.

*Induction hypothesis:* Assume $P(k)$ to be true.

*Inductive step:* We consider two cases.

* There exists at least one index $i$ for which $d\_i < b - 1$. Let $j$ be the smallest such index. If $j = 0$, then $d\_0 + 1 \le b - 1$ and therefore $d\_q b^q + \cdots + d\_2 b^2 + d\_1 b^1 + (d\_0 + 1)$ is a valid representation of $k + 1$. Otherwise, if $j > 0$, then

  $$
    \begin{align}
      k &= d\_q b^q + \cdots + d\_j b^j + (b - 1)b^{j - 1} + \cdots + (b - 1)b^2 + (b - 1)b + (b - 1) \\\
        &= d\_q b^q + \cdots + d\_j b^j + (b - 1)(1 + b + b^2 + \cdots + b^{j - 1}) 
    \end{align}
  $$

  Then, by Lemma 1:

  $$
    \begin{align}
                   k &= d\_q b^q + \cdots + d\_j b^j + b^j - 1 \\\
      \implies k + 1 &= d\_q b^q + \cdots + d\_j b^j + b^j \\\
                     &= d\_q b^q + \cdots + (d\_j + 1) b^j 
    \end{align}
  $$

  Now, since we know that $d\_j + 1 \le b - 1$, this is also a valid representation of $k + 1$.

* In this case, $d\_i = b - 1$ for all $i$. Then

  $$
    k = (b - 1)(1 + b + b^2 + \cdots + b^q).
  $$

  Once again, applying Lemma 1 tells us that

  $$
    \begin{align}
                   k &= b^{q + 1} - 1 \\\
      \implies k + 1 &= b^{q + 1} 
    \end{align}
  $$

  and we have the representation we need. 
  
Since these cases are exhaustive, we find that $P(k) \implies P(k + 1)$, which proves existence for all $n \ge 1$. Note that it is also possible to represent $0$ in any base, as itself.

#### Proof of uniqueness

To prove that $d\_q \dots d\_2 d\_1 d\_0$ is a unique representation of $n$ in base $b$, we will assume that there are two different representations of $n$, so that

$$
  \begin{align}
    n &= c\_q b^q + \cdots + c\_2 b^2 + c\_1 b^1 + c\_0 \\\
      &= d\_q b^q + \cdots + d\_2 b^2 + d\_1 b^1 + d\_0 
  \end{align}
$$

and then try to derive a contradiction from this. 

If the above two representations differ, then there must be some smallest index $j$ for which $c\_j \ne d\_j$. We may then choose $c\_0, d\_0, c\_1, d\_1, \dots$ in such a way that $c\_j > d\_j$. In order for these two representations to denote the same number $n$, the difference of the two sums must be zero. We can therefore let 

$$\delta = \sum\_{i = j + 1}^q (c\_i - d\_i)b^i,$$ 

and write $0 = \delta + (c\_j - d\_j)b^j = \displaystyle\frac{\delta}{b^j} + c\_j - d\_j = \\!\\!\\! \sum\_{i = j + 1}^q (c\_i - d\_i)b^{i - j} + c\_j - d\_j.$

Then, since each term in $\dfrac{\delta}{b^j}$ is a factor of $b$, we find that

$$
0 = \frac{\delta}{b^j} + c\_j - d\_j \equiv c\_j - d\_j \; (\\!\\!\bmod b). 
$$

That is, $c\_j - d\_j \in \\{ zb \;|\; z \in \mathbb{Z} \\}$. But since $0 \le c\_j, d\_j < b$, it must be that $c\_j - d\_j = 0$, which contradicts our initial assumption that $c\_j \ne d\_j$. This concludes the proof. $$\tag*{$\blacksquare$}$$

### String-to-integer conversion

To perform this type of conversion from the string representation of an integer, in C, we can use the `atoi`, `strtol`, and `strtoll` functions from the `stdlib.h` header, where the latter two also support bases other than 10. The following example shows a simple implementation. Note that, unlike the standard C functions, we do *not* take negative numbers into account here.

```
#include <stdint.h>

uint32_t stoi (const char *str, int radix)
{
    char d;
    uint32_t s = 0;

    if (radix < 2 || radix > 16) 
        return s;

    while ((d = *str))
    {
        ++str;
        if (d >= '0' && d <= '9') {
            d -= '0';
        } else if (d >= 'A' && d <= 'F') {
            d -= 'A' - 10;
        } else if (d >= 'a' && d <= 'f') {
            d -= 'a' - 10;
        } else {
            continue;
        }
        if (radix > d) {
            s = s * radix + d; 
        }
    }

    return s;
}
```

Starting from a string $d\_q d\_{q-1} d\_{q-2} \dots d\_0 $ in base $b$, we compute successive values of $s$ as follows:

$$
  \begin{align}
    s\_0 &= d_q \\\
    s\_1 &= b s\_0 + d\_{q-1} = d\_q b + d\_{q-1} \\\
    s\_2 &= b s\_1 + d\_{q-2} = b(d\_q b + d\_{q-1}) + d\_{q-2} \\\
    s\_3 &= b s\_2 + d\_{q-3} = b(b(d\_q b + d\_{q-1}) + d\_{q-2}) + d\_{q-3} \\\
  \end{align}
$$

&hellip;and so on. We are using an instance of a more general technique, known as [Horner’s rule](https://en.wikipedia.org/wiki/Horner's_method), to save a few multiplications here. This is repeated until

$$
  \begin{align}
    s\_q &=b( \cdots (b(d\_q b + d\_{q-1}) + d\_{q-2}) \cdots) + d\_0 \\\
         &=b( \cdots (b(d\_q b^2 + d\_{q-1} b + d\_{q-2}) + d\_{q-3}) \cdots) + d\_0 \\\
         &=b( \cdots (b(d\_q b^3 + d\_{q-1} b^2 +  d\_{q-2} b + d\_{q-3}) \cdots) + d\_0 \\\
         & \quad\quad\quad\quad\quad\quad\quad\quad\quad \vdots \\\
         &=d\_q b^q + d\_{q-1} b^{q-1} + \cdots + d\_1 b + d\_0. \\\
  \end{align}
$$

This implementation in Haskell follows the same approach. The fold higher-order function lends itself very naturally to this type of problem. 

```
import Data.Char ( digitToInt )  
import qualified Data.Text as T

type Base = Int

atoi :: Base -> T.Text -> Int
atoi base   
  | base < 2 || base > 16 = error "Illegal base"
  | otherwise = T.foldl' f 0  
  where
    f t digit = t * base + digitToInt digit 
```

(Haskell’s [`Text`](https://hackage.haskell.org/package/text) package is used here for efficient string handling.)

### Integer-to-string conversion

In the opposite direction &mdash; to convert an integer to a string in some arbitrary base, we use an algorithm similar to the counting procedure described earlier. In this case, however, we need to pay attention to the remainder at each step, and write these values as characters to a buffer. 

Notice that we are just working with Euclidian division here, and the [division lemma](http://www.ask-math.com/euclids-division-lemma.html), which says that for any pair of positive integers $n$ and $m$, we can find integers $q$ and $r$, such that $0 \le r < m$ and $n = qm + r$. The proof can be derived from the basis representation theorem.

When $m = 1$ (which it isn’t here &mdash; we include this case just for the sake of completeness), then $r$ must be $0$ and therefore $q = n$. Otherwise, $m$ is greater than one and we may consider $m$ as a base. We then know that $n$ has a representation $a\_0, a\_1, \dots, a\_s$ in this base. Now, let 

$$
  \begin{align}
q &= a\_sm^{s-1} + a\_{s-1}m^{s-2} + \cdots + a\_2m + a\_1, \text{ and } \\\
r &= a\_0
  \end{align}
$$

where $0 \le a\_0 < m$. This means that

$$
  \begin{align}
n &= a\_sm^s + a\_{s-1}m^{s-1} + \cdots + a\_2m^2 + a\_1m + a_0 \\\
  &= (\underbrace{a\_sm^{s-1} + a\_{s-1}m^{s-2} + \cdots + a\_2m + a\_1}\_{q})m + r. \\\
  \end{align}
$$

<!--
Now, given a pair of integers $q′$ and $r′$, such that $n = q′m + r′$, there exists a representation $q′ = b\_tm^t + b\_{t-1}m^{t-1} + \cdots + b\_2m^2 + b\_1m + b\_0$, so that

$$
\begin{align}
  n &= (\overbrace{b\_tm^t + b\_{t-1}m^{t-1} + \cdots + b\_2m^2 + b\_1m + b\_0}^{q′})m + r′ \\\
    &= b\_tm^{t+1} + b\_{t-1}m^t + \cdots + b\_2m^3 + b\_1m^2 + b\_0m + r′ \\\
\end{align}
$$

and by comparing these two representations, coefficient by coefficient, it is evident that $q′ = \sum\_{i=0}^t b\_im^i = \sum\_{j=1}^{s} a\_jm^{j-1} = q$ and $r′ = a\_0 = r$. 
-->

#### Algorithm

Let $m$ be our target base, and $n$ the number to translate. Using the division lemma, the process looks something like the following.

$$
  \begin{align}
    n &= q\_0m + r\_0, && 0 \le r\_0 < m, \\\
    q\_0 &= q\_1m + r\_1, && 0 \le r\_1 < m, \\\
    q\_1 &= q\_2m + r\_2, && 0 \le r\_2 < m, \\\
    q\_2 &= \dots
  \end{align}
$$

Since $q\_k = \frac{q\_{k-1}-r\_k}{m} \wedge r\_k \ge 0 \wedge m > 1 \implies |q\_k| < |q\_{k-1}|$, we may continue this until we reach $p = \lfloor \log\_m n \rfloor$, so that $q\_p = 0$. The pattern here is the same as when we implemented the Horner scheme;

$$
  \begin{align}
     n &= q\_0m + r\_0 \\\
       &= (q\_1m + r\_1)m + r\_0 \\\
       &= ((q\_2m + r\_2)m + r\_1)m + r\_0 \\\
       & \quad\quad\quad\quad\quad\quad\quad\quad\quad\quad \vdots \\\
       &= (( \cdots (q\_{p-1}m + r\_{p-1})m + \cdots + r\_2)m + r\_1)m + r\_0 \\\
       &= (( \cdots ((q\_pm + r\_p)m + r\_{p-1})m + \cdots + r\_2)m + r\_1)m + r\_0 \\\
       &= (( \cdots (r\_pm + r\_{p-1})m + \cdots + r\_2)m + r\_1)m + r\_0 \\\
       &= (( \cdots (r\_pm^2 + r\_{p-1}m + r\_{p-2})m + \cdots + r\_2)m + r\_1)m + r\_0 \\\
       &= (( \cdots (r\_pm^3 + r\_{p-1}m^2 + r\_{p-2}m + r\_{p-3})m + \cdots + r\_2)m + r\_1)m + r\_0 \\\
       & \quad\quad\quad\quad\quad\quad\quad\quad\quad\quad \vdots \\\
       &= r\_pm^p + r\_{p-1}m^{p-1} + \cdots + r\_2m^2 + r\_1m + r\_0
  \end{align}
$$

&hellip;which shows that the base $m$ representation of $n$ is indeed $r\_p r\_{p-1} \dots r\_0$.

![](/content/images/2017/01/euclid.jpg)

As an example, here we show the steps for converting the decimal number 2,958,409,950 to base 16. In a program implementation, we typically need to reverse the result for the digits to appear in the order we expect. 

<table>
  <thead>
    <tr>
      <th>Dividend</th>
      <th>Quotient</th>
      <th>Remainder</th>
      <th>Digit</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>2958409950</td>
      <td>184900621</td>
      <td>14</td>
      <td>E</td>
    </tr>
  </tbody>
  <tbody>
    <tr>
      <td>184900621</td>
      <td>11556288</td>
      <td>13</td>
      <td>D</td>
    </tr>
  </tbody>
  <tbody>
    <tr>
      <td>11556288</td>
      <td>722268</td>
      <td>0</td>
      <td>0</td>
    </tr>
  </tbody>
  <tbody>
    <tr>
      <td>722268</td>
      <td>45141</td>
      <td>12</td>
      <td>C</td>
    </tr>
  </tbody>
  <tbody>
    <tr>
      <td>45141</td>
      <td>2821</td>
      <td>5</td>
      <td>5</td>
    </tr>
  </tbody>
  <tbody>
    <tr>
      <td>2821</td>
      <td>176</td>
      <td>5</td>
      <td>5</td>
    </tr>
  </tbody>
  <tbody>
    <tr>
      <td>176</td>
      <td>11</td>
      <td>0</td>
      <td>0</td>
    </tr>
  </tbody>
  <tbody>
    <tr>
      <td>11</td>
      <td>0</td>
      <td>11</td>
      <td>B</td>
    </tr>
  </tbody>
</table>

The non-standard `itoa` (integer-to-ascii) function in C performs this type of conversion. However, since `itoa` is not available on all systems, a portable alternative is the `sprintf` family of functions. 

```
#include <stdio.h>

int main (void)
{
    unsigned int a = 2958409950;
    char str[9];

    sprintf (str, "%x", a);
    printf ("%u = 0x%s\n", a, str);

    return 0;
}
```

Unfortunately, with this solution, you are limited to conversions between bases 8, 10 and 16. An implementation in ANSI C that handles all bases from 2 to 16 is shown here.

```
char *itoa (int val, char *buf, int radix)
{
    static const char *digits = "0123456789abcdef";

    int i = 0, 
        j = 0;

    if (radix < 2 || radix > 16) {
        /* Return empty string if radix is invalid. */
        *buf = 0;
        return buf;
    }

    do {
        buf[j++] = alphabet [val % radix];
        val /= radix;
    } 
    while (val);

    buf[j--] = 0;

    while (i < j)
    {
        const char tmp = buf[i];
        buf[i++] = buf[j];
        buf[j--] = tmp;
    }

    return buf;
}
```

At the processor level, integer division instructions, like `div` on x86 ISAs, compute both quotient and remainder at the same time. Some high-level languages and programming libraries take advantage of this. In Haskell, for example, the `quotRem` function from the [Prelude](https://hackage.haskell.org/package/base/docs/Prelude.html) compiles down to the `div` machine instruction on these targets. 

Looking at the C code again, it appears as if we are performing extra work, in this sense, and it may be tempting to replace the modulus computation and subsequent division with some piece of optimization that directly utilizes hardware integer division. In reality, there is no performance benefit to be gained by doing so, in a case like this. In fact, it will most likely have the opposite effect, since compilers are smart and transform divisions by constants into more efficient bitwise shift operations (more about these in coming posts), at a sufficiently high optimization level. 

It is not easy to beat the code generated by optimizing compilers, like gcc and LLVM. Purely as an exercise in code golf, the following handwritten assembly code &mdash; which converts an integer to a hexadecimal (base 16) string &mdash; is trying to squeeze out a few more clock cycles, by avoiding expensive `div` instructions. The code is written in the NASM syntax, which means that the first operand is the destination, and the second is the source. This is 64-bit assembly for the AMD64 ABI, so the two arguments are passed in registers `RDI` and `RSI`. The return value is given in `RAX`.

```
; hex_str.asm 

    section .data

digits: 
    db "0123456789abcdef"

    section .text

    global hex_str

hex_str:
    mov      rax, rdi              ; 1st arg: input value
    mov      rdi, rsi              ; 2nd arg: string buffer

    lea      esi, [digits]         ; Pointer to character set

    push     rdi                   ; Save for later use

loop:
    mov      edx, eax
    and      edx, 0b1111           ; Get the remainder
    shr      eax, 4                ; Divide value by 2^4

    mov      dl, [esi + edx]       ; Get digit matching the remainder
    mov      [rdi], dl             ; Write digit to character buffer
    inc      rdi                   ; Increment pointer

    test     eax, eax              ; Check if quotient is zero
    jne      loop                  ; If not, repeat again

    mov BYTE [rdi], 0x00           ; Add null terminator

    mov      rsi, [rsp]            ; Recover pointer to buffer

reverse:                           ; Reverse the string by moving the two 
    dec      rdi                   ; pointers towards the middle until they
    mov      ah, [rdi]             ; meet, swapping the pointees at each step
    mov      al, [rsi]             ; 
    mov      [rdi], al             ; |-->    
    mov      [rsi], ah             ; 8ab3387f 
    inc      rsi                   ;     <--|

    cmp      rsi, rdi
    jl       reverse

exit:
    pop      rax                   ; Return the buffer address

    ret
```

```
/* main.c */
#include <stdio.h>

char *hex_str (int, char *);

int main (void)
{
    char str[9];

    printf ("0x%s\n", hex_str (0xfeedbaba, str));
    return 0;
}
```

On my system, I compile, link and run this code with the following commands.

```
nasm hex_str.asm -f elf64
gcc main.c hex_str.o -o main
./main
```

As a side note, how do we implement division if we are only allowed to use addition and subtraction? Although very inefficient, the straightforward way is to assign the dividend to a variable, say $n$, and repeatedly subtract the divisor, which we will call $d$, from $n, n - d, n - 2d, \dots $ until the result is less than $d$. 

$$
  \begin{align}
  n′      &= n - d \\\
  n′′     &= n′ - d \\\
  n^{(3)} &= n′′ - d \\\
  \end{align}
$$

If this takes $q$ steps, then $q$ is the quotient, and the value of $n^{(q)}$ is the remainder. Clearly, the running time of this algorithm is linear in the size of $q$, which is not so great. Later, we will look at more efficient methods, involving already mentioned bit shifts. 

```
/**
 * Slow division algorithm
 */
int quot_rem (int n, int d, int *rem)
{
    int q = 0;

    while (n >= d) {
        n = n - d;
        ++q;
    }
    if (rem) { *rem = n; }

    return q;
}
```

Finally we look at a simple `itoa` implementation in Haskell. The following function builds a `Text` representation of the input value, by *unfolding* it &mdash; a higher-order pattern more generally known as an [anamorphism](https://en.wikipedia.org/wiki/Anamorphism). It is the dual operation of the fold ([catamorphism](https://en.wikipedia.org/wiki/Catamorphism)) we used in `atoi`. 

```
import Data.Char ( intToDigit )
import qualified Data.Text as T

type Base = Int

itoa :: Base -> Int -> T.Text
itoa base n  
  | base < 2 || base > 16 = error "Illegal base"
  | 0 == n    = T.pack "0"
  | otherwise = T.reverse $ T.unfoldr gen n
  where 
    gen a = case quotRem a base of
      (0, 0) -> Nothing
      (q, r) -> Just (intToDigit r, q)
```

These two functions form each others inverses, when applied to the same base. That is $
  \forall b,\; 2 \le b \le 16 : \text{atoi }b \circ \text{itoa }b \equiv id
$, as the following test will confirm:

```
and [(atoi b . itoa b) n == n | n <- [0..100], b <- [2..16]]
```

In the next part of this series, we will take a more detailed look at integer representation in the binary numeral system.
