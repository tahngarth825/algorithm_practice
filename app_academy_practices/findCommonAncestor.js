// Find the lowest common ancestor of two nodes in a binary search
// tree. Write the function in JS. Assume I give you both the root and
// the two nodes.

function findCommonAncestor(root, node1, node2){
  let path1 = [node1];
  let path2 = [node2]
  let prevNode = node1;

  while (prevNode.parent !== null){
    path1.push(prevNode.parent);
    prevNode = prevNode.parent;
  }

  prevNode = node2;

  while (prevNode.parent !== null){
    path2.push(prevNode.parent);
    prevNode = prevNode.parent;
  }

  path1.forEach(function(path1Node){
    path2.forEach(function(path2Node){
      if (path1Node === path2Node){
        return path1Node;
      }
    });
  });

  return root;
}
