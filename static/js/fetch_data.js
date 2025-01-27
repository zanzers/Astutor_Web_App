

$(document).ready(function () {
    $.ajax({
        url: '/api/popular-courses',
        method: 'GET',
        dataType: 'json',
        success: function (data) {

            if(data.length > 0) {
                const container = $('.astr-list');

                container.empty();

                data.forEach(function (course) {
                    const courseHtml = `

                    <div class="astr-about-item">
                        <span> ${course.CourseTitle}</span>
                        
                        <span class="astr-total_number pc">${course.TotalEnrollments}</span>

                    `;
                    container.append(courseHtml);
                });
            } else {
                $('.astr-about-list').html('<p> No Courses available.</p>')
            }
        },

        error: function (xhr, status, error){

            console.log('Error fetching courses', error);
            $('.astr-about-list').html('<p>Error loading. Please try again later.</p>')
        }
    });
});