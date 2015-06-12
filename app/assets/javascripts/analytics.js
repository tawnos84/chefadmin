/**
 * Created by tawnos on 12.06.15.
 */
$(document).on('page:change', function() {
    if (window._gaq != null) {
        return _gaq.push(['_trackPageview']);
    } else if (window.pageTracker != null) {
        return pageTracker._trackPageview();
    }
});
