class Array
    def my_each(&prc)
        self.length.times do |i|
            prc.call(self[i])
        end
        self
    end

    def my_select(&prc)
        selected=[]
        self.my_each do |num|
            selected << num if prc.call(num)
        end
        selected
    end

    def my_reject(&proc)
        rejected = []
        self.my_each do |num|
            rejected << num if proc.call(num) == false
        end
        rejected
    end

    def my_any?(&proc)
        self.my_each do |num|
            return true if proc.call(num)
        end
    end
    def my_all?(&proc)
        self.my_each do |num|
            return false unless proc.call(num)
        end
    end

    def my_flatten
        flattened = []
        self.my_each do |e|
            if e.is_a?(Array)
                flattened.concat(e.my_flatten)
            else
                flattened << e  
            end
        end
        flattened
    end

    def my_join(string ="")
        res=""
        self.length.times do |i|
            res += self[i]
            res += string unless i = self.length -1
        end
        res
    end
    
    def my_reverse
        reversed = []
        slef.each do |e|
            reversed.unshift(e)
        end
        reversed
    end

    def my_rotate(position=1)
        split_idx = position % self.length
        self.drop(split_idx) + self.take(split_idx)
    end


end