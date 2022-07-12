Item.destroy_all
Order.destroy_all
User.destroy_all

user = User.create!(email: 'gamgam@gnf.com', password: 'Password1')
admin = User.create!(email: 'meemaw@gnf.com', password: 'Password1', admin: true)

user_id_array = [user.id, admin.id]

type_array = ["pizza", "burger", "salad", "drink", "app_side"]
pizza_toppings_array = ["pepperoni", "mushrooms", "olives", "sausage"]
burger_toppings_array = ["cheese", "lettuce", "pickles", "onions"]
salad_toppings_array = ["carrots", "croutons", "dressing"]
size_array = ["small", "medium", "large"]
app_side_array = ["fries", "mozzy sticks", "spinach & artichoke dip", "grandma's salty buscuit"]
drink_type_array = ["soda", "beer", "wine", "milkshake"]

2.times do |i|
  order = Order.create!(total_cost: 0, user_id: user_id_array.sample)
  p "Order created by #{order.user.email.split('@')[0].capitalize}."
  5.times do |i|
  
  food_type = type_array.sample
  pizza_size = size_array.sample

  if food_type == "pizza" && pizza_size == "small"
    item = Item.create!(
      dish: "pizza",
      toppings: pizza_toppings_array.sample(Faker::Number.between(from: 1, to: 10)),
      size: "small",  
      order_id: order.id
    )
    item.cost = (item.toppings.count * 1) + 10
    item.save
    p "Your small pizza with #{item.toppings} costs #{item.cost} dollars"
    order.total_cost += item.cost

    elsif food_type == "pizza" && pizza_size == "medium"
      item = Item.create!(
        dish: "pizza",
        toppings: pizza_toppings_array.sample(Faker::Number.between(from: 1, to: 10)),
        size: "medium", 
        order_id: order.id 
      )
      item.cost = (item.toppings.count * 1) + 13
      item.save
      p "Your medium pizza with #{item.toppings} costs #{item.cost} dollars"
      order.total_cost += item.cost

    elsif food_type == "pizza" && pizza_size == "large"
      item = Item.create!(
        dish: "pizza",
        toppings: pizza_toppings_array.sample(Faker::Number.between(from: 1, to: 10)),
        size: "large",
        order_id: order.id  
      )
      item.cost = (item.toppings.count * 1) + 16
      item.save
      p "Your large pizza with #{item.toppings} costs #{item.cost} dollars"
      order.total_cost += item.cost

    elsif food_type == "burger"
      item = Item.create!(
        dish: food_type,
        toppings: burger_toppings_array.sample(Faker::Number.between(from: 1, to: 10)),
        order_id: order.id  
      )
      item.cost = (item.toppings.count * 1) + 10
      item.save
      p "Your burger with #{item.toppings} costs $#{item.cost} dollars"
      order.total_cost += item.cost

    elsif food_type == "drink"
      item = Item.create!(
        dish: food_type,
        cost: 5,
        drink_type: drink_type_array.sample,
        order_id: order.id  
      )
      p "Your #{item.drink_type} costs #{item.cost} dollars."
      order.total_cost += item.cost

    elsif food_type == "app_side"
      item = Item.create!(
        dish: food_type,
        cost: 5,
        app_side: app_side_array.sample,
        order_id: order.id  
      )
      p "Your app/side of #{item.app_side} costs #{item.cost} dollars."
      order.total_cost += item.cost

    elsif food_type == "salad"
      item = Item.create!(
        dish: food_type,
        toppings: salad_toppings_array.sample(Faker::Number.between(from: 1, to: 10)),#Faker::Number
        order_id: order.id  
      )
      item.cost = (item.toppings.count * 1) + 10
      item.save
      p "Your salad with #{item.toppings} costs $#{item.cost} dollars"
      order.total_cost += item.cost
    end
  end
  order.save
  p"....."
  p "This order costs $#{order.total_cost}."
  p "--------------------------------------------"
end