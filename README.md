Polaris ST


# Pharo seems odd.. Can you help me understand it?

Lots of development platforms have many thing in common, for example, a Java dev can easily 
Pharo, on the other hand, have some 

1. [Oh my eyes!!! What is this syntax?](##-oh-my-eyes!!!-what-is-this-syntax?)
2. [How do I execute this? The Live Coding Environment](##-oh-my-eyes!!!-what-is-this-syntax?)

## Oh!! My eyes!!! What is this syntax?

Most languages use some variation of the Algol family syntax, which means "it is similar to the C syntax". 
Pharo implements Smalltalk, an OO lang focused in **uniformity** and natural language **readability** with
minimal syntax. The result is something alien to C-Like syntax, but really expressive and easy to use. 

```
"Read this sentence as if you were reading normal english. (comments are delimited by quotations marks)"

'Mr blue has a blue house and a blue car' copyReplaceAll: 'blue' with: 'red'
```

The execution result will be the following string: 'Mr red has a red house and a red car'

The equivalent code in Java would be:

`"Mr blue has a blue house and a blue car".replace("blue", "red")`

The Pharo version don't feel more like natural language? Of course, good coding depends on good developers actively 
trying to make expressive code, but Pharo syntax facilitate this goal. 

So, how that sentence works? In Pharo **every computation is done by messaging passing** (remember that for later), and we
three types of messages:

1. Unary messages don't have arguments:

   <br>`' Test string ' trim` removes blank spaces from both sides of the string, it is equivalent to `" Test string ".trim()`

    
2. Binary messages take only one argument and can be used with non-alphabetic symbols only:

   <br>`10 @ 20` creates a point P(10, 20), it would be equivalent to something like `10.createPointWith(20)`


3. Keyword messages takes one or more arguments using words ended with colons. This is the kid of message used in our 
first example, let's make a different take now and see how the more common method call can be transformed into the 
keyword form:

    <br>`"blue house".replace("blue", "red")`

    <br>Let's remove the dot as it is not strictly necessary:

    <br>`"blue house" replace("blue", "red")`

    <br>Which one is being replaced and which one is replacing, blue ou red? Let's add a tag to remove this ambiguity:

    <br>`"blue house" replace("blue", by "red")`  

    <br>Now, the parentesis and coma aren't more necessary:

    <br>`"blue house" replace "blue" by "red"`

    <br>But now the compiler will cannot know where are the arguments, let's add colons to solve this ambiguity:

    <br>`"blue house" replace: "blue" by: "red"`

    <br>To finish, in Pharo strings are delimited by apostrophes:

    <br>`'blue house replace': "blue" by: "red"`

    <br>We would say that the method `replace:by` is called in the `'blue house replace'` String passing `'blu'` and 
 `'red'`. You will se that, in Pharo or Smalltalk, people say that the message `replace:by` is sent to `'blue house replace'` String 
 using `'blu'` and `'red'` as arguments.  

Precedence rules are: left to right, unary then binary then keyword, while parentesis are used for desambiguation.
Remember that **every computation is done by messaging passing**? This is true even for arithmetic operations, so while 
in other languages `1 + 3` is an arithmetic operation with distinct rules for precedence, in Pharo this is just a 
binary message where `+` is a message sent to the object `1` with `3` as argument. This is true for **any** other 
operator:

- `1 = 2` = is a binary message sent to 1 using 2 as argument. The result will be `false`
- `10 > 5` > is a binary message sent to 10 using 5 as argument. The result will be `false`
- `2 * 5` * is a binary message sent to 10 using 5 as argument. The result will be `10`
- `20 / 5` / is a binary message sent to 20 using 5 as argument. The result will be `4`
- and so on...

This grants **uniformity** and **simplicity** of rules, since now the developer only has one rule of precedence to remember 
and don't have to deal with yet another distinction for operators in the system that behaves differently from the rest:
numbers are objects and operators are just messages, not reserved words, that can even be used in other contexts. 

The downside is that the arithmetic precedence is well known, but do not apply in Pharo, so: 

   `10 + 5 * 2` will return 30 instead of 20, because the precedence is always computed left to write, however 
   parentesis can be used to enforce the precedence computation expected, so `10 + (5 * 2)` will return 20.

To sum 


https://medium.com/concerning-pharo/elegant-pharo-code-bb590f0856d0

## How do I execute this? The Live Coding Environment



