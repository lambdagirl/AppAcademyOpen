class Array
    def my_each(&prc)
        self.length.times do |i|
            prc.call(self[i])
    end
    self
end 