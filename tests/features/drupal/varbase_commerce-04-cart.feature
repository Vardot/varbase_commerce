@varbase_commerce @commerce @cart
Feature: Varbase Commerce shopping cart
  As an anonymous visitor
  I want to open my shopping cart
  So that I can review the items I intend to buy

  # Grounded in the Commerce Cart module (dependency commerce:commerce_cart) which
  # provides the /cart page rendered by config/optional/views.view.commerce_cart_form.yml.
  # The module ships no custom empty text, so the standard Commerce cart page applies:
  #   page title "Shopping cart" + empty message "Your shopping cart is empty."

  Scenario: The cart page renders with the standard shopping cart heading
    Given I am an anonymous visitor
    When I am on "/cart"
    Then I should see "Shopping cart"

  Scenario: A fresh cart shows the empty-cart message
    Given I am an anonymous visitor
    When I am on "/cart"
    Then I should see "Your shopping cart is empty."
