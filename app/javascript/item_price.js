window.addEventListener('load', ()=> {
  const priceInput = document.getElementById("item-price");
  const salesProfit = document.getElementById("profit");
  priceInput.addEventListener("input", ()=>{
    const inputValue = priceInput.value;
    const addTax = document.getElementById('add-tax-price');
    addTax.innerHTML = Math.floor(inputValue * 1/10);
    salesProfit.innerHTML = inputValue - addTax.innerHTML;
  })
})