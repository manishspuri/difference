module Difference
   class ActiveRecord::Base
	   def differs_from(object,opt={})
		   raise "Can't compare objects of different Class." if self.class.name != object.class.name

		   # Set attribute list to compare.
		   diff={}
		   attr_list = clean_attr(self.attributes.keys)
		   attr_list = attr_list - clean_attr(opt[:ignore_attributes])
		   attr_list = attr_list &  clean_attr(opt[:only_attributes]) if opt[:only_attributes].present?
		   attr_list.each do |attr|
		     (diff[attr.to_sym] = [self[attr],object[attr]]) if self[attr] != object[attr]
		   end
		diff
	   end

	   private 
		   def clean_attr(collection)
		    collection.present? ? collection.to_a.collect{|e| e.to_sym if e.present?}  : []
		   end
  end
  
end
