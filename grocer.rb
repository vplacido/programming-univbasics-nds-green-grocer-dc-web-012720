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
  coupons.each do |coupon| 
    coupon.each do |attribute, value| 
      name = coupon[:item] 
    
      if cart[name] && cart[name][:count] >= coupon[:num] 
        if cart["#{name} W/COUPON"] 
          cart["#{name} W/COUPON"][:count] += 1 
        else 
          cart["#{name} W/COUPON"] = {:price => coupon[:cost], 
          :clearance => cart[name][:clearance], :count => 1} 
        end 
  
      cart[name][:count] -= coupon[:num] 
    end 
  end
end 
  cart 
end
  

def apply_clearance(cart)
  i = 0 
  while i < cart.length do 
    if cart[i][:clearance]
      cart[i][:price] *= 0.8
      cart[i][:price] = cart[i][:price].round(2)
    end 
    i += 1
  end 
  cart
end

def checkout(cart, coupons)
  total = 0.0 
  newCart = consolidate_cart(cart)
  couponCart = apply_coupons(newCart,coupons) 
  finalCart = apply_clearance(couponCart)
  i = 0 
  while i < finalCart.length do 
    total += (finalCart[i][:price] * finalCart[i][:count])
    i += 1 
  end
  if total > 100
    total *= 0.9
  end 
  total.round(2)
end
