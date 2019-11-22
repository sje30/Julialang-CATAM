# Control flow

## Conditional evaluation
Evaluate pieces of code, depending on whether a Boolean expression is true or false.

```
x = 10

if x > 0
	println("x is greater than zero")
else
	println("x is not greater than zero")
end
```

Introduce `elseif`:

```
x = 10

if x > 0
	println("x is positive")
elseif x < 0
	println("x is negative")
else
	println("x is zero")
end
```

## Ternary operator
the only operator in most language taking three operands
```
# a ? b : c

x > 0 ? "greater than zero" : "not greater than zero"

begin
	x > 0 ? "greater than zero" : 
	x < 0 ? "not greater than zero" : "is zero"
end
```

## Notes about scoping

if is "leaky". Notice how the `relation` variable can be used outside the `if`blocj where it was declared.

```
x = -1

if x > 0
	relation = "greater than zero"
else
	relation = "not greater than zero"
end

println("x is ", relation)
```

### Exercise: debug this
The following code gives a runtime error.
```
z = 0

if z > 0
	statement = "positive"
elseif z < 0
	statement = "negative"
end

println("x is ", statement)
```

Solution: you need a `else sign = "zero"`, because all possible code paths must define a value for the variable.

This leaky behaviour is not the case for `for`, `while` and `try`, which introduc new scopes. (see another document?)

## Short circuit evaluation


## Exercise: three ways of writing the same thing
```
function comparenumbers(x::Int, y::Int) {
	# replace this comment
}

comparenumbers(1, 1)
comparenumbers(1, 0)
comparenumbers(0, 1)
```

