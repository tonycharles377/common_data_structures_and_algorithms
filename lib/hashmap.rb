# Hashmap implementation
class HashMap
    LOAD_FACTOR = 0.75

    attr_accessor :arr_size, :arr_capacity, :arr

    def initialize
        @arr_size = 16
        @arr_capacity = 0
        @arr = Array.new(arr_size) {[]}
    end

    # Hash method
    def hash(key)
        hash_code = 0
        prime_number = 31
           
        key.each_char do  |char|
            hash_code = prime_number * hash_code + char.ord
        end  
        hash_code
    end     
end

hashmap = HashMap.new
p hashmap.arr
p hashmap.arr_size