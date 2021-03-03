function price() {
  const proper = document.getElementById("item-price");
  proper.addEventListener("input", function(){
    const value = proper.value
    if (value >= 300 | value <= 9999999) {
        const fee = value * 0.1;
        const profit = value - fee;
        document.getElementById('add-tax-price').innerHTML = fee;
        document.getElementById('profit').innerHTML = profit;
    }
  })
};
window.addEventListener("load", price)