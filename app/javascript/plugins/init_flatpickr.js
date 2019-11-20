import flatpickr from "flatpickr";

const initFlatpickr = () => {
  const dateInput = document.getElementById('booking_date');
  if (dateInput) {
    console.log('hello');
    flatpickr(dateInput, {
      altInput: true,
      altFormat: "F j, Y",
      dateFormat: "Y-m-d",
      minDate: "today"
    });
  };
};

export { initFlatpickr };
