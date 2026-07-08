@varbase_commerce @commerce @admin
Feature: Varbase Commerce admin — product type, products listing and store
  As a Webmaster
  I want the shipped Commerce product type and the products administration to be in place
  So that I can merchandise the catalog

  # Grounded in:
  #   config/optional/commerce_product.commerce_product_type.physical.yml
  #     id: physical, label: "Physical", variationType: physical
  #   Commerce provides the admin routes:
  #     /admin/commerce/config/product-types  (Product types)
  #     /admin/commerce/products              (Products listing)
  #     /admin/commerce/config/stores         (Stores)

  Scenario: The shipped "Physical" product type is listed
    Given I am a logged in user with the "Webmaster" user
    When I open the administration page "/admin/commerce/config/product-types"
    Then I should see "Physical"

  Scenario: The products administration lists products and offers to add one
    Given I am a logged in user with the "Webmaster" user
    When I open the administration page "/admin/commerce/products"
    Then I should see "Products"
    And I should see "Add product"

  Scenario: The Commerce stores administration is reachable
    Given I am a logged in user with the "Webmaster" user
    When I open the administration page "/admin/commerce/config/stores"
    Then I should see "Stores"
