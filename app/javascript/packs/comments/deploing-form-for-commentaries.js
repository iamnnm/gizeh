export default function deploingFormForCommentaries () {
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
}
