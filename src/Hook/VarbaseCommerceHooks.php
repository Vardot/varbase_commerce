<?php

declare(strict_types=1);

namespace Drupal\varbase_commerce\Hook;

use Drupal\Core\Hook\Attribute\Hook;
use Drupal\Core\Routing\RouteMatchInterface;
use Drupal\views\ViewExecutable;

/**
 * Hook implementations for the Varbase Commerce module.
 */
class VarbaseCommerceHooks {

  /**
   * Constructs a VarbaseCommerceHooks object.
   *
   * @param \Drupal\Core\Routing\RouteMatchInterface $routeMatch
   *   The current route match.
   */
  public function __construct(
    protected RouteMatchInterface $routeMatch,
  ) {}

  /**
   * Implements hook_views_query_alter().
   *
   * Limits the related-products block on a product page to other products that
   * share a category with the product being viewed.
   */
  #[Hook('views_query_alter')]
  public function viewsQueryAlter(ViewExecutable $view): void {
    // Get related products from the current product page category.
    if ($view->id() == 'products' && $view->current_display == 'related_products_block') {
      $product = $this->routeMatch->getParameter('commerce_product');
      // Exclude the current product.
      if ($product) {
        $view->query->addWhere('1', 'commerce_product_field_data.product_id', $product->id(), '<>');
        if ($categories = $product->field_category->getValue()) {
          $category_ids = [];
          foreach ($categories as $category) {
            $category_ids[] = $category['target_id'];
          }
          if (!empty($category_ids)) {
            $view->query->where[0]['conditions'][0]['value'][':commerce_product__field_category_field_category_target_id[]'] = $category_ids;
          }
        }
      }
    }
  }

}
