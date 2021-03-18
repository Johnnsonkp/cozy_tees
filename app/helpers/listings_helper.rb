module ListingsHelper

    # def listing_img(input)
    #     if input.picture.attached?
    #         input.picture
    #     else
    #         input = 'ky-jersey.jpg'
    #     end
    # end 

    def each_category(input)
        input.each do |cat|
            cat.name
        end
    end
end
