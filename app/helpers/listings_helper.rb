module ListingsHelper

    # def listing_img(input)
    #     if input.picture.attached?
    #         input.picture
    #     else
    #         input = 'ky-jersey.jpg'
    #     end
    # end 

    def cents_to_dollars(input)
        number_with_precision input/100, precision: 2
    end
    
    def each_category(input)
        input.each do |cat|
            cat.name
        end
    end

end
