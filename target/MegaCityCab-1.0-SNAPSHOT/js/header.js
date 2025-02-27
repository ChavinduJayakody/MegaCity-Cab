// Initialize Swiper
        const swiper = new Swiper('.swiper-container', {
            // Optional parameters
            loop: true,
            autoplay: {
                delay: 3000,
                disableOnInteraction: false,
            },
            // Pagination
            pagination: {
                el: '.swiper-pagination',
                clickable: true,
            },
            // Navigation arrows
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
        });