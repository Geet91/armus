connection: "engineering-test"

#include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
 include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }

access_grant: is_a_customer {
  allowed_values: ["no"]
  user_attribute: customer
}

explore: cars {
  access_filter: {
    field: car_type
    user_attribute: car_brand
  }
  # access_filter: {}
  join: organization {
    type: left_outer
    sql_on: ${cars.ao_owner_id} = ${organization.id} ;;
    relationship: many_to_one
  }
}
