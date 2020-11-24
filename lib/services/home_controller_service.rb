module Services
    class HomeControllerService
        def self.index
            data = {}

            # This can be improved
            Article.pluck(:category).uniq.each do |c| 
                data[c] = Article.where(category: c).limit(3)
            end
            
            data
        end
    end
end