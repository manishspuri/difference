require "difference/version"

module Difference
   class ActiveRecord::Base
	   def differs_from(object,opt={})
		   return "We cannot compare objects of different classes" if self.class.name != object.class.name

		   # Set attribute list to compare.
		   diff={}
		   attr_list =self.attributes.keys
		   attr_list= attr_list - opt[:ignore_attributes].to_a if opt[:ignore_attributes].present?
		   attr_list=  opt[:only_attributes].to_a if opt[:only_attributes].present?


		   attr_list.each do |attr|
		     (diff[attr.to_sym] = [self[attr],object[attr]]) if self[attr] != object[attr]
		   end
		diff
	   end
  end
  
end
