import addNotice from "../notices/add-notice";

export default function ajaxDeleteParentComment () {
    const deleteLinks = document.querySelectorAll('.delete-parent-btn');

    deleteLinks.forEach((link) => {
        link.addEventListener("ajax:success", (e) => {
            const [data, status] = e.detail;
            addNotice('alert-massage-success', 'Comment has deleted!');
            link.parentElement.parentElement.remove();
        });
        link.addEventListener("ajax:error", (e) => {
            const [data, status] = e.detail;
            addNotice('alert-massage-warning', data['error']);
        });
    });
}
