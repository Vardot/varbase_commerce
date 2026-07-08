@varbase_commerce @commerce @wishlist
Feature: Varbase Commerce wishlist
  As a user who can use the wishlist
  I want to open my wishlist page
  So that I can review the products I saved

  # Grounded in:
  #   config/optional/flag.flag.wishlist.yml (the "wishlist" flag)
  #   config/optional/views.view.wishlist.yml
  #     display "page_wishlist" (page) path: /user/wishlist, title "My Wishlist",
  #     access permission "flag wishlist", empty text "You have no items in your wishlist."
  # Webmaster (admin) holds the "flag wishlist" permission, so access is guaranteed.

  Scenario: The wishlist page renders with its heading
    Given I am a logged in user with the "Webmaster" user
    When I am on "/user/wishlist"
    Then I should see "My Wishlist"

  Scenario: An empty wishlist shows the empty-wishlist message
    Given I am a logged in user with the "Webmaster" user
    When I am on "/user/wishlist"
    Then I should see "You have no items in your wishlist."
