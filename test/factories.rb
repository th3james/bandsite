FactoryGirl.define :post do |f|
  f.sequence(:title) {|n| "Post #{n}"}
  f.body "This is the body of the post"
end

FactoryGirl.define :song do |f|
  f.sequence(:name) {|n| "Song #{n}"}
  f.embed "Put an embed link here for the song"
end
