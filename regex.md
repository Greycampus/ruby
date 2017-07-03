**Regular Expressions and Regex Based Operations**
==============================================

=~ operator
----------
```ruby
if /hay/ =~ 'haystack'
  puts "There is hay in the word haystack"
end
```
**Note: The order is significant. Though `'haystack' =~ /hay/` is in most cases an equivalent, side effects might differ:**

- Strings captured from named capture groups are assigned to local variables only when Regexp#=~ is called (`regexp =~ str`);
- Since the right operand might be is an arbitrary object, for `regexp =~ str` there will be called either `Regexp#=~` or `String#=~`.

Note that this does not return a true/false value, it instead returns either the index of the match if found, or nil if not found. Because all integers in ruby are truthy (including 0) and nil is falsy, this works. If you want a boolean value, use `#===` as shown in another example.

Groups, named and otherwise.
----------------------------

Ruby extends the standard group syntax `(...)` with a named group, `(?<name>...)`. This allows for extraction by name instead of having to count how many groups you have.
```ruby
name_reg = /h(i|ello), my name is (?<name>.*)/i #i means case insensitive

name_input = "Hi, my name is Zaphod Beeblebrox"

match_data = name_reg.match(name_input) #returns either a MatchData object or nil
match_data = name_input.match(name_reg) #works either way

if match_data.nil? #Always check for nil! Common error.
  puts "No match"
else
  match[0] #=> "Hi, my name is Zaphod Beeblebrox"
  match[1] #=> "i" #the first group, (i|ello)
  match[2] #=> "Zaphod Beeblebrox"
  #Because it was a named group, we can get it by name
  match[:name]  #=> "Zaphod Beeblebrox"
  match["name"] #=> "Zaphod Beeblebrox"
  puts "Hello #{match[:name]}!"
end
```
The index of the match is counted based on the order of the left parentheses (with the entire regex being the first group at index 0)
```ruby
reg = /(((a)b)c)(d)/
match = reg.match 'abcd'
match[0] #=> "abcd"
match[1] #=> "abc"
match[2] #=> "ab"
match[3] #=> "a"
match[4] #=> "d"
```


Quantifiers
-----------

Quantifiers allows to specify count of repeated strings.

- Zero or one:
```ruby
/a?/
```
- Zero or many:
```ruby
/a*/
```
- One or many:
```ruby
/a+/
```
- Exact number:
```ruby
/a{2,4}/ # Two, three or four
/a{2,}/  # Two or more
/a{,4}/  # Less than four (including zero)
```
By default, **quantifiers are greedy**, which means they take as many characters as they can while still making a match. Normally this is not noticeable:
```ruby
/(?<site>.*) Grey Campus/ =~ 'Online & self Education Grey Campus'
```
The named capture group `site` will be set to 'Online & self Education Grey Campus' as expected. But if 'Grey Campus' is an optional part of the string (because it could be 'Grey Campus' instead), the naive solution will not work as expected:
```ruby
/(?<site>.*)( Grey Campus)?/
```
This version will still match, but the named capture will include 'Grey Campus' since `*` greedily eats those characters. The solution is to add another question mark to make the `*` lazy:
```ruby 
/(?<site>.*?)(Grey Campus)?/
```
**Appending `?` to any quantifier will make it lazy.**

Regular Expressions in Case Statements
--------------------------------------

You can test if a string matches several regular expressions using a switch statement.
Example

case "Ruby is #1!"
when /\APython/
    puts "Boooo."
when /\ARuby/
    puts "You are right."
else 
    puts "Sorry, I didn't understand that."
end

This works because case statements are checked for equality using the === operator, not the == operator. When a regex is on the left hand side of a comparison using ===, it will test a string to see if it matches.

