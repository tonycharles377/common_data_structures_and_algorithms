# Hashmap implementation
class HashMap
    LOAD_FACTOR = 0.75

    attr_accessor :bucket_size, :bucket_capacity, :bucket

    def initialize
        @bucket_size = 16
        @bucket_capacity = 0
        @bucket = Array.new(bucket_size) {[]}
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

    # Setter method
    def set(key, value)
        # hash the key and mod by 16 to get index
        index = hash(key) % bucket_size

        arr = bucket[index]

        # Checks if arr contains a similer key
        # If key is present pair is asigned the kv_pair variable else kv_pair remains empty
        kv_pair = arr.find {|pair| pair[0] == key}

        # If key to be inserted is similer to key in kv_pair
        # Overwrite the existing value else if empty insert new kv_pair
        if kv_pair
            kv_pair[1] = value
        else
            @bucket_capacity += 1
            arr << [key, value]
        end
    end
end

hashmap = HashMap.new
p hashmap.bucket
puts "\n"
p hashmap.bucket_size
puts "\n"
hashmap.set('Fries', 100)
p hashmap.bucket
