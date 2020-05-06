import addNotice from "../notices/add-notice";

export default function ajaxDeleteParentComment () {
    const deleteLinks = document.querySelectorAll('.delete-child-btn');

    deleteLinks.forEach((link) => {
        link.addEventListener("ajax:success", (e) => {
            const [data, status] = e.detail;
            addNotice('alert-massage-success', 'Comment has deleted!');

            if (e.target.parentElement.parentElement.parentElement.parentElement.children.length === 4) {
                e.target.parentElement.parentElement.parentElement.parentElement.remove();
            } else {
                e.target.parentElement.parentElement.parentElement.remove();
            }
        });
        link.addEventListener("ajax:error", (e) => {
            const [data, status] = e.detail;
            addNotice('alert-massage-warning', data['error']);
        });
    });
}
