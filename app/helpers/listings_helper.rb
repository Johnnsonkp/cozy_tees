module ListingsHelper

    def listing_img(input)
        if input.picture.attached?
            input.picture
        else
            ''
        end
    end 
end
