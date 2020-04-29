# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        self.max - self.min if self.length != 0
    end
    def average
        return nil if self.empty?
        self.sum / (self.length * 1.0) 
    end
    def median
        return nil if self.empty?
        sorted =self.sort
        if self.length.odd?
            return sorted[self.length/2]
        else
            mid_index = self.length/2
            return (sorted[mid_index]+sorted[mid_index-1])/2.0
        end
    end
    def counts
        count = Hash.new(0) #{}will make default nil
        self.each { |ele| count[ele]+=1}
        count
    end

    def my_count
end
