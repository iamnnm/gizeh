export default function closeFormAfterSubmit() {
    const replies = document.querySelectorAll('.close-form');

    for (let reply of replies) {
        reply.onclick = () => {
            reply.parentElement.parentElement.parentElement.classList.toggle('dnone');
            reply.parentElement.parentElement.parentElement.previousElementSibling.firstElementChild.innerHTML = 'replay';
        }
    }
}
