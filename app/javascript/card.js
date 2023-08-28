const pay = () => {
  const publicKey = gon.public_key;
  const payjp = Payjp(publicKey); // PAY.JPテスト公開鍵
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');

  const form = document.getElementById('charge-form');
  form.addEventListener('submit', async (e) => {
    e.preventDefault();

    const submitButton = form.querySelector('input[type="submit"]');
    submitButton.disabled = true; // 送信ボタンを無効化

    const response = await payjp.createToken(numberElement);
    
    if (response.error) {
      // エラーハンドリング: エラーメッセージの表示や必要な処理を追加
      const errorDisplay = document.getElementById('error-message');
      errorDisplay.textContent = response.error.message;

      // エラーが発生した場合、送信ボタンを再度有効化する
      submitButton.disabled = false;
    } else {
      const token = response.id;
      const renderDom = document.getElementById('charge-form');
      const tokenObj = `<input value=${token} name='token' type="hidden">`;
      renderDom.insertAdjacentHTML('beforeend', tokenObj);

      // トークンをサーバーに送信する代わりに、ここで別のカスタム処理を実行可能

      // サブミット
      document.getElementById('charge-form').submit();
    }

    numberElement.clear();
    expiryElement.clear();
    cvcElement.clear();
  });
};

window.addEventListener('turbo:load', pay);