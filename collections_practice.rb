require 'pry'
# begins_with_r iterates through an array of tools
# with .each and for each element sets check_for_r
# equal to the boolean return value of x.start_with?("r").
# Thus if our start_with? method returns false (aka returns !check_for_r)
# the program exits the method and returns true. Else, the code
# block finishes and the method returns true

def begins_with_r(tools)
  tools.each do |x|
    check_for_r = x.start_with?("r")
    if !check_for_r
      return false
    end
  end
  return true
end

# contain_a simply uses .each to run through the argument passed in
# and then the .include? method on each string in the array makes
# it easy for us to shovel the input array strings containing "a".
# No 'else', and return the new_array.

def contain_a(array)
  new_array=[]
  array.each do |string|
    if string.include? "a"
      new_array << string
    end
  end
  return new_array
end

# first_wa tests show that the input array will include both symbol
# and string elements that could begin with 'wa'. To efficiently use
# our .start_with? method, on each iteration of each_with_index
# we can convert each element to string and then if that string
# starts with 'wa', we can return the original element at that index.
# This way, even if we convert a symbol to string and that ends up the
# return value, we still return the symbol that begins with 'wa' and not
# a string.

def first_wa(array)
  array.each_with_index do |element, index|
    if element.to_s.start_with?("wa")
      return array[index]
    end
  end
end

# remove_non_strings should be able to simply delete_if the element does
# not belong to the class String aka if element.class != String. Remember
# .delete_if will mutate the array it operates on and return an array
# containing the deleted elements. Class types are written capitalized
# and without quotes. Here the delete_if code block is fairly simple so
# we can reasonably use inline style.

def remove_non_strings(array)
  array.delete_if {|x| x.class != String}
end

# count_elements takes in an array of objects each containing :name => "the name"
# key value pairs.

def get_unique_elements(array)
  unique_elements = array.uniq
end

def set_counter_array(unique_elements)
  object_count_template = []
  for counter in (0..unique_elements.size-1)
    object_count_template[counter] = 0
  end
  return object_count_template
end

def count_unique_element_instances(unique_elements, object_count, array)
  unique_elements.each_with_index do |uniq_object, index|
    array.each do |original_object|
      if uniq_object == original_object
        object_count[index] += 1
      end
    end
  end
  return object_count
end

def get_unique_keys(unique_elements)
  unique_keys = unique_elements.collect {|x| x.keys}
  unique_keys.flatten
end

def make_final_array(unique_elements,object_count, unique_keys)

  final_array = []

  unique_keys.each_with_index do |key, index|
    final_array << {key => unique_elements[index][key],:count => object_count[index]}
  end

  return final_array

end

def count_elements(array)
  unique_elements = get_unique_elements(array)
  object_count = set_counter_array(unique_elements)
  object_count = count_unique_element_instances(unique_elements, object_count, array)
  unique_keys = get_unique_keys(unique_elements)
  final_array = make_final_array(unique_elements,object_count,unique_keys)
end

# merge_data combines two nested data structures into one. This is
# cheesy, its not clear if the method will always know that the
# data array only has one element, or if we need to design it to
# work when data array contains n elements.

def merge_data(keys,data)
  a = data[0].keys
  b = []
  keys.each_with_index do |key,index|
    b << key.merge!(data[0][a[index]])
  end
  return b
end

# find_cool easy after the ridiculous troubleshooting for problem above

def find_cool(cool)
  b = []
  cool.each do |object|
    a = object.keys
    a.each do |key|
      if object[key]=="cool"
        b << object
      end
    end
  end
  return b
end

# organize_schools

schools =   {
      "flatiron school bk" => {
        :location => "NYC"
      },
      "flatiron school" => {
        :location => "NYC"
      },
      "dev boot camp" => {
        :location => "SF"
      },
      "dev boot camp chicago" => {
        :location => "Chicago"
      },
      "general assembly" => {
        :location => "NYC"
      },
      "Hack Reactor" => {
        :location => "SF"
      }
    }

def organize_schools(schools)
  locations = []

   schools.each do |school, location_info|
     location_info.each do |key,location|
       locations << location
     end
   end

   unique_locations = locations.uniq

   schools_by_location = {}

   unique_locations.each do |location|
     schools_by_location[location] = []
   end

   schools.each do |school,location_info|
     location_info.each do |key,location|
       schools_by_location[location]<<school
     end
   end
   return schools_by_location
   binding.pry
end
