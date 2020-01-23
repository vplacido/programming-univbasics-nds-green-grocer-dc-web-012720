def find_item_by_name_in_collection(name, collection)
  i = 0 
  while i < collection.length do 
    if (name == collection[i][:item])
      return collection[i]
    end
    i+=1 
  end 
  return nil 
end

def consolidate_cart(cart)
  newArr = []
  i = 0
  while i < cart.length do
    nameOfItem = cart[i][:item]
    itemInfo = find_item_by_name_in_collection(cart[i][:item], newArr)
    if itemInfo
      itemInfo[:count] += 1
    else  
      newArr << {
        :item => cart[i][:item],
        :price => cart[i][:price],
        :clearance => cart[i][:clearance],
        :count => 1
      }
    end
    i += 1
  end 
  newArr
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  newArr = []
  i = 0 
  while i < coupons.length do 
    item = find_item_by_name_in_collection(coupons[i][:item], cart)
    newItem = find_item_by_name_in_collection(coupons[i][:item]+" W/COUPON", cart)
    if 
  
  newArr
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  i = 0 
  while i < cart.length do 
    if cart[i][:clearance]
      cart[i][:price] *= 0.8
    end 
    i += 1
  end 
  cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
  total = 0.0 
  newCart = consolidate_cart(cart)
  finalCart = apply_clearance(apply_coupons(newCart, coupons))
  i = 0 
  while i < finalCart.length do 
    total += finalCart[i][:price] * finalCart[i][:count]
    i += 1 
  end
  if total > 100
    return total * 0.9
  end 
  total 
end
