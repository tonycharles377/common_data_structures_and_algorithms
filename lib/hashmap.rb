# Hashmap implementation
class HashMap
    LOAD_FACTOR = 0.75

    attr_accessor :arr_size, :arr_capacity, :arr

    def initialize
        @arr_size = 16
        @arr_capacity = 0
        @arr = Array.new(arr_size) {[]}
    end
end

hashmap = HashMap.new
p hashmap.arr
p hashmap.arr_size