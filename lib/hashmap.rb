# Hashmap implementation
class HashMap
    LOAD_FACTOR = 0.75
    INITIAL_CAPACITY = 16

    attr_accessor :bucket_size, :bucket_capacity, :bucket

    def initialize
        @bucket_capacity = INITIAL_CAPACITY
        @bucket_size = 0
        @bucket = Array.new(bucket_capacity) {[]}
    end

    # Grows bucket when load factor reached
    def grow_bucket
        # Make a copy of old bucket
        old_bucket = @bucket.dup
        @bucket_capacity *= 2
        @bucket_size = 0
        @bucket = Array.new(bucket_capacity) {[]}

        # Rehashing: iterate over eack key value pair in the old bucket 
        old_bucket.each do |arr|
            arr.each do |key, value|
                # Rehashing key value pair to new bucket
                set(key, value)
            end
        end
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
        # Grows bucket when load factor is reached
        if (bucket_size.to_f / bucket_capacity) > LOAD_FACTOR
            grow_bucket
        end

        # hash the key and mod by bucket capacity to get index
        index = hash(key) % bucket_capacity

        arr = bucket[index]

        # Checks if arr contains a similer key
        # If key is present pair is asigned the kv_pair variable else kv_pair remains empty
        kv_pair = arr.find {|pair| pair[0] == key}

        # If key to be inserted is similer to key in kv_pair
        # Overwrite the existing value else if empty insert new kv_pair
        if kv_pair
            kv_pair[1] = value
        else
            @bucket_size += 1
            arr << [key, value]
        end
    end

    # Getter method
    def get(key)
        # hash the key and mod by backet capacity to get index
        index = hash(key) % bucket_capacity

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

        # hash the key and mod by backet capacity to get index
        index = hash(key) % bucket_capacity

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
        bucket_size
    end

    # Removes all entries in the hash map
    def clear
        @bucket_capacity = INITIAL_CAPACITY
        @bucket_size = 0
        @bucket = Array.new(bucket_capacity) {[]}
    end

    # Retuna an array containing all the keys in the hashmaol
    def keys
        arr_of_keys = []

        @bucket.each do |arr|
            arr.each do |pair|
                arr_of_keys << pair[0]
            end
        end
        arr_of_keys
    end
end

hashmap = HashMap.new
p hashmap.bucket
puts "\n"
hashmap.set('Fries', 100)
hashmap.set('Hot dog', 150)
hashmap.set('Fries masala', 200)
hashmap.set('Samaosa', 50)
hashmap.set('Fish', 300)
hashmap.set('Chicken', 200)
hashmap.set('Fresh juice', 100)
hashmap.set('Burger', 400)
hashmap.set('Pizza', 900)
hashmap.set('Ice cream', 1000)
hashmap.set('Salad', 100)
hashmap.set('Sea food', 1800)
hashmap.set('Chapati', 50)
p hashmap.bucket_size
puts "\n"
p hashmap.bucket
puts "\n"
hashmap.set('Pilau', 500)
p hashmap.bucket_size
puts "\n"
p hashmap.bucket
puts "\n"
p hashmap.keys