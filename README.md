Polaris ST

Integrate:
1. ValidationSensor
2. Tome
3. Buoy
4. Auth0
5. 


# Pharo seems odd... Can you help me understand it?

Pharo has a language and a development environment quite different from what usually known and used in most popular 
plataforms, like Java, Python or Javascript. The following sections tries to reduce/remove the awkwardness feeled by 
newercomers let them get ready to take advantage of the Pharo development.

1. [Oh my eyes!!! What is this syntax?](#oh-my-eyes-what-is-this-syntax)
2. [How do I execute this? The Live Coding Environment]()

## Oh!! My eyes!!! What is this syntax?

Most popular languages uses C-Like syntax, Pharo, on the other hand, implements Smalltalk, an OO lang focused in 
**uniformity** and natural language **readability** with minimal syntax. The resulting syntax happens to be alien for 
C-Like used devs, but it is yet very expressive and easy to use. For example, read the code below as if you were 
reading normal english.

```smalltlak
'Mr blue has a blue house and a blue car' copyReplaceAll: 'blue' with: 'red'
```

The execution result will be the following string: 'Mr red has a red house and a red car', and the equivalent code in 
Java would be:

```Java
"Mr blue has a blue house and a blue car".replace("blue", "red")
```

Pharo syntax is more akin to natural language, and it was conceived to be that way. Dots, for example, are needed 
only to mark final sentences and parenthesis are not used on methods, look at the difference:

<table>
   <tr>
      <th>Java</th>
      <th>Pharo</th>
   </tr>
   <tr>
<td>

```java
" Test string ".trim(); /* return "Test string" */
" Test string2 ".trim(); /* return "Test string2" */
```

</td>
<td>

```smalltalk
' Test string ' trim. "return 'Test string'"
' Test string2 ' trim. "return 'Test string2'"
```

</td>
</tr>
</table>

In Pharo, strings are delimited by **'** and **"** are used for comments. Note that the Pharo code has more elements 
used in natuaral language, and while in Java, or any C-Like lang, we say that "we are calling the `trim` method for 
both strings", in Pharo we say that "we are sending the `trim` message to both strings". This is a metaphor of Object 
communication being applied, but that is implemented im the language since **every computation** in Pharo is made by 
object Communication through messaging passing. <cite/link advantages??>

A simple message without arguments, like `trim`, is called an **Unary Message**, other examples are:

```smalltalk
5 factorial. "return 120"
Date today. "return the current day at the time of execution" 
'smalltalk' asUppercase. "return 'SMLLTALK'"
``` 

If those are Unary Messages, what about our first example?

```smalltlak
'Mr blue has a blue house and a blue car' copyReplaceAll: 'blue' with: 'red'
```

This is called a **Keyword** message where there are one or more arguments separated by _keywords_ delimited by 
colons (**":"**)


Let's compare now Pharo directly with Natural Language:

<table>
   <tr>
      <th>Natural Language</th>
      <th>Pharo</th>
   </tr>
   <tr>
<td>

My Shopping List:
- Eggs;
- Rice;
- Beans;
- Bread and
- Meat.


</td>
<td>

```smalltalk
myShoppingList := OrderedCollection new.

shoppingList 
   add: 'Eggs';
   add: 'Rice';
   add: 'Beans';
   add: 'Bread';
   add: 'Meat.
```

</td>
</tr>
</table>

Very similar, right? I used identation to improve it's ressamblance, but you can see that operators were implemented
to mimic more the natural language counterpart. Of course good code depends upon good developers, and it is possible to 
make a mess with Pharo just like with any other language, but the tooling to craft code with better readability is there
for use.

Now lets detail what is happening in the code:

1. OrderedCollection is a class that is instantiated with the **new** message. We say that **new** is sent to the
  OrderedCollection class, which responds with an instance of the collection.

    > Note that **new** is **not** an operator, and that object construction has *not* special context/semantic like in 
    some other languages, leading to more uniformity and less cognitive burden.

2. The **":="** is the attribution operator that tells that the newly created instance should be stored into the
  `shoppingList` variable;
3. Then a cascade of messages is sent to `shoppingList`. For that it is used the **cascading operator**, **";"**, that 
allows multiple messages to be sent to the same object, `shoppingList` in this case. It is kind of a 
[Fluent Interface](https://en.wikipedia.org/wiki/Fluent_interface) natively implemented on the language;
4. The dot ".", then, denotes the statement ending.



    
2. Binary messages take only one argument and can be used with non-alphabetic symbols only:

   <br>`10 @ 20` creates a point P(10, 20), it would be equivalent to something like `10.createPointWith(20)`




Precedence rules are: left to right, unary then binary then keyword, while parentesis are used for desambiguation.
Remember that **every computation is done by messaging passing**? This is true even for arithmetic operations, so while 
in other languages `1 + 3` is an arithmetic operation with distinct rules for precedence, in Pharo this is just a 
binary message where `+` is a message sent to the object `1` with `3` as argument. This is true for **any** other 
operator:

- `1 = 2` = is a binary message sent to 1 using 2 as argument. The result will be `false`
- `10 > 5` > is a binary message sent to 10 using 5 as argument. The result will be `false`
- `2 * 5` * is a binary message sent to 10 using 5 as argument. The result will be `10`
- `20 / 5` / is a binary message sent to 20 using 5 as argument. The result will be `4`
- and so on.

This grants **uniformity** and **simplicity** of rules, since now the developer only has one rule of precedence to remember 
and don't have to deal with yet another distinction for operators in the system that behaves differently from the rest:
numbers are objects and operators are just messages, not reserved words, that can even be used in other contexts. 

The downside is that the arithmetic precedence is well known, but do not apply in Pharo, so: 

   `10 + 5 * 2` will return 30 instead of 20, because the precedence is always computed left to write, however 
   parentesis can be used to enforce the precedence computation expected, so `10 + (5 * 2)` will return 20.

To sum 


https://medium.com/concerning-pharo/elegant-pharo-code-bb590f0856d0

## How do I execute this? The Live Coding Environment



