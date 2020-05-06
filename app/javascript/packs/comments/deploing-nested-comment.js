export default function deploingNestedComment() {
    const toggles = document.querySelectorAll('.toggle');
    const hiddenLinks = document.querySelectorAll('.hidden-link');

    for (let element of [...toggles, ...hiddenLinks]) {
        element.onclick = () => {
            for (let node of element.parentElement.children) {
                node.classList.toggle('dnone');
            }
        };
    }
}
