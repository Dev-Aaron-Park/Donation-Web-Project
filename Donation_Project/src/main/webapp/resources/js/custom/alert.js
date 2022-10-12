$().ready(function () {
    $(".alertStart").click(function () {
        Swal.fire({
            icon: 'error',                         // Alert 타입
            title: 'Title',         // Alert 제목
            text: 'Contents',  // Alert 내용
        });
    });
});