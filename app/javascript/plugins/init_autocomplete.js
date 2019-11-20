import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('space_address');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
