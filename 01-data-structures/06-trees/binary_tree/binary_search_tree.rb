require_relative 'node'

class BinarySearchTree

 def initialize(root)
   @root = root
   @size = 1
 end

 def insert(root, node)
   if node == nil
     return
   end

   if node.rating < root.rating
     if root.left == nil
       root.left = node
     else
       insert(root.left, node)
     end
   elsif node.rating >= root.rating
     if root.right == nil
       root.right = node
     else
       insert(root.right, node)
     end
   end
 end

 # Recursive Depth First Search
 def find(root, data)
   if data == nil
     return nil
   end

   if root.title == data
     return root
   elsif root.left != nil && root.left.title == data
     return root.left
   elsif root.right != nil && root.right.title == data
     return root.right
   end

   if root.left != nil
     node = find(root.left, data)
   end

   if root.right != nil
     node = find(root.right, data)
   end

   return node
 end

 def delete(root, data)
   if root == nil || data == nil
     return nil
   end

   if root.left != nil && root.left.title == data
     old_left = root.left

     # Set the new left of the current root to the left child's left child
     root.left = old_left.left


     # Set the left child's children to nil to cut it out of the tree
     old_left.left = nil
     old_left.right = nil

     # We need to re-insert the left child's right child since it will otherwise be lost
     insert(@root, old_left.right)
   end

   if root.right != nil  && root.right.title == data
     old_right = root.right

     # Set the new left of the current root to the right child's left child
     root.right = old_right.left

     # Set the left child's children to nil to cut it out of the tree
     old_right.left = nil
     old_right.right = nil

     # We need to re-insert the right child's right child since it will otherwise be lost
     insert(@root, old_right.right)
   end

   if root.left != nil
     delete(root.left, data)
   end

   if root.right != nil
     delete(root.right, data)
   end

 end

 # Recursive Breadth First Search
 def printf(children=nil)
   if children == nil
     children = [@root]
   elsif children.size == 0
     return
   end

   new_children = []
   children.each do |child|
     if child == nil
       next
     end

     puts "#{child.title}: #{child.rating}"

     $stdout.flush
     new_children.push(child.left)
     new_children.push(child.right)
   end

   printf(new_children)
 end
end
