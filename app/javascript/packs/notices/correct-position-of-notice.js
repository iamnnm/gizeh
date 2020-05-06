export default function CorrectPositionOfNotice() {
    const element = document.body.getBoundingClientRect();
    const gap = -57;

    if (element.top < gap) {
        const infos = document.querySelectorAll('.info');
        infos.forEach((info) => {
            info.style = 'top: 0px;';
        });
    }
    else if ( element.top > gap ) {
        const distance = Math.abs(gap) - Math.abs(element.top);
        const infos = document.querySelectorAll('.info');
        infos.forEach((info) => {
            info.style = `top: ${distance}px;`;
        });
    }
}
