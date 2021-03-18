const button = document.querySelector("[data-stripe='payment']");
if (button) {
    const {sessionId, publicKey} = button.dataset

  button.addEventListener('click', createSession) 
}
function createSession(event) {
  button.setAttribute("disabled", true);
  button.innerHTML = "Loading"

  const csrfToken = document.querySelector("[name='csrf-token']").content
  const {listingId, publicKey, path} = button.dataset;
  fetch(path, {
      method: "POST", 
      headers : {
      "X-CSRF-Token": csrfToken,
      "Content-Type": "application/json"
      },
      body: JSON.stringify({id: listingId})
  })
  .then(response => response.json())
  .then(data => {
      const {sessionId} = data;
      const stripe = Stripe(
      publicKey
      );
      stripe.redirectToCheckout({
      sessionId: sessionId
      });
  })
}
