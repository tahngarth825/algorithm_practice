// ## `filterLinkedList`
//
// Write a double-ended `LinkedList` class in JavaScript.
//
// * You should have a `Link` class
//     * Write `next` and `prev` methods.
//     * You should write a `remove` method.
//     * You should write an `insert` method that inserts an item after
//       the current link.
// * You should have a `LinkedList` class
//     * It should have `first` and `last` methods to return the
//       first/last links in the list.
//     * It should have `push` and `pop` methods.
//
// Given a linked list of integers and an integer value, delete every
// node of the linkedlist containing that value. Use JavaScript.

const Link = function(value){
  this.value = value;
  this.next = null;
  this.prev = null;
};

Link.prototype.remove = function(){
  this.prev.next = this.next;
  this.next.prev = this.prev;
  this.value = null;

  return this.next;
};

Link.prototype.insert = function(value){
  let newLink = new Link(value);

  if (this.next) {
    this.next.prev = newLink;
    newLink.next = this.next;
  }
  this.next = newLink;
  newLink.prev = this;
};

const LinkedList = function(){
  this.first = null;
  this.last = null;
};

LinkedList.prototype.push = function(value){
  let link = new Link(value)

  if (this.first === null) {
    this.first = link;
    this.last = link;
  } else {
    this.last.insert(value);
    this.last = this.last.next;
  }
};

LinkedList.prototype.pop = function () {
  let result = this.last;

  if (this.first === this.last) {
    this.first = null;
    this.last = null;
  } else {
    this.last = this.last.prev;
  }

  return result;
};

function filterLinkedList(linkedList, value){
  let current = linkedList.first;

  while (current !== null) {
    if (current.value === value){
      current = current.remove();
    } else {
      current = current.next;
    }
  }

  return linkedList;
}
