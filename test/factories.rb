Factory.define :post do |f|
  f.sequence(:title) {|n| "Post #{n}"}
  f.body "This is the body of the post"
end
