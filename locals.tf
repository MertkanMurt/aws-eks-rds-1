locals {
  tags = (merge(
    "${var.tags}"
  ))
  newbits_per_subnet           = 6
}
