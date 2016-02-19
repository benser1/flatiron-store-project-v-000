class Cart < ActiveRecord::Base
   has_many :line_items
   has_many :items, through: :line_items
   belongs_to :user
   belongs_to :order
   has_one :status, through: :order

   def total
      line_items.collect do |line_item| 
         line_item.quantity * line_item.item.price
      end.inject(:+)
   end

   def add_item(item)
      add_item = line_items.find_by(id: item)

      if add_item
         add_item.quantity += 1
      else 
         add_item = self.line_items.build(item_id: item)
         add_item.quantity = 1
      end
      add_item
   end ## add item end


end #ends class
