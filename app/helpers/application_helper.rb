module ApplicationHelper
	# def cart_count_over_one
 #      return total_cart_items if total_cart_items > 0
 #    end

 #    def total_cart_items
 #      total = @cart.line_items.map(&:quantity).sum
 #      return total if total > 0
 #    end
   
      def cart_count_over_one
      	if @cart.line_items.count > 0
      		return "<span class='tag is-dark'>#{@cart.line_items.count}</span>".html_safe
      	end
      end

      def cart_has_items
      	return @cart.line_items.count > 0
      end

end
