package dal

class InventoryUpdate {

  def updateInventory(productId: Long, quantity: Int, inventoryMethod: Int) {
    if (inventoryMethod == 0) {
      val updateMethod = new FIFOInventoryUpdate()
      println("Update Inventory with FIFO " + updateMethod.updateInventory(productId, inventoryMethod))
    } else {
      println("Update Inventory with 0")
    }
  }
}
