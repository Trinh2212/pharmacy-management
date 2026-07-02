import { useState, useEffect } from "react";
import { FaChevronLeft, FaChevronRight } from "react-icons/fa";

const banners = [
  "img/banner/banner4.jpg",
  "img/banner/banner2.webp",
  "img/banner/banner3.jpg",
  "img/banner/banner1.png",
];

export function HeroSection() {
  const [currentIndex, setCurrentIndex] = useState(0);

  const prevSlide = () => {
    const isFirstSlide = currentIndex === 0;
    const newIndex = isFirstSlide ? banners.length - 1 : currentIndex - 1;
    setCurrentIndex(newIndex);
  };

  const nextSlide = () => {
    const isLastSlide = currentIndex === banners.length - 1;
    const newIndex = isLastSlide ? 0 : currentIndex + 1;
    setCurrentIndex(newIndex);
  };

  const goToSlide = (slideIndex) => {
    setCurrentIndex(slideIndex);
  };

  useEffect(() => {
    const autoPlay = setInterval(() => {
      nextSlide();
    }, 20000);
    return () => clearInterval(autoPlay);
  }, [currentIndex]);

  return (
    <section className="max-w-7xl mx-auto px-4 pt-1 pb-6 md:pt-2 md:pb-8">
      <div className="relative w-full h-[250px] sm:h-[350px] md:h-[480px] group overflow-hidden shadow-md bg-gray-100">
        {/* hien thi banner */}
        <div
          style={{ backgroundImage: `url(${banners[currentIndex]})` }}
          className="w-full h-full bg-center bg-cover bg-no-repeat transition-all duration-500 ease-out"
        ></div>

        <button
          onClick={prevSlide}
          className="absolute top-[50%] -translate-y-1/2 left-4 text-xl rounded-full p-2.5 bg-black/30 text-white cursor-pointer hover:bg-black/50 transition opacity-0 group-hover:opacity-100"
        >
          <FaChevronLeft />
        </button>

        <button
          onClick={nextSlide}
          className="absolute top-[50%] -translate-y-1/2 right-4 text-xl rounded-full p-2.5 bg-black/30 text-white cursor-pointer hover:bg-black/50 transition opacity-0 group-hover:opacity-100"
        >
          <FaChevronRight />
        </button>

        <div className="absolute bottom-4 left-0 right-0 flex justify-center gap-2">
          {banners.map((_, slideIndex) => (
            <button
              key={slideIndex}
              onClick={() => goToSlide(slideIndex)}
              className={`h-2.5 rounded-full transition-all duration-300 ${
                currentIndex === slideIndex
                  ? "w-8 bg-white"
                  : "w-2.5 bg-white/50"
              }`}
            ></button>
          ))}
        </div>
      </div>
    </section>
  );
}