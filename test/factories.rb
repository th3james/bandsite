Factory.define :song do |s|
  s.sequence(:name) { |n| "Song#{n}"}
  s.url '<object height="81" width="100%"> <param name="movie" value="http://player.soundcloud.com/player.swf?url=http%3A%2F%2Fsoundcloud.com%2Fbarcode-channel%2Fash-used-escape-rope"></param> <param name="allowscriptaccess" value="always"></param> <embed allowscriptaccess="always" height="81" src="http://player.soundcloud.com/player.swf?url=http%3A%2F%2Fsoundcloud.com%2Fbarcode-channel%2Fash-used-escape-rope" type="application/x-shockwave-flash" width="100%"></embed> </object>  <span><a href="http://soundcloud.com/barcode-channel/ash-used-escape-rope">Ash Used Escape Rope</a>  by  <a href="http://soundcloud.com/barcode-channel">Barcode Channel</a></span>  <br/>'

end

Factory.define :post do |p|
  p.sequence(:title) { |n| "Post #{n}"}
  p.body "This is a test post"
end
