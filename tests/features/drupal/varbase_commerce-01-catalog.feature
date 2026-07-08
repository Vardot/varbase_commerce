@varbase_commerce @commerce @catalog
Feature: Varbase Commerce products catalog page
  As an anonymous visitor
  I want to open the products catalog / search page
  So that I can browse the store merchandise

  # Grounded in config/optional/views.view.products_search.yml
  #   display "products_search" (page) path: /search
  #   default title: "Search", empty text: "No products found."
  #   access: permission "view commerce_product" (CI recipe must grant it to anonymous)

  Scenario: Anonymous visitor sees the products catalog page with its heading
    Given I am an anonymous visitor
    When I am on "/search"
    Then I should see "Search"

  @wip
  Scenario: An empty catalog shows the "no products found" message
    # Provided empty-state behaviour of the Products Search view (views.view.products_search.yml).
    # Valid on a fresh site before any product is indexed.
    Given I am an anonymous visitor
    When I am on "/search"
    Then I should see "No products found."
