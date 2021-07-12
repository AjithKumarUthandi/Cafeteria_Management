# [SouthIndia](https://southindia.herokuapp.com/)-online food shoping

#admin
  email: southindia@email.com
  password: southindia

#customer
  email:customer@email.com
  password:customer

In my application there are two users
  -Customer
  -Admin(Owner)

## Home page
![Common-homepageImage](/images/common-homepage.png)
-Without sign-in this is homepage() only able to see the menus if you want sign-in must.

## Sign-in page
-Sign-in() page common for both users
![Sign-inImage](/images/sign-in.png)

## Customer:
  ## Sign-up
  -If a new user sign-up().Admin cannot sign-up.
  ![Sing-upImage](/images/customer/sign-up.png)


  ## Customer home page
  -Customer can order a food.
  ![Customer-homepageImage](images/customer/customer-homepage.png)

  -Customer have two pages,choosing via dropdown and SI button in the left top title page.
  ![Customer-hover-page](images/customer/dropdown.png)

  ## Cart
  -If user add items to the cart,then appliction store the items in the database.
   so, whenever user log-in, able to see items in the cart.
  -Total odrer functinality in the cart container only.
  ![CartImage](images/customer/cart.png)

  ## Address
  -First time User can add address while ordering, other wise add on profile/address.
  ![AddressImage](images/customer/address.png)

  ## Orders
  -User need to see order status or old orders, then go profile and click order button and check.
  ![Customer-ordersImage](images/customer/orders.png)

  ## Change password
  -Click password button change password
  ![Customer-change-passwordImage](images/customer/customer-password.png)

  ## Delete Account
  -If user need destroy account click destroy button, it will ask password, enter and destroy.
  ![Delete-accoutImage](images/customer/destroy.png)


  ## Edit profile
  -If user need edit the profile, click edit profile and edit the profile.
  -Both user same way to edit the profile.
  ![Edit-profileImage](images/edit-profile.png)

## Admin(Owner)

  ## Admin Home page
  -This is admin home page and also menu category.
  ![Admin-homepageImage](images/admin/admin-homepage.png)

  -Add category, edit the categories, make active or inactive each categories and delete the category.
  -click View_items and enter the menu_items page.
  ![Add-categoryImage](images/admin/add-category.png)
  ![edit-categoryImage](images/admin/edit-category.png)

  ## Menu_item page
  -As same as menu_category functionality.
  ![MenuItemspageImage](images/admin/items-page.png)
  ![Add-itempageImage](images/admin/add-item.png)
  ![Edit-itemPage](images/admin/edit-item.png)

  ## Hover side bar
  -Using hover side bar will choose menu/orders/logout.
  ![Hover-sidebarImage](images/admin/hover-sidebar.png)

  ## Change password
  -click password button and change password.
  ![Admin-change-passwordImage](images/admin/admin-passwordchange.png)

  ## Orders
  -Can see old orders and pending orders and make complete or cancel the order.
  ![OrdersImage](images/admin/admin-orders.png)
  -click view-item and see order items
  ![Order-itemImage](images/admin/admin-view-orderitems.png)
