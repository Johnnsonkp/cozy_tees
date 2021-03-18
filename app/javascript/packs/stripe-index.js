let buttons = document.querySelectorAll('.pay-btn');

buttons.forEach(btn => {
    btn.addEventListener('click', createSession)
})

function createSession(event) {
    const button = event.target
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