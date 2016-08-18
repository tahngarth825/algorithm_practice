//isBalancedTree
//
// Write a JavaScript function to check if a binary tree is balanced.
// A tree is balanced if, at every node, the depth of subtree on the left
// hand side is equal to the depth of the subtree on the right (plus or minus one).


// check that depth of left and right are same, then run isBalancedTree on
// both subtrees until one tree has depth 0 and the other has depth 0 or 1
function isBalancedTree(root){
  let left_depth = findDepth(root.left);
  let right_depth = findDepth(root.right);

  if (Math.abs(left_depth - right_depth) > 1) {
    return false;
  }

  if (isBalancedTree(root.left) === false || isBalancedTree(root.right) === false){
    return false;
  }

  return true
}


//Easier findDepth
// Put each level into an array where the index is the row and keep going down
// until no children; deepest level is level of tree, plus I have an array
// of the rows of the tree

function findDepth(root){
  let tree = [];

  let rowNum = 0;
  let curRow = extractChildren(root);

  while (curRow.length > 0){
    tree.push(dup(curRow));
    curRow = [];

    tree[rowNum].forEach(function(node){ //this is going through a row in the tree
      curRow = curRow.concat(extractChildren(node));
    });

    rowNum += 1;
  }
  //rowNum will be 1 larger than the "index", but this will be the "actual" level
  return rowNum;
}

function extractChildren(root){
  let results = [];

  if (root.left !== null){
    results.push(root.left);
  }

  if (root.right !== null){
    results.push(root.right);
  }

  return results;
}

function dup(arr){
  let results = [];

  arr.forEach(function(el){
    results.push(el);
  });

  return results;
}




//More Annoying findDepth pseudocode
// R2{
//   R1
//   F3: Then, go up. If there's no right, go up again until node is root
//     or there is a right. If there's a right, go right. check depth.
// }
//   R1{
//     F1: Go bottom left as much as you can, counting depth. Add this to an above counter.
//     F2: Then go right, check depth,
//   }
//
//
// counting depth
// function findDepth(root){
//   root.color = "white";
//   let maxDepth = 1;
//   let curDepth = 1;
//   let nextRoot = root;
//
//   if (root.left === null) {
//     if (root.right === null){
//       root.color = "black";
//     } else {
//       root.color = "grey";
//     }
//   }
//
//   while (root.color !== "black") {
//     while (root.color !== "grey") {
//       nextRoot = nextRoot.left;
//     }
//   }
// }
