# Hashmap implementation
class HashMap
    LOAD_FACTOR = 0.75
    INITIAL_CAPACITY = 16

    attr_accessor :bucket_size, :bucket_capacity, :bucket

    def initialize
        @bucket_size = INITIAL_CAPACITY
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

    # Getter method
    def get(key)
        # hash the key and mod by 16 to get index
        index = hash(key) % bucket_size

        # Return nil if bucket at index is empty
        return nil if !bucket[index]

        arr = bucket[index]

        arr.find do |pair|
            if pair[0] == key
                return pair[1]
            end
        end
        return nil
    end

    # Return true if key is present in hashmap else false
    def has(key)
        return false if get(key) == nil
        true
    end

    # Delete pair and retuns value of deleted key
    def remove(key)
        # Return nil if key is not present
        return nil if !has(key)

        # hash the key and mod by 16 to get index
        index = hash(key) % bucket_size 

        # Delete pair and return value if key is present
        pair = []

        pair[0] = key
        pair[1] = get(key)

        arr = @bucket[index]

        arr.find do |pair_to_be_deleted|
            if pair_to_be_deleted == pair
                arr.delete(pair_to_be_deleted)
            end
        end
        pair[1]
    end

    # Return number of stored keys in hashmap
    def length
        bucket_capacity
    end

    # Removes all entries in the hash map
    def clear
        @bucket_size = INITIAL_CAPACITY
        @bucket_capacity = 0
        @bucket = Array.new(bucket_size) {[]}
    end
end

hashmap = HashMap.new
p hashmap.bucket
puts "\n"
p hashmap.bucket_size
puts "\n"
hashmap.set('Fries', 100)
p hashmap.bucket
puts "\n"
p hashmap.get('Fries')
p hashmap.get('fries')
p hashmap.has('Fries')
p hashmap.has('fries')
puts "\n"
p hashmap.remove('fries')
p hashmap.bucket
p hashmap.length
hashmap.clear
p hashmap.bucket