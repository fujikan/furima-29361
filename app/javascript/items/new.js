function price(){
   const priceInput = document.getElementById("item-price");
   const add_tax = document.getElementById("add-tax-price");
   const profit = document.getElementById("profit");
     priceInput.addEventListener('keyup', () => {
         const value = priceInput.value; 
         
       if (value >= 300 && value <= 9999999){
         var fee = value /10
         var gains = value - fee
     } else {
       var fee = '-';
       var gains = '-';
      }
      add_tax.textContent = fee;
      profit.textContent = gains;
   });
  
  }
  window.addEventListener('load', price);