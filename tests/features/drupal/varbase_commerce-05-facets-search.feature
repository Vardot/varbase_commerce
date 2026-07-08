@varbase_commerce @commerce @facets @search @wip
Feature: Varbase Commerce catalog facets and keyword search
  As an anonymous visitor
  I want to filter the catalog by category and search by keyword
  So that I can find products

  # @wip — depends on indexed products AND the exposed-form / facet blocks being placed.
  # Grounded in:
  #   config/optional/facets.facet.category.yml
  #     id: category, name: "Category",
  #     source: search_api:views_block__products_search__all_products_block
  #   config/optional/views.view.products_search.yml (page /search)
  #     exposed fulltext filter, label "Search" (exposed_block: true — placed as a block)
  #   config/optional/search_api_autocomplete.search.products_search.yml (autocomplete)
  # The "Category" facet source is the all_products_block block display, so both the
  # all_products_block and the Category facet block must be placed on a page, and the
  # products index must contain at least one indexed product for the facet to appear.

  Scenario: The Category facet appears on the catalog
    Given I am an anonymous visitor
    When I am on "/search"
    Then I should see "Category"

  Scenario: The catalog exposes a keyword Search filter
    Given I am an anonymous visitor
    When I am on "/search"
    Then I should see "Search"
    And "input.form-search, input[type='search'], input[name='search_api_fulltext']" should be visible
