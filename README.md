# Common Data Structures and Algorithms
This is a repository containing some of the common data structures and algorithms taught in [The Odin Project](https://www.theodinproject.com/) curriculum. The goal was to learn basic computer science concepts.
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
### Implementing a linked list in ruby with the following methods.
* #append(value) - adds a new node to the end of the list
* #prepend(value) - adds a new node to the start of the list
* #size returns the total number of nodes in the list
* #head returns the first node in the list
* #tail returns the last node in the list
* #at(index) returns the node at the given index
* #pop removes the last element from the list
* #contains? (value) returns true if the passed-in value is in the list and otherwise returns false
* #find(value) returns the index of the node containing a value, or nil if not found
* #to_s represent your LinkedList objects as strings, so you can print them out and preview them in the console
* #insert_at(value, index) that inserts a new node with the provided value at the given index
* #remove_at(index) that removes the node at the given index

## 2. Hash map
### Implementing a HashMap in ruby with the following methods.
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

## 3. Binary Search Trees
### Implementing a Binary Search Tree in ruby with the following methods.
* #build_tree - takes an array of data and turns it into a balanced binary tree
* #insert and #delete method which accepts a value to insert/delete
* #find - accepts a value and returns the node with the given value
* #level_order - accepts a block, traverses the tree in breadth-first level order, and yields each node to the provided block
* #inorder, #preorder, and #postorder - accepts a block, each method should traverse the tree in their respective depth-first order and yield each node to the provided block
* #height - accepts a node and returns its height
* #depth - accepts a node and returns its depth
* #balanced? - checks if the tree is balanced
* #rebalance - rebalances an unbalanced tree

### Write a driver script that does the following:
1. Create a binary search tree from an array of random numbers (Array.new(15) { rand(1..100) })
2. Confirm that the tree is balanced by calling #balanced?
3. Print out all elements in level, pre, post, and in order
4. Unbalance the tree by adding several numbers > 100
5. Confirm that the tree is unbalanced by calling #balanced?
6. Balance the tree by calling #rebalance
7. Confirm that the tree is balanced by calling #balanced?
8. Print out all elements in level, pre, post, and in order
