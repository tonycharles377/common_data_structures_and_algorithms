# Common Data Structures and Algorithms
This is a repository containing some of the common data stractures and algorithms taught in [The Odin Project](https://www.theodinproject.com/) curriculum. The goal was to learn basic computer science concepts.
# Learning Objectives
* What is a stack?
* What is a queue?
* What’s the best way to implement stacks and queues in Ruby?
* What is breadth-first-search (BFS)?
* What is depth-first-search (DFS)?
* What is a linked list?
* what is a HashMap?
* Binary search algorithms

# Projects
## 1. Linked lists
Implementing a linked list in ruby with the following methods.
* #append(value) - adds new node to the end of the list
* #prepend(value) - adds new node to the start of the list
* #size returns the total number of nodes in the list
* #head returns the first node in the list
* #tail returns the last node in the list
* #at(index) returns the node at the given index
* #pop removes the last element from the list
* #contains?(value) returns true if the passed in value is in the list and otherwise returns false
* #find(value) returns the index of the node containing value, or nil if not found
* #to_s represent your LinkedList objects as strings, so you can print them out and preview them in the console
* #insert_at(value, index) that inserts a new node with the provided value at the given index
* #remove_at(index) that removes the node at the given index

## 2. Hash map
Implementing a HashMap in ruby with the following methods.
* #hash(key) - takes a key and produces a hash code with it
* #set(key, value) - takes two arguments key and value pair
* #get(key) - takes one argument key and returns the value that is assigned to this key
* #has(key) - takes a key as an argument and returns true or false
* #remove(key) - remove the entry with that key and return the deleted entry’s value
* #length - returns the number of stored keys in the hash map
* #clear - removes all entries in the hash map
* #keys - returns an array containing all the keys inside the hash map
* #values - returns an array containing all the values
* #entries - returns an array that contains each key, value pair
* Create a class HashSet that behaves the same as a HashMap but only contains keys with no values
