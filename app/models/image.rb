class Image < ActiveRecord::Base
  has_attached_file :image, :styles => { :small => "600x600>", :small => "275x275#", :thumb => "100x100>" }
end
