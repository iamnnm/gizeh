import CorrectPositionOfNotice from './correct-position-of-notice';

export default function addNotice(status, message) {
    let div = document.createElement('div');
    div.className = `info ${status}`;
    div.innerHTML = `${message}`;
    document.querySelector('#ajax-notice-insert').before(div);
    CorrectPositionOfNotice();
}
