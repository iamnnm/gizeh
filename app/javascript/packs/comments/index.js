import deploingFormForCommentaries from './deploing-form-for-commentaries';
import closeFormAfterSubmit from './close-form-after-submit';
import deploingNestedComment from './deploing-nested-comment';
import ajaxCreateParentComment from './ajax-create-parent-comment';
import ajaxDeleteParentComment from './ajax-delete-parent-comment';
import ajaxCreateChildComment from './ajax-create-child-comment';
import ajaxDeleteChildComment from './ajax-delete-child-comment';

document.addEventListener('turbolinks:load', () => {
    deploingFormForCommentaries();
    closeFormAfterSubmit();
    deploingNestedComment();
    ajaxCreateParentComment();
    ajaxDeleteParentComment();
    ajaxCreateChildComment();
    ajaxDeleteChildComment();
});
