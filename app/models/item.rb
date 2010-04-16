class Item < Product

def self.item_lists (page, per_page)
  lists = paginate :page => page, 
                   :per_page => per_page,
                   :order => "name"
end
end