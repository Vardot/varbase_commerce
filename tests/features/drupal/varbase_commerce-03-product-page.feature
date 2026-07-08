@varbase_commerce @commerce @product @wip
Feature: Varbase Commerce product page and add to cart
  As an anonymous visitor
  I want to open a published product page
  So that I can read the product and add it to my cart

  # @wip — data dependent: needs a default Commerce store AND at least one published
  # "Physical" product (with a priced variation) seeded by the CI/test recipe.
  # Replace "Varbase Test Product" with the seeded product title (see NOTES.md).
  # Grounded in: commerce_product_type "physical" + Commerce add-to-cart form
  # (default submit label "Add to cart").

  Scenario: A published product page shows the title and an add-to-cart button
    Given I am an anonymous visitor
    When I am on "/product/1"
    Then I should see "Varbase Test Product"
    And "input[value='Add to cart']" should be visible

  Scenario: Adding a product to the cart confirms it was added
    Given I am an anonymous visitor
    When I am on "/product/1"
    And I press "Add to cart"
    And wait for AJAX to finish
    Then I should see "Varbase Test Product added to your cart."
