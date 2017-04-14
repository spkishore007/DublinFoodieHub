require 'test_helper'

class CommentTest < ActiveSupport::TestCase
   test "comment should not save without Product id" do
     comment = Comment.new
     #comment.Product = Product.new
     assert_equal(false,comment.save)
   end
   test "should save the comment" do
     comment = Comment.new
     comment.product = Product.new
     comment.comment = "xcvb"
     comment.rating = 3
     assert_equal(true,comment.save)
   end
   test "should not save the comment with comments" do
     comment = Comment.new
     comment.product = Product.new
     #comment.comment = "xcvb"
     comment.rating = 3
     assert_equal(false,comment.save)
   end
   test "should not save the comment without rating" do
     comment = Comment.new
     comment.product = Product.new
     comment.comment = "xcvb"
     #comment.rating = 3
     assert_equal(false,comment.save)
   end
  
  # test "the truth" do
  #   assert true
  # end
end
