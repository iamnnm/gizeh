import addNotice from '../notices/add-notice';
import deploingFormForCommentaries from './deploing-form-for-commentaries';
import deploingNestedComment from './deploing-nested-comment';

export default function ajaxCreateChildComment () {
    const forms = document.querySelectorAll('.new-child-comment');

    forms.forEach((form) => {
        form.addEventListener('ajax:success', (e) => {
            const [data, status] = e.detail;
            let comment = null;
            let insert_point = null;

            const x = e.target.parentElement.parentElement.parentElement;

            if (x.classList.contains('comment-main')) {
                if (x.children.length === 2) {
                    insert_point = x.lastElementChild;
                    comment = data.querySelector('.parent-list');
                } else {
                    insert_point = x.children[1].lastElementChild;
                    comment = data.querySelector('.parent-comment');
                }
            } else {
                if (x.children.length === 2) {
                    insert_point = x.lastElementChild;
                    comment = data.querySelector('.parent-list');
                } else {
                    insert_point = x.children[1].lastElementChild;
                    comment = data.querySelector('.parent-comment');
                }
            }

            addNotice('alert-massage-success', 'Comment has created!');

            insert_point.insertAdjacentElement('beforebegin', comment);
            deploingFormForCommentaries();
            deploingNestedComment();

            insert_point.previousElementSibling.addEventListener('ajax:success', (e) => {
                const [data, status] = e.detail;
                addNotice('alert-massage-success', 'Comment has deleted!');
                e.target.parentElement.parentElement.parentElement.remove();
            });
            insert_point.previousElementSibling.addEventListener('ajax:error', (e) => {
                const [data, status] = e.detail;
                addNotice('alert-massage-warning', data['error']);
            });
        });
        form.addEventListener('ajax:error', (e) => {
            const [data, status] = e.detail;
            addNotice('alert-massage-warning', data['error']);
        });
    })
}
