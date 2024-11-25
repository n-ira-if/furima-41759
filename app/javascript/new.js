const setupPriceCalculation = () => {
  const priceInput = document.getElementById('item-price');
  const addTaxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

    priceInput.addEventListener('input', () => {
      const price = parseInt(priceInput.value); // 入力値を整数に変換
      const tax = Math.floor(price * 0.1);
      const profitAmount = price - tax;
      addTaxPrice.textContent = tax;
      profit.textContent = profitAmount;
    });
};

document.addEventListener('DOMContentLoaded', setupPriceCalculation);
document.addEventListener('turbo:load', setupPriceCalculation);
document.addEventListener('turbo:render', setupPriceCalculation);
