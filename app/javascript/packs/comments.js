document.addEventListener("turbolinks:load", ()=>{
    const toggles = document.querySelectorAll('.toggle');
    const hiddenLinks = document.querySelectorAll('.hidden-link');

    for (let element of [...toggles, ...hiddenLinks]) {
        element.onclick = () => {
            for (let node of element.parentElement.children) {
                node.classList.toggle('dnone');
            }
        };
    }

    const replies = document.querySelectorAll('#reply-btn');

    for (let reply of replies) {
        reply.onclick = () => {
            if (reply.innerHTML === 'replay') {
                reply.innerHTML = 'cancel';
            } else {
                reply.innerHTML = 'replay';
            }
            reply.parentElement.nextElementSibling.classList.toggle('dnone');
        }
    }
});
