package dal

class InventoryUpdate {

  def updateInventory(productId: Long, quantity: Int, inventoryMethod: Int) {
    if (inventoryMethod == 0) {
      println("Update Inventory with FIFO ")
    } else {
      println("Update Inventory with 0")
    }
  }
}
