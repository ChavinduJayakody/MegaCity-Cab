 document.addEventListener('scroll', function() {
    const header = document.querySelector('.header');
    if (window.scrollY > 50) { // Adjust the scroll threshold as needed
      header.classList.add('scrolled');
    } else {
      header.classList.remove('scrolled');
    }
  });
// Landing page
        var swiper = new Swiper('.swiper-container', {
            loop: true,
            autoplay: {
                delay: 3000,
                disableOnInteraction: false,
            },
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
            pagination: {
                el: '.swiper-pagination',
                clickable: true,
            },
        });
        
//  fleet
 var swiper = new Swiper(".mySwiper", {
        slidesPerView: 1,
        spaceBetween: 20,
        loop: true,
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
        breakpoints: {
            768: {
                slidesPerView: 2
            },
            1024: {
                slidesPerView: 3
            }
        }
    });
    
//    testimonials
 var swiper = new Swiper(".testimonialSwiper", {
        slidesPerView: 1,
        spaceBetween: 20,
        loop: true,
        autoplay: {
                delay: 2000,
                disableOnInteraction: false,
            },
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
        grabCursor: true, 
    mousewheel: {
        forceToAxis: true,
    },
        breakpoints: {
            768: {
                slidesPerView: 2
            },
            1024: {
                slidesPerView: 3
            }
        }
    });
    
//    faq 
document.addEventListener("DOMContentLoaded", function () {
    const faqItems = document.querySelectorAll(".faq-item");

    faqItems.forEach(item => {
        const question = item.querySelector(".faq-question");
        const icon = item.querySelector(".faq-toggle i");

        question.addEventListener("click", () => {
            faqItems.forEach(el => {
                if (el !== item) {
                    el.classList.remove("active");
                    el.querySelector(".faq-toggle i").classList.replace("fa-minus", "fa-plus");
                }
            });

            item.classList.toggle("active");

            if (item.classList.contains("active")) {
                icon.classList.replace("fa-plus", "fa-minus");
            } else {
                icon.classList.replace("fa-minus", "fa-plus");
            }
        });
    });
});
        