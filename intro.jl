## let's examine the  logistic function that describes how population may vary over time.
## x(t+1) = r x(t) ( 1 - x(t) )

## First we define a value for the constant r (we will vary it later).
r = 2.0

## To solve this, we start with some initial value for x (here we
## assume x is bigger than zero).  

x = 0.1

x = r * x * (1 - x)
x = r * x * (1 - x)
x = r * x * (1 - x)
x = r * x * (1 - x)



## It quickly becomes a pain to keep typing this so what we want to do is to ITERATE
## a few times to get to the solution.  It looks like we are
## approaching a steady-stade solution of x=0.5 [we can confirm this by
## substituring this into the rhs and showing indeed that when x=0.5 and
## r=2.0 this is a steady state.

## So, for our second approach, let's use a loop to check.

## This global is very annoying as it needs explaining, and might disappear (DAVID?) 

x = 0.1
for i = 1:100
    global x = r * x * (1 - x)
end

## todo  this doesn't work now!!!

## This works well, but we can also make two further
## improvemnts. First, we can define a function rather than having to keep
## writing it explicitly.

f(x, r) = r * x * (1 - x)

x = 0.2
for i = 1:10
    global x = f(x, r)
end

## Second, we would like to store all of the intermediate results, so that we can
## plot the evolution of x over time.

x = zeros(10)
x[1] = 0.2                      # set the initial condition
for t = 1:9
    global x[t+1] = f( x[t], r)
end
x

## Now this is something that we can plot.  Julia has a system of
## packages that provide additional functionality, and here we use the
## plotting package.
using Plots

plot(x, xlabel="iteration", ylabel="population")

## todo xlab="time", ylab="population"
## title: logisitic function

## TODO prealloc the vector, what is equivalent of R:rep() in julia?

## So here we can already see what happens in a set of four different
## plots as we increase the value of r.  To help with this we will
## write a function that does the looping for us and returns the whole vector.

function logistic(r, n)
    x = zeros(n)
    x[1] = 0.2
    for t = 1:(n-1)
        x[t+1] = r * x[t] * (1 - x[t])
    end
    return(x)
end


## todo, want this as a 2x2 plot with labels "A", "B", "C", "D"
pa = plot( logistic(2.0, 30), title="(A) r=2.0" )
pb = plot( logistic(2.5, 30), title="(B) r=2.5" )
pc = plot( logistic(3.0, 30), title="(C) r=3.0" )
pd = plot( logistic(3.6, 30), title="(D) r=3.6" )
plot(pa, pb, pc , pd, layout=(2,2), legend=false)
    
# Follow the tutorial listed in   <https://docs.juliaplots.org/latest/tutorial/>


## Finally we would like to show the distribution of steady states.
