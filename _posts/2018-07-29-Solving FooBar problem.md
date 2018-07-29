---
layout: post
title: Let's solve foobar
date: 2018-07-29 07:44:00
category: elixir
---

Going through different blogs reading about elixir and solving problems in general, I landed on [this](https://www.careercup.com/question?id=6543214668414976){:target="_blank"} page. The problem seemed quite easy and I had already solved the same problem in other programming language before. I want to start learning elixir by solving this problem in elixir. 

The task is to take integer `n` and print  all number from `1 to n` in different lines. If n is divisible by 3, then instead of printing `3`, `Foo` needs to be printed, `Bar` if divisible by 5 and `Foobar` if divisible by 15.

### Solution

```
for n <- 1..15 do
  cond do
    rem(n, 15) == 0 ->
      IO.puts "Foobar"
    rem(n, 3) == 0 ->
      IO.puts "Foo"
    rem(n, 5) == 0 ->
      IO.puts "Bar"
    true ->
      IO.puts n
  end
end
```

In most language, when required to check multiple conditions  `if...else if/elsif...else...end` would be used, however elixir provides `cond`for such purpose. We can match any number of condition with `cond` and check the final condition with `true ->` which is equivalent to `else`. 

If we only need to check only one condition, we use `if...else...end` macros. 


### IEX

```
iex(1)> if rem(10,2) == 0 do
...(1)>   IO.puts "Even" 
...(1)> else
...(1)>   IO.puts "Odd"
...(1)> end
Even
:ok
```