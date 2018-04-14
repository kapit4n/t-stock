package dal

trait InventoryUpdateStrategy {
  def updateInventory(productId: Long, quantity: Int)
}
