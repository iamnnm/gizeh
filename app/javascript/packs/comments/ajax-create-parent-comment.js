import addNotice from '../notices/add-notice';
import deploingFormForCommentaries from './deploing-form-for-commentaries';
import ajaxCreateChildComment from './ajax-create-child-comment';
import ajaxDeleteParentComment from './ajax-delete-parent-comment';

export default function ajaxCreateParentComment () {
    const form = document.querySelector('.new-parent-comment');

    form.addEventListener('ajax:success', (e) => {
        const [data, status] = e.detail;
        const comment = data.querySelector('.comment-main');
        const insert_point = document.querySelector('#insert-parent');

        addNotice('alert-massage-success', 'Comment has created!');
        insert_point.insertAdjacentElement('beforebegin', comment);

        deploingFormForCommentaries();
        ajaxCreateChildComment();
        ajaxDeleteParentComment();
    });
    form.addEventListener('ajax:error', (e) => {
        const [data, status] = e.detail;
        addNotice('alert-massage-warning', data['error']);
    });
}
